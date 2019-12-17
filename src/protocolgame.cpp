/**
 * The Forgotten Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2019  Mark Samman <mark.samman@gmail.com>
 *
 * This program is free software; you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation; either version 2 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License along
 * with this program; if not, write to the Free Software Foundation, Inc.,
 * 51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
 */

#include "otpch.h"

#include "protocolgame.h"

#include "outputmessage.h"

#include "player.h"
#include "monsters.h"

#include "configmanager.h"
#include "actions.h"
#include "game.h"
#include "iologindata.h"
#include "iomarket.h"
#include "waitlist.h"
#include "ban.h"
#include "scheduler.h"
#include "spells.h"

extern ConfigManager g_config;
extern Actions actions;
extern CreatureEvents* g_creatureEvents;
extern Chat* g_chat;
extern Spells* g_spells;
extern Monsters g_monsters;

NetworkMessage ProtocolGame::playermsg;

void ProtocolGame::release()
{
	//dispatcher thread
	if (player && player->client == shared_from_this()) {
		player->client.reset();
		player->decrementReferenceCounter();
		player = nullptr;
	}

	OutputMessagePool::getInstance().removeProtocolFromAutosend(shared_from_this());
	Protocol::release();
}

void ProtocolGame::login(const std::string& name, uint32_t accountId, OperatingSystem_t operatingSystem)
{
	//dispatcher thread
	Player* foundPlayer = g_game.getPlayerByName(name);
	if (!foundPlayer || g_config.getBoolean(ConfigManager::ALLOW_CLONES)) {
		player = new Player(getThis());
		player->setName(name);

		player->incrementReferenceCounter();

		if (!IOLoginData::preloadPlayer(player, name)) {
			disconnectClient("Your character could not be loaded.");
			return;
		}

		player->setID();
		if (IOBan::isPlayerNamelocked(player->getGUID())) {
			disconnectClient("Your character has been namelocked.");
			return;
		}

		if (g_game.getGameState() == GAME_STATE_CLOSING && !player->hasFlag(PlayerFlag_CanAlwaysLogin)) {
			disconnectClient("The game is just going down.\nPlease try again later.");
			return;
		}

		if (g_game.getGameState() == GAME_STATE_CLOSED && !player->hasFlag(PlayerFlag_CanAlwaysLogin)) {
			disconnectClient("Server is currently closed.\nPlease try again later.");
			return;
		}

		if (g_config.getBoolean(ConfigManager::ONE_PLAYER_ON_ACCOUNT) && player->getAccountType() < ACCOUNT_TYPE_GAMEMASTER && g_game.getPlayerByAccount(player->getAccount())) {
			disconnectClient("You may only login with one character\nof your account at the same time.");
			return;
		}

		if (!player->hasFlag(PlayerFlag_CannotBeBanned)) {
			BanInfo banInfo;
			if (IOBan::isAccountBanned(accountId, banInfo)) {
				if (banInfo.reason.empty()) {
					banInfo.reason = "(none)";
				}

				std::ostringstream ss;
				if (banInfo.expiresAt > 0) {
					ss << "Your account has been banned until " << formatDateShort(banInfo.expiresAt) << " by " << banInfo.bannedBy << ".\n\nReason specified:\n" << banInfo.reason;
				} else {
					ss << "Your account has been permanently banned by " << banInfo.bannedBy << ".\n\nReason specified:\n" << banInfo.reason;
				}
				disconnectClient(ss.str());
				return;
			}
		}

		WaitingList& waitingList = WaitingList::getInstance();
		if (!waitingList.clientLogin(player)) {
			uint32_t currentSlot = waitingList.getClientSlot(player);
			uint32_t retryTime = WaitingList::getTime(currentSlot);
			std::ostringstream ss;

			ss << "Too many players online.\nYou are at place "
			   << currentSlot << " on the waiting list.";

			auto output = OutputMessagePool::getOutputMessage();
			output->addByte(0x16);
			output->addString(ss.str());
			output->addByte(retryTime);
			send(output);
			disconnect();
			return;
		}

		if (!IOLoginData::loadPlayerById(player, player->getGUID())) {
			disconnectClient("Your character could not be loaded.");
			return;
		}

		player->setOperatingSystem(operatingSystem);

		if (!g_game.placeCreature(player, player->getLoginPosition())) {
			if (!g_game.placeCreature(player, player->getTemplePosition(), false, true)) {
				disconnectClient("Temple position is wrong. Contact the administrator.");
				return;
			}
		}

		if (operatingSystem >= CLIENTOS_OTCLIENT_LINUX) {
			player->registerCreatureEvent("ExtendedOpcode");
		}

		player->lastIP = player->getIP();
		player->lastLoginSaved = std::max<time_t>(time(nullptr), player->lastLoginSaved + 1);
		acceptPackets = true;
	} else {
		if (eventConnect != 0 || !g_config.getBoolean(ConfigManager::REPLACE_KICK_ON_LOGIN)) {
			//Already trying to connect
			disconnectClient("You are already logged in.");
			return;
		}

		if (foundPlayer->client) {
			foundPlayer->disconnect();
			foundPlayer->isConnecting = true;

			eventConnect = g_scheduler.addEvent(createSchedulerTask(1000, std::bind(&ProtocolGame::connect, getThis(), foundPlayer->getID(), operatingSystem)));
		} else {
			connect(foundPlayer->getID(), operatingSystem);
		}
	}
	OutputMessagePool::getInstance().addProtocolToAutosend(shared_from_this());
}

void ProtocolGame::connect(uint32_t playerId, OperatingSystem_t operatingSystem)
{
	eventConnect = 0;

	Player* foundPlayer = g_game.getPlayerByID(playerId);
	if (!foundPlayer || foundPlayer->client) {
		disconnectClient("You are already logged in.");
		return;
	}

	if (isConnectionExpired()) {
		//ProtocolGame::release() has been called at this point and the Connection object
		//no longer exists, so we return to prevent leakage of the Player.
		return;
	}

	player = foundPlayer;
	player->incrementReferenceCounter();

	g_chat->removeUserFromAllChannels(*player);
	player->clearModalWindows();
	player->setOperatingSystem(operatingSystem);
	player->isConnecting = false;

	player->client = getThis();
	sendAddCreature(player, player->getPosition(), 0, false);
	player->lastIP = player->getIP();
	player->lastLoginSaved = std::max<time_t>(time(nullptr), player->lastLoginSaved + 1);
	acceptPackets = true;
}

void ProtocolGame::logout(bool displayEffect, bool forced)
{
	//dispatcher thread
	if (!player) {
		return;
	}

	if (!player->isRemoved()) {
		if (!forced) {
			if (!player->isAccessPlayer()) {
				if (player->getTile()->hasFlag(TILESTATE_NOLOGOUT)) {
					player->sendCancelMessage(RETURNVALUE_YOUCANNOTLOGOUTHERE);
					return;
				}

				if (!player->getTile()->hasFlag(TILESTATE_PROTECTIONZONE) && player->hasCondition(CONDITION_INFIGHT)) {
					player->sendCancelMessage(RETURNVALUE_YOUMAYNOTLOGOUTDURINGAFIGHT);
					return;
				}
			}

			//scripting event - onLogout
			if (!g_creatureEvents->playerLogout(player)) {
				//Let the script handle the error message
				return;
			}
		}

		if (displayEffect && player->getHealth() > 0) {
			g_game.addMagicEffect(player->getPosition(), CONST_ME_POFF);
		}
	}

	disconnect();

	g_game.removeCreature(player);
}

void ProtocolGame::onRecvFirstMessage(NetworkMessage& msg)
{
	if (g_game.getGameState() == GAME_STATE_SHUTDOWN) {
		disconnect();
		return;
	}

	OperatingSystem_t operatingSystem = static_cast<OperatingSystem_t>(msg.get<uint16_t>());
	version = msg.get<uint16_t>();
	if (version >= 1111) {
		setChecksumMethod(CHECKSUM_METHOD_SEQUENCE);
	} else if (version >= 830) {
		setChecksumMethod(CHECKSUM_METHOD_ADLER32);
	}

	uint32_t clientVersion = msg.get<uint32_t>();
	msg.skipBytes(3); // U8 client type, U16 dat revision

	if (clientVersion >= 1149 && clientVersion < 1200) {
		if(msg.getLength() - msg.getBufferPosition() > 128) {
			addExivaRestrictions = true;
			msg.skipBytes(1);
		}
	}

	if (!Protocol::RSA_decrypt(msg)) {
		disconnect();
		return;
	}
	
	uint32_t key[4] = {msg.get<uint32_t>(), msg.get<uint32_t>(), msg.get<uint32_t>(), msg.get<uint32_t>()};
	enableXTEAEncryption();
	setXTEAKey(key);

	if (operatingSystem >= CLIENTOS_OTCLIENT_LINUX) {
		NetworkMessage opcodeMessage;
		opcodeMessage.addByte(0x32);
		opcodeMessage.addByte(0x00);
		opcodeMessage.add<uint16_t>(0x00);
		writeToOutputBuffer(opcodeMessage);
	}

	msg.skipBytes(1); // gamemaster flag

	std::string sessionKey = msg.getString();

	auto sessionArgs = explodeString(sessionKey, "\n", 4);
	if (sessionArgs.size() != 4) {
		disconnect();
		return;
	}

	std::string& accountName = sessionArgs[0];
	std::string& password = sessionArgs[1];
	std::string& token = sessionArgs[2];
	uint32_t tokenTime = 0;
	try {
		tokenTime = std::stoul(sessionArgs[3]);
	} catch (const std::invalid_argument&) {
		disconnectClient("Malformed token packet.");
		return;
	} catch (const std::out_of_range&) {
		disconnectClient("Token time is too long.");
		return;
	}

	if (accountName.empty()) {
		disconnectClient("You must enter your account name.");
		return;
	}

	std::string characterName = msg.getString();

	uint32_t timeStamp = msg.get<uint32_t>();
	uint8_t randNumber = msg.getByte();
	if (challengeTimestamp != timeStamp || challengeRandom != randNumber) {
		disconnect();
		return;
	}

	if (version < CLIENT_VERSION_MIN || version > CLIENT_VERSION_MAX) {
		std::ostringstream ss;
		ss << "Only clients with protocol " << CLIENT_VERSION_STR << " allowed!";
		disconnectClient(ss.str());
		return;
	}

	if (g_game.getGameState() == GAME_STATE_STARTUP) {
		disconnectClient("Gameworld is starting up. Please wait.");
		return;
	}

	if (g_game.getGameState() == GAME_STATE_MAINTAIN) {
		disconnectClient("Gameworld is under maintenance. Please re-connect in a while.");
		return;
	}

	BanInfo banInfo;
	if (IOBan::isIpBanned(getIP(), banInfo)) {
		if (banInfo.reason.empty()) {
			banInfo.reason = "(none)";
		}

		std::ostringstream ss;
		ss << "Your IP has been banned until " << formatDateShort(banInfo.expiresAt) << " by " << banInfo.bannedBy << ".\n\nReason specified:\n" << banInfo.reason;
		disconnectClient(ss.str());
		return;
	}

	uint32_t accountId = IOLoginData::gameworldAuthentication(accountName, password, characterName, token, tokenTime);
	if (accountId == 0) {
		disconnectClient("Account name or password is not correct.");
		return;
	}

	g_dispatcher.addTask(createTask(std::bind(&ProtocolGame::login, getThis(), characterName, accountId, operatingSystem)));
}

void ProtocolGame::onConnect()
{
	auto output = OutputMessagePool::getOutputMessage();
	static std::random_device rd;
	static std::ranlux24 generator(rd());
	static std::uniform_int_distribution<uint16_t> randNumber(0x00, 0xFF);

	// Skip checksum
	output->skipBytes(sizeof(uint32_t));

	// Packet length & type
	output->add<uint16_t>(0x0006);
	output->addByte(0x1F);

	// Add timestamp & random number
	challengeTimestamp = static_cast<uint32_t>(time(nullptr));
	output->add<uint32_t>(challengeTimestamp);

	challengeRandom = randNumber(generator);
	output->addByte(challengeRandom);

	// Go back and write checksum
	output->skipBytes(-12);
	output->add<uint32_t>(adlerChecksum(output->getOutputBuffer() + sizeof(uint32_t), 8));

	send(output);
}

void ProtocolGame::disconnectClient(const std::string& message) const
{
	auto output = OutputMessagePool::getOutputMessage();
	output->addByte(0x14);
	output->addString(message);
	send(output);
	disconnect();
}

void ProtocolGame::writeToOutputBuffer(const NetworkMessage& msg)
{
	auto out = getOutputBuffer(msg.getLength());
	out->append(msg);
}

void ProtocolGame::parsePacket(NetworkMessage& msg)
{
	if (!acceptPackets || g_game.getGameState() == GAME_STATE_SHUTDOWN || msg.getLength() <= 0) {
		return;
	}

	uint8_t recvbyte = msg.getByte();

	if (!player) {
		if (recvbyte == 0x0F) {
			disconnect();
		}

		return;
	}

	//a dead player can not performs actions
	if (player->isRemoved() || player->getHealth() <= 0) {
		if (recvbyte == 0x0F) {
			disconnect();
			return;
		}

		if (recvbyte != 0x14) {
			return;
		}
	}

	switch (recvbyte) {
		case 0x0F: /* enter world */ break;
		case 0x14: g_dispatcher.addTask(createTask(std::bind(&ProtocolGame::logout, getThis(), true, false))); break;
		case 0x1C: /* connection ping back */ break;
		case 0x1D: addGameTask(&Game::playerReceivePingBack, player->getID()); break;
		case 0x1E: addGameTask(&Game::playerReceivePing, player->getID()); break;
		case 0x32: parseExtendedOpcode(msg); break; //otclient extended opcode
		case 0x64: parseAutoWalk(msg); break;
		case 0x65: addGameTask(&Game::playerMove, player->getID(), DIRECTION_NORTH); break;
		case 0x66: addGameTask(&Game::playerMove, player->getID(), DIRECTION_EAST); break;
		case 0x67: addGameTask(&Game::playerMove, player->getID(), DIRECTION_SOUTH); break;
		case 0x68: addGameTask(&Game::playerMove, player->getID(), DIRECTION_WEST); break;
		case 0x69: addGameTask(&Game::playerStopAutoWalk, player->getID()); break;
		case 0x6A: addGameTask(&Game::playerMove, player->getID(), DIRECTION_NORTHEAST); break;
		case 0x6B: addGameTask(&Game::playerMove, player->getID(), DIRECTION_SOUTHEAST); break;
		case 0x6C: addGameTask(&Game::playerMove, player->getID(), DIRECTION_SOUTHWEST); break;
		case 0x6D: addGameTask(&Game::playerMove, player->getID(), DIRECTION_NORTHWEST); break;
		case 0x6F: addGameTaskTimed(DISPATCHER_TASK_EXPIRATION, &Game::playerTurn, player->getID(), DIRECTION_NORTH); break;
		case 0x70: addGameTaskTimed(DISPATCHER_TASK_EXPIRATION, &Game::playerTurn, player->getID(), DIRECTION_EAST); break;
		case 0x71: addGameTaskTimed(DISPATCHER_TASK_EXPIRATION, &Game::playerTurn, player->getID(), DIRECTION_SOUTH); break;
		case 0x72: addGameTaskTimed(DISPATCHER_TASK_EXPIRATION, &Game::playerTurn, player->getID(), DIRECTION_WEST); break;
		case 0x77: parseEquipObject(msg); break;
		case 0x78: parseThrow(msg); break;
		case 0x79: parseLookInShop(msg); break;
		case 0x7A: parsePlayerPurchase(msg); break;
		case 0x7B: parsePlayerSale(msg); break;
		case 0x7C: addGameTask(&Game::playerCloseShop, player->getID()); break;
		case 0x7D: parseRequestTrade(msg); break;
		case 0x7E: parseLookInTrade(msg); break;
		case 0x7F: addGameTask(&Game::playerAcceptTrade, player->getID()); break;
		case 0x80: addGameTask(&Game::playerCloseTrade, player->getID()); break;
		case 0x82: parseUseItem(msg); break;
		case 0x83: parseUseItemEx(msg); break;
		case 0x84: parseUseWithCreature(msg); break;
		case 0x85: parseRotateItem(msg); break;
		case 0x87: parseCloseContainer(msg); break;
		case 0x88: parseUpArrowContainer(msg); break;
		case 0x89: parseTextWindow(msg); break;
		case 0x8A: parseHouseWindow(msg); break;
		case 0x8B: parseWrapableItem(msg); break;
		case 0x8C: parseLookAt(msg); break;
		case 0x8D: parseLookInBattleList(msg); break;
		case 0x8E: /* join aggression */ break;
		case 0x96: parseSay(msg); break;
		case 0x97: addGameTask(&Game::playerRequestChannels, player->getID()); break;
		case 0x98: parseOpenChannel(msg); break;
		case 0x99: parseCloseChannel(msg); break;
		case 0x9A: parseOpenPrivateChannel(msg); break;
		case 0x9E: addGameTask(&Game::playerCloseNpcChannel, player->getID()); break;
		case 0xA0: parseFightModes(msg); break;
		case 0xA1: parseAttack(msg); break;
		case 0xA2: parseFollow(msg); break;
		case 0xA3: parseInviteToParty(msg); break;
		case 0xA4: parseJoinParty(msg); break;
		case 0xA5: parseRevokePartyInvite(msg); break;
		case 0xA6: parsePassPartyLeadership(msg); break;
		case 0xA7: addGameTask(&Game::playerLeaveParty, player->getID()); break;
		case 0xA8: parseEnableSharedPartyExperience(msg); break;
		case 0xAA: addGameTask(&Game::playerCreatePrivateChannel, player->getID()); break;
		case 0xAB: parseChannelInvite(msg); break;
		case 0xAC: parseChannelExclude(msg); break;
		case 0xBE: addGameTask(&Game::playerCancelAttackAndFollow, player->getID()); break;
		case 0xC7: parseTournamentLeaderboard(msg); break;
		case 0xC9: /* update tile */ break;
		case 0xCA: parseUpdateContainer(msg); break;
		case 0xCB: parseBrowseField(msg); break;
		case 0xCC: parseSeekInContainer(msg); break;
		case 0xD2: addGameTask(&Game::playerRequestOutfit, player->getID()); break;
		case 0xD3: parseSetOutfit(msg); break;
		case 0xD4: parseToggleMount(msg); break;
		case 0xDC: parseAddVip(msg); break;
		case 0xDD: parseRemoveVip(msg); break;
		case 0xDE: parseEditVip(msg); break;
		case 0xE1: addGameTask(&Game::playerMonsterCyclopedia, player->getID()); break;
		case 0xE2: parseCyclopediaMonsters(msg); break;
		case 0xE3: parseCyclopediaRace(msg); break;
		case 0xE5: parseCyclopediaCharacterInfo(msg); break;
		case 0xE6: parseBugReport(msg); break;
		case 0xE7: /* thank you */ break;
		case 0xE8: parseDebugAssert(msg); break;
		case 0xF0: addGameTaskTimed(DISPATCHER_TASK_EXPIRATION, &Game::playerShowQuestLog, player->getID()); break;
		case 0xF1: parseQuestLine(msg); break;
		case 0xF2: parseRuleViolationReport(msg); break;
		case 0xF3: /* get object info */ break;
		case 0xF4: parseMarketLeave(); break;
		case 0xF5: parseMarketBrowse(msg); break;
		case 0xF6: parseMarketCreateOffer(msg); break;
		case 0xF7: parseMarketCancelOffer(msg); break;
		case 0xF8: parseMarketAcceptOffer(msg); break;
		case 0xF9: parseModalWindowAnswer(msg); break;

		default:
			// std::cout << "Player: " << player->getName() << " sent an unknown packet header: 0x" << std::hex << static_cast<uint16_t>(recvbyte) << std::dec << "!" << std::endl;
			break;
	}

	if (msg.isOverrun()) {
		disconnect();
	}
}

void ProtocolGame::GetTileDescription(const Tile* tile)
{
	if (version < 1200) {
		playermsg.add<uint16_t>(0x00); //environmental effects
	}

	int32_t count;
	Item* ground = tile->getGround();
	if (ground) {
		AddItem(ground);
		count = 1;
	} else {
		count = 0;
	}

	const TileItemVector* items = tile->getItemList();
	if (items) {
		for (auto it = items->getBeginTopItem(), end = items->getEndTopItem(); it != end; ++it) {
			AddItem(*it);
			if (++count == 10) {
				break;
			}
		}
	}

	const CreatureVector* creatures = tile->getCreatures();
	if (creatures) {
		bool playerAdded = false;
		if (count < 10) {
			for (auto it = creatures->rbegin(), end = creatures->rend(); it != end; ++it) {
				const Creature* creature = (*it);
				if (!player->canSeeCreature(creature)) {
					continue;
				}

				if (creature->getID() == player->getID()) {
					playerAdded = true;
				}

				bool known;
				uint32_t removedKnown;
				checkCreatureAsKnown(creature->getID(), known, removedKnown);
				AddCreature(creature, known, removedKnown);
				if (++count == 10) {
					break;
				}
			}
		}
		if (!playerAdded && tile->getPosition() == player->getPosition()) {
			const Creature* creature = player;

			bool known;
			uint32_t removedKnown;
			checkCreatureAsKnown(creature->getID(), known, removedKnown);
			AddCreature(creature, known, removedKnown);
		}
	}

	if (items && count < 10) {
		for (auto it = items->getBeginDownItem(), end = items->getEndDownItem(); it != end; ++it) {
			AddItem(*it);
			if (++count == 10) {
				return;
			}
		}
	}
}

void ProtocolGame::GetMapDescription(int32_t x, int32_t y, int32_t z, int32_t width, int32_t height)
{
	int32_t skip = -1;
	int32_t startz, endz, zstep;
	if (z > 7) {
		startz = z - 2;
		endz = std::min<int32_t>(MAP_MAX_LAYERS - 1, z + 2);
		zstep = 1;
	} else {
		startz = 7;
		endz = 0;
		zstep = -1;
	}

	for (int32_t nz = startz; nz != endz + zstep; nz += zstep) {
		GetFloorDescription(x, y, nz, width, height, z - nz, skip);
	}

	if (skip >= 0) {
		playermsg.addByte(skip);
		playermsg.addByte(0xFF);
	}
}

void ProtocolGame::GetFloorDescription(int32_t x, int32_t y, int32_t z, int32_t width, int32_t height, int32_t offset, int32_t& skip)
{
	std::vector<Tile*> tileVector = g_game.map.getFloorTiles(x + offset, y + offset, width, height, z);
	for (Tile* tile : tileVector) {
		if (tile) {
			if (skip >= 0) {
				playermsg.addByte(skip);
				playermsg.addByte(0xFF);
			}

			skip = 0;
			GetTileDescription(tile);
		} else if (skip == 0xFE) {
			playermsg.addByte(0xFF);
			playermsg.addByte(0xFF);
			skip = -1;
		} else {
			++skip;
		}
	}
}

void ProtocolGame::checkCreatureAsKnown(uint32_t id, bool& known, uint32_t& removedKnown)
{
	auto result = knownCreatureSet.insert(id);
	if (!result.second) {
		known = true;
		return;
	}

	known = false;
	if (knownCreatureSet.size() > 1300) {
		// Look for a creature to remove
		for (auto it = knownCreatureSet.begin(), end = knownCreatureSet.end(); it != end; ++it) {
			Creature* creature = g_game.getCreatureByID(*it);
			if (!canSee(creature)) {
				removedKnown = *it;
				knownCreatureSet.erase(it);
				return;
			}
		}

		// Bad situation. Let's just remove anyone.
		auto it = knownCreatureSet.begin();
		if (*it == id) {
			++it;
		}

		removedKnown = *it;
		knownCreatureSet.erase(it);
	} else {
		removedKnown = 0;
	}
}

bool ProtocolGame::canSee(const Creature* c) const
{
	if (!c || !player || c->isRemoved()) {
		return false;
	}

	if (!player->canSeeCreature(c)) {
		return false;
	}

	return canSee(c->getPosition());
}

bool ProtocolGame::canSee(const Position& pos) const
{
	return canSee(pos.x, pos.y, pos.z);
}

bool ProtocolGame::canSee(int32_t x, int32_t y, int32_t z) const
{
	if (!player) {
		return false;
	}

	const Position& myPos = player->getPosition();
	if (myPos.z <= 7) {
		//we are on ground level or above (7 -> 0)
		//view is from 7 -> 0
		if (z > 7) {
			return false;
		}
	} else if (myPos.z >= 8) {
		//we are underground (8 -> 15)
		//view is +/- 2 from the floor we stand on
		if (std::abs(myPos.getZ() - z) > 2) {
			return false;
		}
	}

	//negative offset means that the action taken place is on a lower floor than ourself
	int32_t offsetz = myPos.getZ() - z;
	if ((x >= myPos.getX() - 8 + offsetz) && (x <= myPos.getX() + 9 + offsetz) &&
	        (y >= myPos.getY() - 6 + offsetz) && (y <= myPos.getY() + 7 + offsetz)) {
		return true;
	}
	return false;
}

// Parse methods
void ProtocolGame::parseChannelInvite(NetworkMessage& msg)
{
	const std::string name = msg.getString();
	addGameTask(&Game::playerChannelInvite, player->getID(), name);
}

void ProtocolGame::parseChannelExclude(NetworkMessage& msg)
{
	const std::string name = msg.getString();
	addGameTask(&Game::playerChannelExclude, player->getID(), name);
}

void ProtocolGame::parseOpenChannel(NetworkMessage& msg)
{
	uint16_t channelId = msg.get<uint16_t>();
	addGameTask(&Game::playerOpenChannel, player->getID(), channelId);
}

void ProtocolGame::parseCloseChannel(NetworkMessage& msg)
{
	uint16_t channelId = msg.get<uint16_t>();
	addGameTask(&Game::playerCloseChannel, player->getID(), channelId);
}

void ProtocolGame::parseOpenPrivateChannel(NetworkMessage& msg)
{
	const std::string receiver = msg.getString();
	addGameTask(&Game::playerOpenPrivateChannel, player->getID(), receiver);
}

void ProtocolGame::parseAutoWalk(NetworkMessage& msg)
{
	uint8_t numdirs = msg.getByte();
	if (numdirs == 0 || (msg.getBufferPosition() + numdirs) != (msg.getLength() + 8)) {
		return;
	}

	msg.skipBytes(numdirs);

	std::vector<Direction> path;
	path.reserve(numdirs);
	for (uint8_t i = 0; i < numdirs; ++i) {
		uint8_t rawdir = msg.getPreviousByte();
		switch (rawdir) {
			case 1: path.emplace_back(DIRECTION_EAST); break;
			case 2: path.emplace_back(DIRECTION_NORTHEAST); break;
			case 3: path.emplace_back(DIRECTION_NORTH); break;
			case 4: path.emplace_back(DIRECTION_NORTHWEST); break;
			case 5: path.emplace_back(DIRECTION_WEST); break;
			case 6: path.emplace_back(DIRECTION_SOUTHWEST); break;
			case 7: path.emplace_back(DIRECTION_SOUTH); break;
			case 8: path.emplace_back(DIRECTION_SOUTHEAST); break;
			default: break;
		}
	}

	if (path.empty()) {
		return;
	}

	addGameTask(&Game::playerAutoWalk, player->getID(), path);
}

void ProtocolGame::parseSetOutfit(NetworkMessage& msg)
{
	uint8_t outfitType = 0;
	if (version >= 1220) {//Maybe some versions before? but I don't have executable to check
		outfitType = msg.getByte();
	}

	Outfit_t newOutfit;
	newOutfit.lookType = msg.get<uint16_t>();
	newOutfit.lookHead = msg.getByte();
	newOutfit.lookBody = msg.getByte();
	newOutfit.lookLegs = msg.getByte();
	newOutfit.lookFeet = msg.getByte();
	newOutfit.lookAddons = msg.getByte();
	if (outfitType == 0) {
		newOutfit.lookMount = msg.get<uint16_t>();
	} else if (outfitType == 1) {
		//This value probably has something to do with try outfit variable inside outfit window dialog
		//if try outfit is set to 2 it expects uint32_t value after mounted and disable mounts from outfit window dialog
		newOutfit.lookMount = 0;
		msg.get<uint32_t>();
	}
	addGameTask(&Game::playerChangeOutfit, player->getID(), newOutfit);
}

void ProtocolGame::parseToggleMount(NetworkMessage& msg)
{
	bool mount = msg.getByte() != 0;
	addGameTask(&Game::playerToggleMount, player->getID(), mount);
}

void ProtocolGame::parseUseItem(NetworkMessage& msg)
{
	Position pos = msg.getPosition();
	uint16_t spriteId = msg.get<uint16_t>();
	uint8_t stackpos = msg.getByte();
	uint8_t index = msg.getByte();
	addGameTaskTimed(DISPATCHER_TASK_EXPIRATION, &Game::playerUseItem, player->getID(), pos, stackpos, index, spriteId);
}

void ProtocolGame::parseUseItemEx(NetworkMessage& msg)
{
	Position fromPos = msg.getPosition();
	uint16_t fromSpriteId = msg.get<uint16_t>();
	uint8_t fromStackPos = msg.getByte();
	Position toPos = msg.getPosition();
	uint16_t toSpriteId = msg.get<uint16_t>();
	uint8_t toStackPos = msg.getByte();
	addGameTaskTimed(DISPATCHER_TASK_EXPIRATION, &Game::playerUseItemEx, player->getID(), fromPos, fromStackPos, fromSpriteId, toPos, toStackPos, toSpriteId);
}

void ProtocolGame::parseUseWithCreature(NetworkMessage& msg)
{
	Position fromPos = msg.getPosition();
	uint16_t spriteId = msg.get<uint16_t>();
	uint8_t fromStackPos = msg.getByte();
	uint32_t creatureId = msg.get<uint32_t>();
	addGameTaskTimed(DISPATCHER_TASK_EXPIRATION, &Game::playerUseWithCreature, player->getID(), fromPos, fromStackPos, creatureId, spriteId);
}

void ProtocolGame::parseCloseContainer(NetworkMessage& msg)
{
	uint8_t cid = msg.getByte();
	addGameTask(&Game::playerCloseContainer, player->getID(), cid);
}

void ProtocolGame::parseUpArrowContainer(NetworkMessage& msg)
{
	uint8_t cid = msg.getByte();
	addGameTask(&Game::playerMoveUpContainer, player->getID(), cid);
}

void ProtocolGame::parseUpdateContainer(NetworkMessage& msg)
{
	uint8_t cid = msg.getByte();
	addGameTask(&Game::playerUpdateContainer, player->getID(), cid);
}

void ProtocolGame::parseThrow(NetworkMessage& msg)
{
	Position fromPos = msg.getPosition();
	uint16_t spriteId = msg.get<uint16_t>();
	uint8_t fromStackpos = msg.getByte();
	Position toPos = msg.getPosition();
	uint8_t count = msg.getByte();
	if (toPos != fromPos) {
		addGameTaskTimed(DISPATCHER_TASK_EXPIRATION, &Game::playerMoveThing, player->getID(), fromPos, spriteId, fromStackpos, toPos, count);
	}
}

void ProtocolGame::parseWrapableItem(NetworkMessage& msg)
{
	Position pos = msg.getPosition();
	uint16_t spriteId = msg.get<uint16_t>();
	uint8_t stackpos = msg.getByte();
	addGameTaskTimed(DISPATCHER_TASK_EXPIRATION, &Game::playerWrapableItem, player->getID(), pos, stackpos, spriteId);
}

void ProtocolGame::parseLookAt(NetworkMessage& msg)
{
	Position pos = msg.getPosition();
	msg.skipBytes(2); // spriteId
	uint8_t stackpos = msg.getByte();
	addGameTaskTimed(DISPATCHER_TASK_EXPIRATION, &Game::playerLookAt, player->getID(), pos, stackpos);
}

void ProtocolGame::parseLookInBattleList(NetworkMessage& msg)
{
	uint32_t creatureId = msg.get<uint32_t>();
	addGameTaskTimed(DISPATCHER_TASK_EXPIRATION, &Game::playerLookInBattleList, player->getID(), creatureId);
}

void ProtocolGame::parseSay(NetworkMessage& msg)
{
	std::string receiver;
	uint16_t channelId;

	SpeakClasses type = static_cast<SpeakClasses>(msg.getByte());
	switch (type) {
		case TALKTYPE_PRIVATE_TO:
		case TALKTYPE_PRIVATE_RED_TO:
			receiver = msg.getString();
			channelId = 0;
			break;

		case TALKTYPE_CHANNEL_Y:
		case TALKTYPE_CHANNEL_R1:
			channelId = msg.get<uint16_t>();
			break;

		default:
			channelId = 0;
			break;
	}

	std::string text = msg.getString();
	trimString(text);
	if (text.empty() || text.length() > 255) {
		return;
	}

	addGameTask(&Game::playerSay, player->getID(), channelId, type, receiver, text);
}

void ProtocolGame::parseFightModes(NetworkMessage& msg)
{
	uint8_t rawFightMode = msg.getByte(); // 1 - offensive, 2 - balanced, 3 - defensive
	uint8_t rawChaseMode = msg.getByte(); // 0 - stand while fightning, 1 - chase opponent
	uint8_t rawSecureMode = msg.getByte(); // 0 - can't attack unmarked, 1 - can attack unmarked
	// uint8_t rawPvpMode = msg.getByte(); // pvp mode introduced in 10.0

	fightMode_t fightMode;
	if (rawFightMode == 1) {
		fightMode = FIGHTMODE_ATTACK;
	} else if (rawFightMode == 2) {
		fightMode = FIGHTMODE_BALANCED;
	} else {
		fightMode = FIGHTMODE_DEFENSE;
	}

	addGameTask(&Game::playerSetFightModes, player->getID(), fightMode, rawChaseMode != 0, rawSecureMode != 0);
}

void ProtocolGame::parseAttack(NetworkMessage& msg)
{
	uint32_t creatureId = msg.get<uint32_t>();
	addGameTask(&Game::playerSetAttackedCreature, player->getID(), creatureId);
}

void ProtocolGame::parseFollow(NetworkMessage& msg)
{
	uint32_t creatureId = msg.get<uint32_t>();
	addGameTask(&Game::playerFollowCreature, player->getID(), creatureId);
}

void ProtocolGame::parseEquipObject(NetworkMessage& msg)
{
	uint16_t spriteId = msg.get<uint16_t>();
	// msg.get<uint8_t>();

	addGameTaskTimed(DISPATCHER_TASK_EXPIRATION, &Game::playerEquipItem, player->getID(), spriteId);
}

void ProtocolGame::parseTextWindow(NetworkMessage& msg)
{
	uint32_t windowTextId = msg.get<uint32_t>();
	const std::string newText = msg.getString();
	addGameTask(&Game::playerWriteItem, player->getID(), windowTextId, newText);
}

void ProtocolGame::parseHouseWindow(NetworkMessage& msg)
{
	uint8_t doorId = msg.getByte();
	uint32_t id = msg.get<uint32_t>();
	const std::string text = msg.getString();
	addGameTask(&Game::playerUpdateHouseWindow, player->getID(), doorId, id, text);
}

void ProtocolGame::parseLookInShop(NetworkMessage& msg)
{
	uint16_t id = msg.get<uint16_t>();
	uint8_t count = msg.getByte();
	addGameTaskTimed(DISPATCHER_TASK_EXPIRATION, &Game::playerLookInShop, player->getID(), id, count);
}

void ProtocolGame::parsePlayerPurchase(NetworkMessage& msg)
{
	uint16_t id = msg.get<uint16_t>();
	uint8_t count = msg.getByte();
	uint8_t amount = msg.getByte();
	bool ignoreCap = msg.getByte() != 0;
	bool inBackpacks = msg.getByte() != 0;
	addGameTaskTimed(DISPATCHER_TASK_EXPIRATION, &Game::playerPurchaseItem, player->getID(), id, count, amount, ignoreCap, inBackpacks);
}

void ProtocolGame::parsePlayerSale(NetworkMessage& msg)
{
	uint16_t id = msg.get<uint16_t>();
	uint8_t count = msg.getByte();
	uint8_t amount = msg.getByte();
	bool ignoreEquipped = msg.getByte() != 0;
	addGameTaskTimed(DISPATCHER_TASK_EXPIRATION, &Game::playerSellItem, player->getID(), id, count, amount, ignoreEquipped);
}

void ProtocolGame::parseRequestTrade(NetworkMessage& msg)
{
	Position pos = msg.getPosition();
	uint16_t spriteId = msg.get<uint16_t>();
	uint8_t stackpos = msg.getByte();
	uint32_t playerId = msg.get<uint32_t>();
	addGameTask(&Game::playerRequestTrade, player->getID(), pos, stackpos, playerId, spriteId);
}

void ProtocolGame::parseLookInTrade(NetworkMessage& msg)
{
	bool counterOffer = (msg.getByte() == 0x01);
	uint8_t index = msg.getByte();
	addGameTaskTimed(DISPATCHER_TASK_EXPIRATION, &Game::playerLookInTrade, player->getID(), counterOffer, index);
}

void ProtocolGame::parseAddVip(NetworkMessage& msg)
{
	const std::string name = msg.getString();
	addGameTask(&Game::playerRequestAddVip, player->getID(), name);
}

void ProtocolGame::parseRemoveVip(NetworkMessage& msg)
{
	uint32_t guid = msg.get<uint32_t>();
	addGameTask(&Game::playerRequestRemoveVip, player->getID(), guid);
}

void ProtocolGame::parseEditVip(NetworkMessage& msg)
{
	uint32_t guid = msg.get<uint32_t>();
	const std::string description = msg.getString();
	uint32_t icon = std::min<uint32_t>(10, msg.get<uint32_t>()); // 10 is max icon in 9.63
	bool notify = msg.getByte() != 0;
	addGameTask(&Game::playerRequestEditVip, player->getID(), guid, description, icon, notify);
}

void ProtocolGame::parseRotateItem(NetworkMessage& msg)
{
	Position pos = msg.getPosition();
	uint16_t spriteId = msg.get<uint16_t>();
	uint8_t stackpos = msg.getByte();
	addGameTaskTimed(DISPATCHER_TASK_EXPIRATION, &Game::playerRotateItem, player->getID(), pos, stackpos, spriteId);
}

void ProtocolGame::parseRuleViolationReport(NetworkMessage& msg)
{
	uint8_t reportType = msg.getByte();
	uint8_t reportReason = msg.getByte();
	const std::string& targetName = msg.getString();
	const std::string& comment = msg.getString();
	std::string translation;
	if (reportType == REPORT_TYPE_NAME) {
		translation = msg.getString();
	} else if (reportType == REPORT_TYPE_STATEMENT) {
		translation = msg.getString();
		msg.get<uint32_t>(); // statement id, used to get whatever player have said, we don't log that.
	}

	addGameTask(&Game::playerReportRuleViolation, player->getID(), targetName, reportType, reportReason, comment, translation);
}

void ProtocolGame::parseCyclopediaMonsters(NetworkMessage& msg)
{
	std::string race;
	if (version >= 1215) {
		uint8_t type = msg.getByte();
		if(type != 0)
			return;

		race = msg.getString();
	} else {
		race = msg.getString();
	}

	addGameTask(&Game::playerCyclopediaMonsters, player->getID(), race);
}

void ProtocolGame::parseCyclopediaRace(NetworkMessage& msg)
{
	uint16_t monsterId = msg.get<uint16_t>();
	addGameTask(&Game::playerCyclopediaRace, player->getID(), monsterId);
}

void ProtocolGame::parseCyclopediaCharacterInfo(NetworkMessage& msg)
{
	CyclopediaCharacterInfoType_t characterInfoType;
	if (version >= 1215) {
		msg.get<uint32_t>();
		characterInfoType = static_cast<CyclopediaCharacterInfoType_t>(msg.getByte());
	} else {
		characterInfoType = static_cast<CyclopediaCharacterInfoType_t>(msg.getByte());
	}

	addGameTask(&Game::playerCyclopediaCharacterInfo, player->getID(), characterInfoType);
}

void ProtocolGame::parseTournamentLeaderboard(NetworkMessage& msg)
{
	uint8_t ledaerboardType = msg.getByte();
	if(ledaerboardType == 0)
	{
		const std::string worldName = msg.getString();
		uint16_t currentPage = msg.get<uint16_t>();
		(void)worldName;
		(void)currentPage;
	}
	else if(ledaerboardType == 1)
	{
		const std::string worldName = msg.getString();
		const std::string characterName = msg.getString();
		(void)worldName;
		(void)characterName;
	}
	uint8_t elementsPerPage = msg.getByte();
	(void)elementsPerPage;

	addGameTask(&Game::playerTournamentLeaderboard, player->getID(), ledaerboardType);
}

void ProtocolGame::parseBugReport(NetworkMessage& msg)
{
	uint8_t category = msg.getByte();
	std::string message = msg.getString();

	Position position;
	if (category == BUG_CATEGORY_MAP) {
		position = msg.getPosition();
	}

	addGameTask(&Game::playerReportBug, player->getID(), message, position, category);
}

void ProtocolGame::parseDebugAssert(NetworkMessage& msg)
{
	if (debugAssertSent) {
		return;
	}

	debugAssertSent = true;

	std::string assertLine = msg.getString();
	std::string date = msg.getString();
	std::string description = msg.getString();
	std::string comment = msg.getString();
	addGameTask(&Game::playerDebugAssert, player->getID(), assertLine, date, description, comment);
}

void ProtocolGame::parseInviteToParty(NetworkMessage& msg)
{
	uint32_t targetId = msg.get<uint32_t>();
	addGameTask(&Game::playerInviteToParty, player->getID(), targetId);
}

void ProtocolGame::parseJoinParty(NetworkMessage& msg)
{
	uint32_t targetId = msg.get<uint32_t>();
	addGameTask(&Game::playerJoinParty, player->getID(), targetId);
}

void ProtocolGame::parseRevokePartyInvite(NetworkMessage& msg)
{
	uint32_t targetId = msg.get<uint32_t>();
	addGameTask(&Game::playerRevokePartyInvitation, player->getID(), targetId);
}

void ProtocolGame::parsePassPartyLeadership(NetworkMessage& msg)
{
	uint32_t targetId = msg.get<uint32_t>();
	addGameTask(&Game::playerPassPartyLeadership, player->getID(), targetId);
}

void ProtocolGame::parseEnableSharedPartyExperience(NetworkMessage& msg)
{
	bool sharedExpActive = msg.getByte() == 1;
	addGameTask(&Game::playerEnableSharedPartyExperience, player->getID(), sharedExpActive);
}

void ProtocolGame::parseQuestLine(NetworkMessage& msg)
{
	uint16_t questId = msg.get<uint16_t>();
	addGameTask(&Game::playerShowQuestLine, player->getID(), questId);
}

void ProtocolGame::parseMarketLeave()
{
	addGameTask(&Game::playerLeaveMarket, player->getID());
}

void ProtocolGame::parseMarketBrowse(NetworkMessage& msg)
{
	uint16_t browseId = msg.get<uint16_t>();
	if (browseId == MARKETREQUEST_OWN_OFFERS) {
		addGameTask(&Game::playerBrowseMarketOwnOffers, player->getID());
	} else if (browseId == MARKETREQUEST_OWN_HISTORY) {
		addGameTask(&Game::playerBrowseMarketOwnHistory, player->getID());
	} else {
		addGameTask(&Game::playerBrowseMarket, player->getID(), browseId);
	}
}

void ProtocolGame::parseMarketCreateOffer(NetworkMessage& msg)
{
	uint8_t type = msg.getByte();
	uint16_t spriteId = msg.get<uint16_t>();
	uint16_t amount = msg.get<uint16_t>();
	uint32_t price = msg.get<uint32_t>();
	bool anonymous = (msg.getByte() != 0);
	addGameTask(&Game::playerCreateMarketOffer, player->getID(), type, spriteId, amount, price, anonymous);
}

void ProtocolGame::parseMarketCancelOffer(NetworkMessage& msg)
{
	uint32_t timestamp = msg.get<uint32_t>();
	uint16_t counter = msg.get<uint16_t>();
	addGameTask(&Game::playerCancelMarketOffer, player->getID(), timestamp, counter);
}

void ProtocolGame::parseMarketAcceptOffer(NetworkMessage& msg)
{
	uint32_t timestamp = msg.get<uint32_t>();
	uint16_t counter = msg.get<uint16_t>();
	uint16_t amount = msg.get<uint16_t>();
	addGameTask(&Game::playerAcceptMarketOffer, player->getID(), timestamp, counter, amount);
}

void ProtocolGame::parseModalWindowAnswer(NetworkMessage& msg)
{
	uint32_t id = msg.get<uint32_t>();
	uint8_t button = msg.getByte();
	uint8_t choice = msg.getByte();
	addGameTask(&Game::playerAnswerModalWindow, player->getID(), id, button, choice);
}

void ProtocolGame::parseBrowseField(NetworkMessage& msg)
{
	const Position& pos = msg.getPosition();
	addGameTask(&Game::playerBrowseField, player->getID(), pos);
}

void ProtocolGame::parseSeekInContainer(NetworkMessage& msg)
{
	uint8_t containerId = msg.getByte();
	uint16_t index = msg.get<uint16_t>();
	addGameTask(&Game::playerSeekInContainer, player->getID(), containerId, index);
}

// Send methods
void ProtocolGame::sendOpenPrivateChannel(const std::string& receiver)
{
	playermsg.reset();
	playermsg.addByte(0xAD);
	playermsg.addString(receiver);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendChannelEvent(uint16_t channelId, const std::string& playerName, ChannelEvent_t channelEvent)
{
	playermsg.reset();
	playermsg.addByte(0xF3);
	playermsg.add<uint16_t>(channelId);
	playermsg.addString(playerName);
	playermsg.addByte(channelEvent);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCreatureOutfit(const Creature* creature, const Outfit_t& outfit)
{
	if (!canSee(creature)) {
		return;
	}

	playermsg.reset();
	playermsg.addByte(0x8E);
	playermsg.add<uint32_t>(creature->getID());
	AddOutfit(outfit);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCreatureLight(const Creature* creature)
{
	if (!canSee(creature)) {
		return;
	}

	playermsg.reset();
	AddCreatureLight(creature);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendWorldLight(LightInfo lightInfo)
{
	playermsg.reset();
	AddWorldLight(lightInfo);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendTibiaTime(int32_t time)
{
	if (version < 1121) {
		return;
	}

	playermsg.reset();
	playermsg.addByte(0xEF);
	playermsg.addByte(time / 60);
	playermsg.addByte(time % 60);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCreatureWalkthrough(const Creature* creature, bool walkthrough)
{
	if (!canSee(creature)) {
		return;
	}

	playermsg.reset();
	playermsg.addByte(0x92);
	playermsg.add<uint32_t>(creature->getID());
	playermsg.addByte(walkthrough ? 0x00 : 0x01);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCreatureShield(const Creature* creature)
{
	if (!canSee(creature)) {
		return;
	}

	playermsg.reset();
	playermsg.addByte(0x91);
	playermsg.add<uint32_t>(creature->getID());
	playermsg.addByte(player->getPartyShield(creature->getPlayer()));
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCreatureSkull(const Creature* creature)
{
	if (g_game.getWorldType() != WORLD_TYPE_PVP) {
		return;
	}

	if (!canSee(creature)) {
		return;
	}

	playermsg.reset();
	playermsg.addByte(0x90);
	playermsg.add<uint32_t>(creature->getID());
	playermsg.addByte(player->getSkullClient(creature));
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCreatureType(const Creature* creature, uint8_t creatureType)
{
	playermsg.reset();
	playermsg.addByte(0x95);
	playermsg.add<uint32_t>(creature->getID());
	if (version >= 1120) {
		if (creatureType == CREATURETYPE_SUMMON_OTHERS) {
			creatureType = CREATURETYPE_SUMMON_OWN;
		}
		playermsg.addByte(creatureType);
		if (creatureType == CREATURETYPE_SUMMON_OWN) {
			const Creature* master = creature->getMaster();
			if (master) {
				playermsg.add<uint32_t>(master->getID());
			} else {
				playermsg.add<uint32_t>(0);
			}
		}
	} else {
		playermsg.addByte(creatureType);
	}
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCreatureHelpers(uint32_t creatureId, uint16_t helpers)
{
	if (version >= 1185) {
		return;
	}

	playermsg.reset();
	playermsg.addByte(0x94);
	playermsg.add<uint32_t>(creatureId);
	playermsg.add<uint16_t>(helpers);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCreatureSquare(const Creature* creature, SquareColor_t color)
{
	if (!canSee(creature)) {
		return;
	}

	playermsg.reset();
	playermsg.addByte(0x93);
	playermsg.add<uint32_t>(creature->getID());
	playermsg.addByte(0x01);
	playermsg.addByte(color);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendTutorial(uint8_t tutorialId)
{
	playermsg.reset();
	playermsg.addByte(0xDC);
	playermsg.addByte(tutorialId);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendAddMarker(const Position& pos, uint8_t markType, const std::string& desc)
{
	playermsg.reset();
	playermsg.addByte(0xDD);
	if (version >= 1200) {
		playermsg.addByte(0x00);
	}
	playermsg.addPosition(pos);
	playermsg.addByte(markType);
	playermsg.addString(desc);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendMonsterCyclopedia()
{
	playermsg.reset();
	playermsg.addByte(0xD5);

	auto races = g_monsters.getRaces();
	auto monsterRaces = g_monsters.getMonsterRaces();

	playermsg.add<uint16_t>(races.size());
	for (const auto& race : races) {
		playermsg.addString(race.first);

		auto it = monsterRaces.find(race.second);
		if (it != monsterRaces.end()) {
			playermsg.add<uint16_t>(it->second.size());
			playermsg.add<uint16_t>(it->second.size());
		} else {
			playermsg.add<uint16_t>(0);
			playermsg.add<uint16_t>(0);
		}
	}
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCyclopediaMonsters(const std::string& race)
{
	playermsg.reset();
	playermsg.addByte(0xD6);

	auto races = g_monsters.getRaces();
	auto monsterRaces = g_monsters.getMonsterRaces();
	playermsg.addString(race);

	auto it = races.find(race);
	if (it != races.end()) {
		auto it2 = monsterRaces.find(it->second);
		if (it2 != monsterRaces.end()) {
			playermsg.add<uint16_t>(it2->second.size());
			for (const auto& monster : it2->second) {
				uint8_t monsterProgress = BESTIARY_PROGRESS_COMPLETED;

				playermsg.add<uint16_t>(monster.first);
				playermsg.addByte(monsterProgress);
				if (monsterProgress != BESTIARY_PROGRESS_NONE) {
					playermsg.addByte(BESTIARY_OCCURENCE_COMMON);
				}
			}
		} else {
			playermsg.add<uint16_t>(0);
		}
	} else {
		playermsg.add<uint16_t>(0);
	}
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCyclopediaRace(uint16_t monsterId)
{
	playermsg.reset();
	playermsg.addByte(0xD7);

	auto monsterRaces = g_monsters.getMonsterRaces();
	for (const auto& race : monsterRaces) {
		auto it = race.second.find(monsterId);
		if (it != race.second.end()) {
			MonsterType* monsterType = g_monsters.getMonsterType(it->second);
			if (monsterType) {
				uint8_t monsterProgress = BESTIARY_PROGRESS_COMPLETED;

				playermsg.add<uint16_t>(monsterId);
				playermsg.addString(g_monsters.getRaceName(race.first));
				playermsg.addByte(monsterProgress);
				playermsg.add<uint32_t>(0); // total kills
				playermsg.add<uint16_t>(0); // kills to progress 1
				playermsg.add<uint16_t>(0); // kills to progress 2
				playermsg.add<uint16_t>(0); // kills to progress 3
				if (monsterProgress >= BESTIARY_PROGRESS_FIRST) {
					playermsg.addByte(BESTIARY_DIFFICULTY_HARMLESS);
					playermsg.addByte(BESTIARY_OCCURENCE_COMMON);

					std::vector<const std::vector<LootBlock>*> lootBlocks{ &monsterType->info.lootItems };
					uint8_t lootSize = 0;
					uint16_t startLoot = playermsg.getBufferPosition();
					playermsg.addByte(lootSize);
					for (std::vector<const std::vector<LootBlock>*>::iterator lit = lootBlocks.begin(); lit != lootBlocks.end(); lit++) {
						const std::vector<LootBlock>* lootVector = (*lit);
						for (const auto& lootBlock : *lootVector) {
							if (!lootBlock.childLoot.empty()) {
								lootBlocks.push_back(&lootBlock.childLoot);
							} else {
								uint16_t itemId = lootBlock.id;

								const ItemType& item = Item::items[itemId];
								playermsg.add<uint16_t>(item.clientId);
								if (lootBlock.chance >= 25000) {
									playermsg.addByte(BESTIARY_RARITY_COMMON);
								} else if (lootBlock.chance >= 5000) {
									playermsg.addByte(BESTIARY_RARITY_UNCOMMON);
								} else if (lootBlock.chance >= 1000) {
									playermsg.addByte(BESTIARY_RARITY_SEMIRARE);
								} else if (lootBlock.chance >= 500) {
									playermsg.addByte(BESTIARY_RARITY_RARE);
								} else {
									playermsg.addByte(BESTIARY_RARITY_VERYRARE);
								}
								playermsg.addByte(0x00); // special event item
								if (itemId != 0) { // 0 indicate hidden item
									playermsg.addString(item.name);
									playermsg.addByte((lootBlock.countmax > 1) ? 0x01 : 0x00);
								}

								if (++lootSize == 0xFF) {
									goto EndLoot;
								}
							}
						}
					}

					EndLoot:
					uint16_t returnTo = playermsg.getBufferPosition();
					playermsg.setBufferPosition(startLoot);
					playermsg.addByte(lootSize);
					playermsg.setLength(playermsg.getLength() - 1); // decrease one extra bytes we made
					playermsg.setBufferPosition(returnTo);
				}
				if (monsterProgress >= BESTIARY_PROGRESS_SECOND) {
					playermsg.add<uint16_t>(0); // charm points
					if (!monsterType->info.isHostile) {
						playermsg.addByte(BESTIARY_ATTACKTYPE_NONE);
					} else if (monsterType->info.targetDistance > 1) {
						playermsg.addByte(BESTIARY_ATTACKTYPE_DISTANCE);
					} else {
						playermsg.addByte(BESTIARY_ATTACKTYPE_MELEE);
					}
					if (!monsterType->info.attackSpells.empty() || !monsterType->info.defenseSpells.empty()) {
						playermsg.addByte(0x01); // casts spells
					} else {
						playermsg.addByte(0x00); // casts spells
					}
					playermsg.add<uint32_t>(static_cast<uint32_t>(monsterType->info.healthMax));
					playermsg.add<uint32_t>(static_cast<uint32_t>(monsterType->info.experience));
					playermsg.add<uint16_t>(static_cast<uint16_t>(monsterType->info.baseSpeed / 2));
					playermsg.add<uint16_t>(static_cast<uint16_t>(monsterType->info.armor));
				}
				if (monsterProgress >= BESTIARY_PROGRESS_THIRD) {
					playermsg.addByte(8); // combats

					static const CombatType_t combats[] = {COMBAT_PHYSICALDAMAGE, COMBAT_FIREDAMAGE, COMBAT_EARTHDAMAGE, COMBAT_ENERGYDAMAGE, COMBAT_ICEDAMAGE, COMBAT_HOLYDAMAGE, COMBAT_DEATHDAMAGE, COMBAT_HEALING};
					for (std::underlying_type<Cipbia_Elementals_t>::type i = CIPBIA_ELEMENTAL_PHYSICAL; i <= CIPBIA_ELEMENTAL_HEALING; i++) {
						playermsg.addByte(i);

						auto combat = combats[i];
						if (monsterType->info.damageImmunities & combat) {
							playermsg.add<int16_t>(0);
						} else {
							auto combatDmg = monsterType->info.elementMap.find(combats[i]);
							if (combatDmg != monsterType->info.elementMap.end()) {
								playermsg.add<int16_t>(100-combatDmg->second);
							} else {
								playermsg.add<int16_t>(100);
							}
						}
					}

					playermsg.add<uint16_t>(1); // locations
					playermsg.addString(""); // location - TODO
				}
				if (monsterProgress >= BESTIARY_PROGRESS_COMPLETED) {
					bool monsterHaveActiveCharm = false;
					playermsg.addByte((monsterHaveActiveCharm ? 0x01 : 0x00));
					if (monsterHaveActiveCharm) {
						playermsg.addByte(0); // ??
						playermsg.add<uint32_t>(0); // ??
					} else {
						playermsg.addByte(0); // ??
					}
				}
				writeToOutputBuffer(playermsg);
				return;
			}
		}
	}

	playermsg.add<uint16_t>(monsterId);
	playermsg.addString("Extra Dimensional");
	playermsg.addByte(BESTIARY_PROGRESS_NONE);
	playermsg.add<uint32_t>(0); // total kills
	playermsg.add<uint16_t>(0); // kills to progress 1
	playermsg.add<uint16_t>(0); // kills to progress 2
	playermsg.add<uint16_t>(0); // kills to progress 3
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCyclopediaBonusEffects()
{
	playermsg.reset();
	playermsg.addByte(0xD8);
	playermsg.add<int32_t>(0); // charm points
	playermsg.addByte(0); // charms
	//playermsg.addByte(10); // charmid
	//playermsg.addString("Cripple"); // charmname
	//playermsg.addString("something"); // charmdescription
	//playermsg.addByte(0); // ??
	//playermsg.add<uint16_t>(500); // charm price
	//playermsg.addByte(0); // unlocked
	//playermsg.addByte(1); // activated
	// if activated
	//playermsg.add<uint16_t>(78); // monster id
	//playermsg.add<uint32_t>(1000); // clear price

	playermsg.addByte(0); // remaining assignable charms
	playermsg.add<uint16_t>(0); // assignable monsters
	//playermsg.add<uint16_t>(78); // monster id
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCyclopediaCharacterBaseInformation()
{
	playermsg.reset();
	playermsg.addByte(0xDA);
	if (version >= 1215) {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_BASEINFORMATION);
		playermsg.addByte(0x00); // No data available
	} else {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_BASEINFORMATION);
	}
	playermsg.addString(player->getName());
	playermsg.addString(player->getVocation()->getVocName());
	playermsg.add<uint16_t>(player->getLevel());
	AddOutfit(player->getDefaultOutfit(), false);

	playermsg.addByte(0x00); // ??
	playermsg.addByte(0x00); // enable store summary & character titles
	playermsg.addString(""); // character title
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCyclopediaCharacterGeneralStats()
{
	playermsg.reset();
	playermsg.addByte(0xDA);
	if (version >= 1215) {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_GENERALSTATS);
		playermsg.addByte(0x00); // No data available
	} else {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_GENERALSTATS);
	}
	playermsg.add<uint64_t>(player->getExperience());
	playermsg.add<uint16_t>(player->getLevel());
	playermsg.addByte(player->getLevelPercent());
	playermsg.add<uint16_t>(100); // base xp gain rate
	if (version >= 1215) {
		playermsg.add<int32_t>(0); // tournament xp factor
	}
	playermsg.add<uint16_t>(0); // low level bonus
	playermsg.add<uint16_t>(0); // xp boost
	playermsg.add<uint16_t>(100); // stamina multiplier (100 = x1.0)
	playermsg.add<uint16_t>(0); // xpBoostRemainingTime
	playermsg.addByte(0x00); // canBuyXpBoost
	playermsg.add<uint16_t>(std::min<int32_t>(player->getHealth(), std::numeric_limits<uint16_t>::max()));
	playermsg.add<uint16_t>(std::min<int32_t>(player->getMaxHealth(), std::numeric_limits<uint16_t>::max()));
	playermsg.add<uint16_t>(std::min<int32_t>(player->getMana(), std::numeric_limits<uint16_t>::max()));
	playermsg.add<uint16_t>(std::min<int32_t>(player->getMaxMana(), std::numeric_limits<uint16_t>::max()));
	playermsg.addByte(player->getSoul());
	playermsg.add<uint16_t>(player->getStaminaMinutes());

	Condition* condition = player->getCondition(CONDITION_REGENERATION);
	playermsg.add<uint16_t>(condition ? condition->getTicks() / 1000 : 0x00);
	playermsg.add<uint16_t>(player->getOfflineTrainingTime() / 60 / 1000);
	playermsg.add<uint16_t>(player->getSpeed() / 2);
	playermsg.add<uint16_t>(player->getBaseSpeed() / 2);
	playermsg.add<uint32_t>(player->getCapacity());
	playermsg.add<uint32_t>(player->getCapacity());
	playermsg.add<uint32_t>(player->getFreeCapacity());
	playermsg.addByte(8); // Skills count
	playermsg.addByte(1); // Magic Level hardcoded skill id
	playermsg.add<uint16_t>(player->getMagicLevel());
	playermsg.add<uint16_t>(player->getBaseMagicLevel());
	if (version >= 1200) {
		playermsg.add<uint16_t>(player->getBaseMagicLevel());//loyalty bonus
		playermsg.add<uint16_t>(player->getMagicLevelPercent() * 100);
	} else {
		playermsg.addByte(player->getMagicLevelPercent());
	}
	for (uint8_t i = SKILL_FIRST; i <= SKILL_LAST; ++i) { //TODO: check if all clients have the same hardcoded skill ids
		static const uint8_t HardcodedSkillIds[] = {11, 9, 8, 10, 7, 6, 13};
		playermsg.addByte(HardcodedSkillIds[i]);
		playermsg.add<uint16_t>(std::min<int32_t>(player->getSkillLevel(i), std::numeric_limits<uint16_t>::max()));
		playermsg.add<uint16_t>(player->getBaseSkill(i));
		if (version >= 1200) {
			playermsg.add<uint16_t>(player->getBaseSkill(i));//loyalty bonus
			playermsg.add<uint16_t>(player->getSkillPercent(i) * 100);
		} else {
			playermsg.addByte(player->getSkillPercent(i));
		}
	}
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCyclopediaCharacterCombatStats()
{
	playermsg.reset();
	playermsg.addByte(0xDA);
	if (version >= 1215) {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_COMBATSTATS);
		playermsg.addByte(0x00); // No data available
	} else {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_COMBATSTATS);
	}
	for (uint8_t i = SPECIALSKILL_FIRST; i <= SPECIALSKILL_LAST; ++i) {
		playermsg.add<uint16_t>(std::min<int32_t>(100, player->varSpecialSkills[i]));
		playermsg.add<uint16_t>(0);
	}
	uint8_t haveBlesses = 0;
	uint8_t blessings = (version >= 1130 ? 8 : 6);
	for (uint8_t i = 1; i < blessings; i++) {
		if (player->hasBlessing(i)) {
			haveBlesses++;
		}
	}
	playermsg.addByte(haveBlesses);
	playermsg.addByte(blessings);
	playermsg.add<uint16_t>(0); // attackValue
	playermsg.addByte(0); // damageType
	playermsg.addByte(0); // convertedDamage
	playermsg.addByte(0); // convertedType
	playermsg.add<uint16_t>(0); // armorValue
	playermsg.add<uint16_t>(0); // defenseValue
	playermsg.addByte(0); // combats
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCyclopediaCharacterRecentDeaths()
{
	playermsg.reset();
	playermsg.addByte(0xDA);
	if (version >= 1215) {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_RECENTDEATHS);
		playermsg.addByte(0x00); // No data available
	} else {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_RECENTDEATHS);
	}
	playermsg.add<uint16_t>(0); // current page
	playermsg.add<uint16_t>(0); // available pages
	playermsg.add<uint16_t>(0); // deaths
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCyclopediaCharacterRecentPvPKills()
{
	playermsg.reset();
	playermsg.addByte(0xDA);
	if (version >= 1215) {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_RECENTPVPKILLS);
		playermsg.addByte(0x00); // No data available
	} else {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_RECENTPVPKILLS);
	}
	playermsg.add<uint16_t>(0); // current page
	playermsg.add<uint16_t>(0); // available pages
	playermsg.add<uint16_t>(0); // kills
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCyclopediaCharacterAchievements()
{
	playermsg.reset();
	playermsg.addByte(0xDA);
	if (version >= 1215) {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_ACHIEVEMENTS);
		playermsg.addByte(0x00); // No data available
	} else {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_ACHIEVEMENTS);
	}
	playermsg.add<uint16_t>(0); // total points
	playermsg.add<uint16_t>(0); // total secret achievements
	playermsg.add<uint16_t>(0); // achievements
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCyclopediaCharacterItemSummary()
{
	playermsg.reset();
	playermsg.addByte(0xDA);
	if (version >= 1215) {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_ITEMSUMMARY);
		playermsg.addByte(0x00); // No data available
	} else {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_ITEMSUMMARY);
	}
	playermsg.add<uint16_t>(0); // ??
	playermsg.add<uint16_t>(0); // ??
	playermsg.add<uint16_t>(0); // ??
	playermsg.add<uint16_t>(0); // ??
	playermsg.add<uint16_t>(0); // ??
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCyclopediaCharacterOutfitsMounts()
{
	playermsg.reset();
	playermsg.addByte(0xDA);
	if (version >= 1215) {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_OUTFITSMOUNTS);
		playermsg.addByte(0x00); // No data available
	} else {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_OUTFITSMOUNTS);
	}
	Outfit_t currentOutfit = player->getDefaultOutfit();

	uint16_t outfitSize = 0;
	uint16_t startOutfits = playermsg.getBufferPosition();
	playermsg.add<uint16_t>(outfitSize);

	const auto& outfits = Outfits::getInstance().getOutfits(player->getSex());
	for (const Outfit& outfit : outfits) {
		uint8_t addons;
		if (!player->getOutfitAddons(outfit, addons)) {
			continue;
		}
		outfitSize++;

		playermsg.add<uint16_t>(outfit.lookType);
		playermsg.addString(outfit.name);
		playermsg.addByte(addons);
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_OUTFITTYPE_NONE);
		if (outfit.lookType == currentOutfit.lookType) {
			playermsg.add<uint32_t>(1000);
		} else {
			playermsg.add<uint32_t>(0);
		}
	}
	if (outfitSize > 0) {
		playermsg.addByte(currentOutfit.lookHead);
		playermsg.addByte(currentOutfit.lookBody);
		playermsg.addByte(currentOutfit.lookLegs);
		playermsg.addByte(currentOutfit.lookFeet);
	}

	uint16_t mountSize = 0;
	uint16_t startMounts = playermsg.getBufferPosition();
	playermsg.add<uint16_t>(mountSize);
	for (const Mount& mount : g_game.mounts.getMounts()) {
		if (player->hasMount(&mount)) {
			mountSize++;

			playermsg.add<uint16_t>(mount.clientId);
			playermsg.addString(mount.name);
			playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_OUTFITTYPE_NONE);
			playermsg.add<uint32_t>(1000);
		}
	}

	playermsg.setBufferPosition(startOutfits);
	playermsg.add<uint16_t>(outfitSize);
	playermsg.setBufferPosition(startMounts);
	playermsg.add<uint16_t>(mountSize);
	playermsg.setLength(playermsg.getLength() - 4); // decrease four extra bytes we made
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCyclopediaCharacterStoreSummary()
{
	playermsg.reset();
	playermsg.addByte(0xDA);
	if (version >= 1215) {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_STORESUMMARY);
		playermsg.addByte(0x00); // No data available
	} else {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_STORESUMMARY);
	}
	playermsg.add<uint32_t>(0); // ??
	playermsg.add<uint32_t>(0); // ??
	playermsg.addByte(0x00); // ??
	playermsg.addByte(0x00); // ??
	playermsg.addByte(0x00); // ??
	playermsg.addByte(0x00); // ??
	playermsg.addByte(0x00); // ??
	playermsg.addByte(0x00); // ??
	playermsg.addByte(0x00); // ??
	playermsg.addByte(0x00); // ??
	playermsg.add<uint16_t>(0); // ??
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCyclopediaCharacterInspection()
{
	playermsg.reset();
	playermsg.addByte(0xDA);
	if (version >= 1215) {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_INSPECTION);
		playermsg.addByte(0x00); // No data available
	} else {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_INSPECTION);
	}
	uint8_t inventoryItems = 0;
	uint16_t startInventory = playermsg.getBufferPosition();
	playermsg.addByte(inventoryItems);
	for (std::underlying_type<slots_t>::type slot = CONST_SLOT_FIRST; slot <= CONST_SLOT_LAST; slot++) {
		Item* inventoryItem = player->getInventoryItem(static_cast<slots_t>(slot));
		if (inventoryItem) {
			inventoryItems++;

			playermsg.addByte(slot);
			playermsg.addString(inventoryItem->getName());
			AddItem(inventoryItem);
			playermsg.addByte(0); // imbuements

			auto descriptions = Item::getDescriptions(Item::items[inventoryItem->getID()], inventoryItem);
			playermsg.addByte(descriptions.size());
			for (const auto& description : descriptions) {
				playermsg.addString(description.first);
				playermsg.addString(description.second);
			}
		}
	}
	playermsg.addString(player->getName());
	AddOutfit(player->getDefaultOutfit(), false);

	playermsg.addByte(3);
	playermsg.addString("Level");
	playermsg.addString(std::to_string(player->getLevel()));
	playermsg.addString("Vocation");
	playermsg.addString(player->getVocation()->getVocName());
	playermsg.addString("Outfit");

	const Outfit* outfit = Outfits::getInstance().getOutfitByLookType(player->getSex(), player->getDefaultOutfit().lookType);
	if (outfit) {
		playermsg.addString(outfit->name);
	} else {
		playermsg.addString("unknown");
	}
	playermsg.setBufferPosition(startInventory);
	playermsg.addByte(inventoryItems);
	playermsg.setLength(playermsg.getLength() - 1); // decrease one extra byte we made
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCyclopediaCharacterBadges()
{
	playermsg.reset();
	playermsg.addByte(0xDA);
	if (version >= 1215) {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_BADGES);
		playermsg.addByte(0x00); // No data available
	} else {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_BADGES);
	}
	playermsg.addByte(0x00); // enable badges
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCyclopediaCharacterTitles()
{
	playermsg.reset();
	playermsg.addByte(0xDA);
	if (version >= 1215) {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_TITLES);
		playermsg.addByte(0x00); // No data available
	} else {
		playermsg.addByte(CYCLOPEDIA_CHARACTERINFO_TITLES);
	}
	playermsg.addByte(0x00); // ??
	playermsg.addByte(0x00); // ??
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendTournamentLeaderboard()
{
	playermsg.reset();
	playermsg.addByte(0xC5);
	playermsg.addByte(0);
	playermsg.addByte(0x01); // No data available
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendReLoginWindow(uint8_t unfairFightReduction)
{
	playermsg.reset();
	playermsg.addByte(0x28);
	playermsg.addByte(0x00);
	playermsg.addByte(unfairFightReduction);
	if (version >= 1120) {
		playermsg.addByte(0x00); // use death redemption (boolean)
	}
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendStats()
{
	playermsg.reset();
	AddPlayerStats();
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendBasicData()
{
	playermsg.reset();
	playermsg.addByte(0x9F);
	if (player->isPremium()) {
		playermsg.addByte(1);
		playermsg.add<uint32_t>(time(nullptr) + (player->premiumDays * 86400));
	} else {
		playermsg.addByte(0);
		playermsg.add<uint32_t>(0);
	}
	playermsg.addByte(player->getVocation()->getClientId());
	if (version >= 1100) {
		playermsg.addByte(((player->getVocation()->getId() != 0) ? 0x01 : 0x00));
	}

	std::vector<uint16_t> spells = g_spells->getSpellsByVocation(player->getVocationId());
	playermsg.add<uint16_t>(spells.size());
	for (auto spellId : spells) {
		playermsg.addByte(spellId);
	}
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendBlessStatus()
{
	uint16_t haveBlesses = 0;
	uint8_t blessings = (version >= 1130 ? 8 : 6);
	for (uint8_t i = 1; i < blessings; i++) {
		if (player->hasBlessing(i)) {
			haveBlesses++;
		}
	}

	playermsg.reset();
	playermsg.addByte(0x9C);
	if (haveBlesses >= 5) {
		if (version >= 1120) {
			playermsg.add<uint16_t>((static_cast<uint16_t>(1) << haveBlesses) - 1);
		} else {
			playermsg.add<uint16_t>(0x01);
		}
	} else {
		playermsg.add<uint16_t>(0x00);
	}
	if (version >= 1120) {
		playermsg.addByte((haveBlesses >= 5 ? 2 : 1));
	}
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendPremiumTrigger()
{
	playermsg.reset();
	playermsg.addByte(0x9E);
	playermsg.addByte(0);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendClientCheck()
{
	playermsg.reset();
	playermsg.addByte(0x63);
	playermsg.add<uint32_t>(0x01);
	playermsg.addByte(1);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendGameNews()
{
	playermsg.reset();
	playermsg.addByte(0x98);
	playermsg.add<uint32_t>(0x01); // unknown
	playermsg.addByte(1); //(0 = open | 1 = highlight)
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendTextMessage(const TextMessage& message)
{
	playermsg.reset();
	playermsg.addByte(0xB4);
	playermsg.addByte(message.type);
	switch (message.type) {
		case MESSAGE_DAMAGE_DEALT:
		case MESSAGE_DAMAGE_RECEIVED:
		case MESSAGE_DAMAGE_OTHERS: {
			playermsg.addPosition(message.position);
			playermsg.add<uint32_t>(message.primary.value);
			playermsg.addByte(message.primary.color);
			playermsg.add<uint32_t>(message.secondary.value);
			playermsg.addByte(message.secondary.color);
			break;
		}
		case MESSAGE_HEALED:
		case MESSAGE_HEALED_OTHERS:
		case MESSAGE_EXPERIENCE:
		case MESSAGE_EXPERIENCE_OTHERS: {
			playermsg.addPosition(message.position);
			playermsg.add<uint32_t>(message.primary.value);
			playermsg.addByte(message.primary.color);
			break;
		}
		case MESSAGE_GUILD:
		case MESSAGE_PARTY_MANAGEMENT:
		case MESSAGE_PARTY:
			playermsg.add<uint16_t>(message.channelId);
			break;
		default: {
			break;
		}
	}
	playermsg.addString(message.text);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendClosePrivate(uint16_t channelId)
{
	playermsg.reset();
	playermsg.addByte(0xB3);
	playermsg.add<uint16_t>(channelId);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCreatePrivateChannel(uint16_t channelId, const std::string& channelName)
{
	playermsg.reset();
	playermsg.addByte(0xB2);
	playermsg.add<uint16_t>(channelId);
	playermsg.addString(channelName);
	playermsg.add<uint16_t>(0x01);
	playermsg.addString(player->getName());
	playermsg.add<uint16_t>(0x00);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendChannelsDialog()
{
	playermsg.reset();
	playermsg.addByte(0xAB);

	const ChannelList& list = g_chat->getChannelList(*player);
	playermsg.addByte(list.size());
	for (ChatChannel* channel : list) {
		playermsg.add<uint16_t>(channel->getId());
		playermsg.addString(channel->getName());
	}

	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendChannel(uint16_t channelId, const std::string& channelName, const UsersMap* channelUsers, const InvitedMap* invitedUsers)
{
	playermsg.reset();
	playermsg.addByte(0xAC);

	playermsg.add<uint16_t>(channelId);
	playermsg.addString(channelName);
	if (channelUsers) {
		playermsg.add<uint16_t>(channelUsers->size());
		for (const auto& it : *channelUsers) {
			playermsg.addString(it.second->getName());
		}
	} else {
		playermsg.add<uint16_t>(0x00);
	}

	if (invitedUsers) {
		playermsg.add<uint16_t>(invitedUsers->size());
		for (const auto& it : *invitedUsers) {
			playermsg.addString(it.second->getName());
		}
	} else {
		playermsg.add<uint16_t>(0x00);
	}
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendChannelMessage(const std::string& author, const std::string& text, SpeakClasses type, uint16_t channel)
{
	playermsg.reset();
	playermsg.addByte(0xAA);
	playermsg.add<uint32_t>(0x00);
	playermsg.addString(author);
	playermsg.add<uint16_t>(0x00);
	playermsg.addByte(type);
	playermsg.add<uint16_t>(channel);
	playermsg.addString(text);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendIcons(uint32_t icons)
{
	playermsg.reset();
	playermsg.addByte(0xA2);
	if (version >= 1140) {
		playermsg.add<uint32_t>(icons);
	} else {
		playermsg.add<uint16_t>(static_cast<uint16_t>(icons));
	}
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendContainer(uint8_t cid, const Container* container, bool hasParent, uint16_t firstIndex)
{
	playermsg.reset();
	playermsg.addByte(0x6E);

	playermsg.addByte(cid);
	if (container->getID() == ITEM_BROWSEFIELD) {
		AddItem(1987, 1);
		playermsg.addString("Browse Field");
	} else {
		AddItem(container);
		playermsg.addString(container->getName());
	}

	playermsg.addByte(container->capacity());

	playermsg.addByte(hasParent ? 0x01 : 0x00);
	if (version >= 1220) {
		//can use depot search
		playermsg.addByte(0x00);
	}

	playermsg.addByte(container->isUnlocked() ? 0x01 : 0x00); // Drag and drop
	playermsg.addByte(container->hasPagination() ? 0x01 : 0x00); // Pagination

	uint32_t containerSize = container->size();
	playermsg.add<uint16_t>(containerSize);
	playermsg.add<uint16_t>(firstIndex);
	if (firstIndex < containerSize) {
		uint8_t itemsToSend = std::min<uint32_t>(std::min<uint32_t>(container->capacity(), containerSize - firstIndex), std::numeric_limits<uint8_t>::max());

		playermsg.addByte(itemsToSend);
		for (auto it = container->getItemList().begin() + firstIndex, end = it + itemsToSend; it != end; ++it) {
			AddItem(*it);
		}
	} else {
		playermsg.addByte(0x00);
	}
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendShop(Npc* npc, const ShopInfoList& itemList)
{
	playermsg.reset();
	playermsg.addByte(0x7A);
	playermsg.addString(npc->getName());

	uint16_t itemsToSend = std::min<size_t>(itemList.size(), std::numeric_limits<uint16_t>::max());
	playermsg.add<uint16_t>(itemsToSend);

	uint16_t i = 0;
	for (auto it = itemList.begin(); i < itemsToSend; ++it, ++i) {
		AddShopItem(*it);
	}

	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCloseShop()
{
	playermsg.reset();
	playermsg.addByte(0x7C);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendSaleItemList(const std::list<ShopInfo>& shop)
{
	playermsg.reset();
	playermsg.addByte(0x7B);
	playermsg.add<uint64_t>(player->getMoney());

	std::map<uint16_t, uint32_t> saleMap;
	if (shop.size() <= 5) {
		// For very small shops it's not worth it to create the complete map
		for (const ShopInfo& shopInfo : shop) {
			if (shopInfo.sellPrice == 0) {
				continue;
			}

			int8_t subtype = -1;

			const ItemType& itemType = Item::items[shopInfo.itemId];
			if (itemType.hasSubType() && !itemType.stackable) {
				subtype = (shopInfo.subType == 0 ? -1 : shopInfo.subType);
			}

			uint32_t count = player->getItemTypeCount(shopInfo.itemId, subtype);
			if (count > 0) {
				saleMap[shopInfo.itemId] = count;
			}
		}
	} else {
		// Large shop, it's better to get a cached map of all item counts and use it
		// We need a temporary map since the finished map should only contain items
		// available in the shop
		std::map<uint32_t, uint32_t> tempSaleMap;
		player->getAllItemTypeCount(tempSaleMap);

		// We must still check manually for the special items that require subtype matches
		// (That is, fluids such as potions etc., actually these items are very few since
		// health potions now use their own ID)
		for (const ShopInfo& shopInfo : shop) {
			if (shopInfo.sellPrice == 0) {
				continue;
			}

			int8_t subtype = -1;

			const ItemType& itemType = Item::items[shopInfo.itemId];
			if (itemType.hasSubType() && !itemType.stackable) {
				subtype = (shopInfo.subType == 0 ? -1 : shopInfo.subType);
			}

			if (subtype != -1) {
				uint32_t count;
				if (!itemType.isFluidContainer() && !itemType.isSplash()) {
					count = player->getItemTypeCount(shopInfo.itemId, subtype); // This shop item requires extra checks
				} else {
					count = subtype;
				}

				if (count > 0) {
					saleMap[shopInfo.itemId] = count;
				}
			} else {
				std::map<uint32_t, uint32_t>::const_iterator findIt = tempSaleMap.find(shopInfo.itemId);
				if (findIt != tempSaleMap.end() && findIt->second > 0) {
					saleMap[shopInfo.itemId] = findIt->second;
				}
			}
		}
	}

	uint8_t itemsToSend = std::min<size_t>(saleMap.size(), std::numeric_limits<uint8_t>::max());
	playermsg.addByte(itemsToSend);

	uint8_t i = 0;
	for (std::map<uint16_t, uint32_t>::const_iterator it = saleMap.begin(); i < itemsToSend; ++it, ++i) {
		playermsg.addItemId(it->first);
		playermsg.addByte(std::min<uint32_t>(it->second, std::numeric_limits<uint8_t>::max()));
	}

	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendMarketEnter(uint32_t depotId)
{
	playermsg.reset();
	playermsg.addByte(0xF6);

	playermsg.add<uint64_t>(player->getBankBalance());
	playermsg.addByte(std::min<uint32_t>(IOMarket::getPlayerOfferCount(player->getGUID()), std::numeric_limits<uint8_t>::max()));

	DepotChest* depotChest = player->getDepotChest(depotId, false);
	if (!depotChest) {
		playermsg.add<uint16_t>(0x00);
		writeToOutputBuffer(playermsg);
		return;
	}

	player->setInMarket(true);

	std::map<uint16_t, uint32_t> depotItems;
	std::forward_list<Container*> containerList { depotChest, player->getInbox() };

	do {
		Container* container = containerList.front();
		containerList.pop_front();

		for (Item* item : container->getItemList()) {
			Container* c = item->getContainer();
			if (c && !c->empty()) {
				containerList.push_front(c);
				continue;
			}

			const ItemType& itemType = Item::items[item->getID()];
			if (itemType.wareId == 0) {
				continue;
			}

			if (c && (!itemType.isContainer() || c->capacity() != itemType.maxItems)) {
				continue;
			}

			if (!item->hasMarketAttributes()) {
				continue;
			}

			depotItems[itemType.wareId] += Item::countByType(item, -1);
		}
	} while (!containerList.empty());

	uint16_t itemsToSend = std::min<size_t>(depotItems.size(), std::numeric_limits<uint16_t>::max());
	playermsg.add<uint16_t>(itemsToSend);

	uint16_t i = 0;
	for (std::map<uint16_t, uint32_t>::const_iterator it = depotItems.begin(); i < itemsToSend; ++it, ++i) {
		playermsg.add<uint16_t>(it->first);
		playermsg.add<uint16_t>(std::min<uint32_t>(0xFFFF, it->second));
	}

	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendMarketLeave()
{
	playermsg.reset();
	playermsg.addByte(0xF7);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendMarketBrowseItem(uint16_t itemId, const MarketOfferList& buyOffers, const MarketOfferList& sellOffers)
{
	playermsg.reset();
	playermsg.addByte(0xF9);
	playermsg.addItemId(itemId);

	playermsg.add<uint32_t>(buyOffers.size());
	for (const MarketOffer& offer : buyOffers) {
		playermsg.add<uint32_t>(offer.timestamp);
		playermsg.add<uint16_t>(offer.counter);
		playermsg.add<uint16_t>(offer.amount);
		playermsg.add<uint32_t>(offer.price);
		playermsg.addString(offer.playerName);
	}

	playermsg.add<uint32_t>(sellOffers.size());
	for (const MarketOffer& offer : sellOffers) {
		playermsg.add<uint32_t>(offer.timestamp);
		playermsg.add<uint16_t>(offer.counter);
		playermsg.add<uint16_t>(offer.amount);
		playermsg.add<uint32_t>(offer.price);
		playermsg.addString(offer.playerName);
	}

	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendMarketAcceptOffer(const MarketOfferEx& offer)
{
	playermsg.reset();
	playermsg.addByte(0xF9);
	playermsg.addItemId(offer.itemId);
	if (offer.type == MARKETACTION_BUY) {
		playermsg.add<uint32_t>(0x01);
		playermsg.add<uint32_t>(offer.timestamp);
		playermsg.add<uint16_t>(offer.counter);
		playermsg.add<uint16_t>(offer.amount);
		playermsg.add<uint32_t>(offer.price);
		playermsg.addString(offer.playerName);
		playermsg.add<uint32_t>(0x00);
	} else {
		playermsg.add<uint32_t>(0x00);
		playermsg.add<uint32_t>(0x01);
		playermsg.add<uint32_t>(offer.timestamp);
		playermsg.add<uint16_t>(offer.counter);
		playermsg.add<uint16_t>(offer.amount);
		playermsg.add<uint32_t>(offer.price);
		playermsg.addString(offer.playerName);
	}

	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendMarketBrowseOwnOffers(const MarketOfferList& buyOffers, const MarketOfferList& sellOffers)
{
	playermsg.reset();
	playermsg.addByte(0xF9);
	playermsg.add<uint16_t>(MARKETREQUEST_OWN_OFFERS);

	playermsg.add<uint32_t>(buyOffers.size());
	for (const MarketOffer& offer : buyOffers) {
		playermsg.add<uint32_t>(offer.timestamp);
		playermsg.add<uint16_t>(offer.counter);
		playermsg.addItemId(offer.itemId);
		playermsg.add<uint16_t>(offer.amount);
		playermsg.add<uint32_t>(offer.price);
	}

	playermsg.add<uint32_t>(sellOffers.size());
	for (const MarketOffer& offer : sellOffers) {
		playermsg.add<uint32_t>(offer.timestamp);
		playermsg.add<uint16_t>(offer.counter);
		playermsg.addItemId(offer.itemId);
		playermsg.add<uint16_t>(offer.amount);
		playermsg.add<uint32_t>(offer.price);
	}

	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendMarketCancelOffer(const MarketOfferEx& offer)
{
	playermsg.reset();
	playermsg.addByte(0xF9);
	playermsg.add<uint16_t>(MARKETREQUEST_OWN_OFFERS);
	if (offer.type == MARKETACTION_BUY) {
		playermsg.add<uint32_t>(0x01);
		playermsg.add<uint32_t>(offer.timestamp);
		playermsg.add<uint16_t>(offer.counter);
		playermsg.addItemId(offer.itemId);
		playermsg.add<uint16_t>(offer.amount);
		playermsg.add<uint32_t>(offer.price);
		playermsg.add<uint32_t>(0x00);
	} else {
		playermsg.add<uint32_t>(0x00);
		playermsg.add<uint32_t>(0x01);
		playermsg.add<uint32_t>(offer.timestamp);
		playermsg.add<uint16_t>(offer.counter);
		playermsg.addItemId(offer.itemId);
		playermsg.add<uint16_t>(offer.amount);
		playermsg.add<uint32_t>(offer.price);
	}

	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendMarketBrowseOwnHistory(const HistoryMarketOfferList& buyOffers, const HistoryMarketOfferList& sellOffers)
{
	uint32_t i = 0;
	std::map<uint32_t, uint16_t> counterMap;
	uint32_t buyOffersToSend = std::min<uint32_t>(buyOffers.size(), 810 + std::max<int32_t>(0, 810 - sellOffers.size()));
	uint32_t sellOffersToSend = std::min<uint32_t>(sellOffers.size(), 810 + std::max<int32_t>(0, 810 - buyOffers.size()));

	playermsg.reset();
	playermsg.addByte(0xF9);
	playermsg.add<uint16_t>(MARKETREQUEST_OWN_HISTORY);

	playermsg.add<uint32_t>(buyOffersToSend);
	for (auto it = buyOffers.begin(); i < buyOffersToSend; ++it, ++i) {
		playermsg.add<uint32_t>(it->timestamp);
		playermsg.add<uint16_t>(counterMap[it->timestamp]++);
		playermsg.addItemId(it->itemId);
		playermsg.add<uint16_t>(it->amount);
		playermsg.add<uint32_t>(it->price);
		playermsg.addByte(it->state);
	}

	counterMap.clear();
	i = 0;

	playermsg.add<uint32_t>(sellOffersToSend);
	for (auto it = sellOffers.begin(); i < sellOffersToSend; ++it, ++i) {
		playermsg.add<uint32_t>(it->timestamp);
		playermsg.add<uint16_t>(counterMap[it->timestamp]++);
		playermsg.addItemId(it->itemId);
		playermsg.add<uint16_t>(it->amount);
		playermsg.add<uint32_t>(it->price);
		playermsg.addByte(it->state);
	}

	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendMarketDetail(uint16_t itemId)
{
	playermsg.reset();
	playermsg.addByte(0xF8);
	playermsg.addItemId(itemId);

	const ItemType& it = Item::items[itemId];
	if (it.armor != 0) {
		playermsg.addString(std::to_string(it.armor));
	} else {
		playermsg.add<uint16_t>(0x00);
	}

	if (it.attack != 0) {
		// TODO: chance to hit, range
		// example:
		// "attack +x, chance to hit +y%, z fields"
		if (it.abilities && it.abilities->elementType != COMBAT_NONE && it.abilities->elementDamage != 0) {
			std::ostringstream ss;
			ss << it.attack << " physical +" << it.abilities->elementDamage << ' ' << getCombatName(it.abilities->elementType);
			playermsg.addString(ss.str());
		} else {
			playermsg.addString(std::to_string(it.attack));
		}
	} else {
		playermsg.add<uint16_t>(0x00);
	}

	if (it.isContainer()) {
		playermsg.addString(std::to_string(it.maxItems));
	} else {
		playermsg.add<uint16_t>(0x00);
	}

	if (it.defense != 0) {
		if (it.extraDefense != 0) {
			std::ostringstream ss;
			ss << it.defense << ' ' << std::showpos << it.extraDefense << std::noshowpos;
			playermsg.addString(ss.str());
		} else {
			playermsg.addString(std::to_string(it.defense));
		}
	} else {
		playermsg.add<uint16_t>(0x00);
	}

	if (!it.description.empty()) {
		const std::string& descr = it.description;
		if (descr.back() == '.') {
			playermsg.addString(std::string(descr, 0, descr.length() - 1));
		} else {
			playermsg.addString(descr);
		}
	} else {
		playermsg.add<uint16_t>(0x00);
	}

	if (it.decayTime != 0) {
		std::ostringstream ss;
		ss << it.decayTime << " seconds";
		playermsg.addString(ss.str());
	} else {
		playermsg.add<uint16_t>(0x00);
	}

	if (it.abilities) {
		std::ostringstream ss;
		bool separator = false;
		for (size_t i = 0; i < COMBAT_COUNT; ++i) {
			if (it.abilities->absorbPercent[i] == 0) {
				continue;
			}

			if (separator) {
				ss << ", ";
			} else {
				separator = true;
			}

			ss << getCombatName(indexToCombatType(i)) << ' ' << std::showpos << it.abilities->absorbPercent[i] << std::noshowpos << '%';
		}

		playermsg.addString(ss.str());
	} else {
		playermsg.add<uint16_t>(0x00);
	}

	if (it.minReqLevel != 0) {
		playermsg.addString(std::to_string(it.minReqLevel));
	} else {
		playermsg.add<uint16_t>(0x00);
	}

	if (it.minReqMagicLevel != 0) {
		playermsg.addString(std::to_string(it.minReqMagicLevel));
	} else {
		playermsg.add<uint16_t>(0x00);
	}

	playermsg.addString(it.vocationString);

	playermsg.addString(it.runeSpellName);
	if (it.abilities) {
		std::ostringstream ss;
		bool separator = false;
		for (uint8_t i = SKILL_FIRST; i <= SKILL_LAST; i++) {
			if (!it.abilities->skills[i]) {
				continue;
			}

			if (separator) {
				ss << ", ";
			} else {
				separator = true;
			}

			ss << getSkillName(i) << ' ' << std::showpos << it.abilities->skills[i] << std::noshowpos;
		}

		if (it.abilities->stats[STAT_MAGICPOINTS] != 0) {
			if (separator) {
				ss << ", ";
			} else {
				separator = true;
			}

			ss << "magic level " << std::showpos << it.abilities->stats[STAT_MAGICPOINTS] << std::noshowpos;
		}

		if (it.abilities->speed != 0) {
			if (separator) {
				ss << ", ";
			}

			ss << "speed " << std::showpos << (it.abilities->speed >> 1) << std::noshowpos;
		}

		playermsg.addString(ss.str());
	} else {
		playermsg.add<uint16_t>(0x00);
	}

	if (it.charges != 0) {
		playermsg.addString(std::to_string(it.charges));
	} else {
		playermsg.add<uint16_t>(0x00);
	}

	std::string weaponName = getWeaponName(it.weaponType);
	if (it.slotPosition & SLOTP_TWO_HAND) {
		if (!weaponName.empty()) {
			weaponName += ", two-handed";
		} else {
			weaponName = "two-handed";
		}
	}

	playermsg.addString(weaponName);
	if (it.weight != 0) {
		std::ostringstream ss;
		if (it.weight < 10) {
			ss << "0.0" << it.weight;
		} else if (it.weight < 100) {
			ss << "0." << it.weight;
		} else {
			std::string weightString = std::to_string(it.weight);
			weightString.insert(weightString.end() - 2, '.');
			ss << weightString;
		}
		ss << " oz";
		playermsg.addString(ss.str());
	} else {
		playermsg.add<uint16_t>(0x00);
	}

	if (version > 1099) {
		playermsg.add<uint16_t>(0x00);
	}

	MarketStatistics* statistics = IOMarket::getInstance().getPurchaseStatistics(itemId);
	if (statistics) {
		playermsg.addByte(0x01);
		playermsg.add<uint32_t>(statistics->numTransactions);
		playermsg.add<uint32_t>(std::min<uint64_t>(std::numeric_limits<uint32_t>::max(), statistics->totalPrice));
		playermsg.add<uint32_t>(statistics->highestPrice);
		playermsg.add<uint32_t>(statistics->lowestPrice);
	} else {
		playermsg.addByte(0x00);
	}

	statistics = IOMarket::getInstance().getSaleStatistics(itemId);
	if (statistics) {
		playermsg.addByte(0x01);
		playermsg.add<uint32_t>(statistics->numTransactions);
		playermsg.add<uint32_t>(std::min<uint64_t>(std::numeric_limits<uint32_t>::max(), statistics->totalPrice));
		playermsg.add<uint32_t>(statistics->highestPrice);
		playermsg.add<uint32_t>(statistics->lowestPrice);
	} else {
		playermsg.addByte(0x00);
	}

	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendQuestLog()
{
	playermsg.reset();
	playermsg.addByte(0xF0);
	playermsg.add<uint16_t>(g_game.quests.getQuestsCount(player));
	for (const Quest& quest : g_game.quests.getQuests()) {
		if (quest.isStarted(player)) {
			playermsg.add<uint16_t>(quest.getID());
			playermsg.addString(quest.getName());
			playermsg.addByte(quest.isCompleted(player));
		}
	}

	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendQuestLine(const Quest* quest)
{
	playermsg.reset();
	playermsg.addByte(0xF1);
	playermsg.add<uint16_t>(quest->getID());
	playermsg.addByte(quest->getMissionsCount(player));
	for (const Mission& mission : quest->getMissions()) {
		if (mission.isStarted(player)) {
			playermsg.addString(mission.getName(player));
			playermsg.addString(mission.getDescription(player));
		}
	}

	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendTradeItemRequest(const std::string& traderName, const Item* item, bool ack)
{
	playermsg.reset();
	if (ack) {
		playermsg.addByte(0x7D);
	} else {
		playermsg.addByte(0x7E);
	}

	playermsg.addString(traderName);
	if (const Container* tradeContainer = item->getContainer()) {
		std::list<const Container*> listContainer {tradeContainer};
		std::list<const Item*> itemList {tradeContainer};
		while (!listContainer.empty()) {
			const Container* container = listContainer.front();
			listContainer.pop_front();
			for (Item* containerItem : container->getItemList()) {
				Container* tmpContainer = containerItem->getContainer();
				if (tmpContainer) {
					listContainer.push_back(tmpContainer);
				}
				itemList.push_back(containerItem);
			}
		}

		playermsg.addByte(itemList.size());
		for (const Item* listItem : itemList) {
			AddItem(listItem);
		}
	} else {
		playermsg.addByte(0x01);
		AddItem(item);
	}
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCloseTrade()
{
	playermsg.reset();
	playermsg.addByte(0x7F);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCloseContainer(uint8_t cid)
{
	playermsg.reset();
	playermsg.addByte(0x6F);
	playermsg.addByte(cid);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCreatureTurn(const Creature* creature, uint32_t stackPos)
{
	if (!canSee(creature)) {
		return;
	}
	
	playermsg.reset();
	playermsg.addByte(0x6B);
	playermsg.addPosition(creature->getPosition());
	playermsg.addByte(stackPos);
	playermsg.add<uint16_t>(0x63);
	playermsg.add<uint32_t>(creature->getID());
	playermsg.addByte(creature->getDirection());
	playermsg.addByte(player->canWalkthroughEx(creature) ? 0x00 : 0x01);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCreatureSay(const Creature* creature, SpeakClasses type, const std::string& text, const Position* pos/* = nullptr*/)
{
	playermsg.reset();
	playermsg.addByte(0xAA);

	static uint32_t statementId = 0;
	playermsg.add<uint32_t>(++statementId);

	playermsg.addString(creature->getName());

	//Add level only for players
	if (const Player* speaker = creature->getPlayer()) {
		playermsg.add<uint16_t>(speaker->getLevel());
	} else {
		playermsg.add<uint16_t>(0x00);
	}

	playermsg.addByte(type);
	if (pos) {
		playermsg.addPosition(*pos);
	} else {
		playermsg.addPosition(creature->getPosition());
	}

	playermsg.addString(text);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendToChannel(const Creature* creature, SpeakClasses type, const std::string& text, uint16_t channelId)
{
	playermsg.reset();
	playermsg.addByte(0xAA);

	static uint32_t statementId = 0;
	playermsg.add<uint32_t>(++statementId);
	if (!creature) {
		playermsg.add<uint32_t>(0x00);
	} else if (type == TALKTYPE_CHANNEL_R2) {
		playermsg.add<uint32_t>(0x00);
		type = TALKTYPE_CHANNEL_R1;
	} else {
		playermsg.addString(creature->getName());
		//Add level only for players
		if (const Player* speaker = creature->getPlayer()) {
			playermsg.add<uint16_t>(speaker->getLevel());
		} else {
			playermsg.add<uint16_t>(0x00);
		}
	}

	playermsg.addByte(type);
	playermsg.add<uint16_t>(channelId);
	playermsg.addString(text);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendPrivateMessage(const Player* speaker, SpeakClasses type, const std::string& text)
{
	playermsg.reset();
	playermsg.addByte(0xAA);
	static uint32_t statementId = 0;
	playermsg.add<uint32_t>(++statementId);
	if (speaker) {
		playermsg.addString(speaker->getName());
		playermsg.add<uint16_t>(speaker->getLevel());
	} else {
		playermsg.add<uint32_t>(0x00);
	}
	playermsg.addByte(type);
	playermsg.addString(text);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCancelTarget()
{
	playermsg.reset();
	playermsg.addByte(0xA3);
	playermsg.add<uint32_t>(0x00);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendChangeSpeed(const Creature* creature, uint32_t speed)
{
	playermsg.reset();
	playermsg.addByte(0x8F);
	playermsg.add<uint32_t>(creature->getID());
	playermsg.add<uint16_t>(creature->getBaseSpeed() / 2);
	playermsg.add<uint16_t>(speed / 2);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendCancelWalk()
{
	playermsg.reset();
	playermsg.addByte(0xB5);
	playermsg.addByte(player->getDirection());
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendSkills()
{
	playermsg.reset();
	AddPlayerSkills();
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendPing()
{
	playermsg.reset();
	playermsg.addByte(0x1D);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendPingBack()
{
	playermsg.reset();
	playermsg.addByte(0x1E);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendDistanceShoot(const Position& from, const Position& to, uint8_t type)
{
	if (version >= 1203) {
		playermsg.reset();
		playermsg.addByte(0x83);
		playermsg.addPosition(from);
		playermsg.addByte(MAGIC_EFFECTS_CREATE_DISTANCEEFFECT);
		playermsg.addByte(type);
		playermsg.addByte(static_cast<uint8_t>(static_cast<int8_t>(static_cast<int32_t>(to.x) - static_cast<int32_t>(from.x))));
		playermsg.addByte(static_cast<uint8_t>(static_cast<int8_t>(static_cast<int32_t>(to.y) - static_cast<int32_t>(from.y))));
		playermsg.addByte(MAGIC_EFFECTS_END_LOOP);
		writeToOutputBuffer(playermsg);
	} else {
		playermsg.reset();
		playermsg.addByte(0x85);
		playermsg.addPosition(from);
		playermsg.addPosition(to);
		playermsg.addByte(type);
		writeToOutputBuffer(playermsg);
	}
}

void ProtocolGame::sendMagicEffect(const Position& pos, uint8_t type)
{
	if (!canSee(pos)) {
		return;
	}

	if (version >= 1203) {
		playermsg.reset();
		playermsg.addByte(0x83);
		playermsg.addPosition(pos);
		playermsg.addByte(MAGIC_EFFECTS_CREATE_EFFECT);
		playermsg.addByte(type);
		playermsg.addByte(MAGIC_EFFECTS_END_LOOP);
		writeToOutputBuffer(playermsg);
	} else {
		playermsg.reset();
		playermsg.addByte(0x83);
		playermsg.addPosition(pos);
		playermsg.addByte(type);
		writeToOutputBuffer(playermsg);
	}
}

void ProtocolGame::sendCreatureHealth(const Creature* creature)
{
	playermsg.reset();
	playermsg.addByte(0x8C);
	playermsg.add<uint32_t>(creature->getID());
	if (creature->isHealthHidden()) {
		playermsg.addByte(0x00);
	} else {
		playermsg.addByte(std::ceil((static_cast<double>(creature->getHealth()) / std::max<int32_t>(creature->getMaxHealth(), 1)) * 100));
	}
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendFYIBox(const std::string& message)
{
	playermsg.reset();
	playermsg.addByte(0x15);
	playermsg.addString(message);
	writeToOutputBuffer(playermsg);
}

//tile
void ProtocolGame::sendMapDescription(const Position& pos)
{
	playermsg.reset();
	playermsg.addByte(0x64);
	playermsg.addPosition(player->getPosition());
	GetMapDescription(pos.x - 8, pos.y - 6, pos.z, 18, 14);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendAddTileItem(const Position& pos, uint32_t stackpos, const Item* item)
{
	if (!canSee(pos)) {
		return;
	}

	playermsg.reset();
	playermsg.addByte(0x6A);
	playermsg.addPosition(pos);
	playermsg.addByte(stackpos);
	AddItem(item);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendUpdateTileItem(const Position& pos, uint32_t stackpos, const Item* item)
{
	if (!canSee(pos)) {
		return;
	}

	playermsg.reset();
	playermsg.addByte(0x6B);
	playermsg.addPosition(pos);
	playermsg.addByte(stackpos);
	AddItem(item);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendRemoveTileThing(const Position& pos, uint32_t stackpos)
{
	if (!canSee(pos)) {
		return;
	}

	playermsg.reset();
	RemoveTileThing(pos, stackpos);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendUpdateTile(const Tile* tile, const Position& pos)
{
	if (!canSee(pos)) {
		return;
	}

	playermsg.reset();
	playermsg.addByte(0x69);
	playermsg.addPosition(pos);
	if (tile) {
		GetTileDescription(tile);
		playermsg.addByte(0x00);
		playermsg.addByte(0xFF);
	} else {
		playermsg.addByte(0x01);
		playermsg.addByte(0xFF);
	}

	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendFightModes()
{
	playermsg.reset();
	playermsg.addByte(0xA7);
	playermsg.addByte(player->fightMode);
	playermsg.addByte(player->chaseMode);
	playermsg.addByte(player->secureMode);
	playermsg.addByte(PVP_MODE_DOVE);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendAddCreature(const Creature* creature, const Position& pos, int32_t stackpos, bool isLogin)
{
	if (!canSee(pos)) {
		return;
	}

	if (creature != player) {
		if (stackpos != -1) {
			playermsg.reset();
			playermsg.addByte(0x6A);
			playermsg.addPosition(pos);
			playermsg.addByte(stackpos);

			bool known;
			uint32_t removedKnown;
			checkCreatureAsKnown(creature->getID(), known, removedKnown);
			AddCreature(creature, known, removedKnown);
			writeToOutputBuffer(playermsg);
		}

		if (isLogin) {
			sendMagicEffect(pos, CONST_ME_TELEPORT);
		}
		return;
	}

	playermsg.reset();

	playermsg.addByte(0x17);

	playermsg.add<uint32_t>(player->getID());
	playermsg.add<uint16_t>(0x32); // beat duration (50)

	playermsg.addDouble(Creature::speedA, 3);
	playermsg.addDouble(Creature::speedB, 3);
	playermsg.addDouble(Creature::speedC, 3);

	// can report bugs?
	if (player->getAccountType() >= ACCOUNT_TYPE_TUTOR) {
		playermsg.addByte(0x01);
	} else {
		playermsg.addByte(0x00);
	}

	playermsg.addByte(0x00); // can change pvp framing option
	playermsg.addByte(0x00); // expert mode button enabled

	playermsg.add<uint16_t>(0x00); // URL (string) to ingame store images
	playermsg.add<uint16_t>(25); // premium coin package size

	if (version >= 1150 || addExivaRestrictions) {
		playermsg.addByte(0x01); // exiva button enabled
	}

	if (version >= 1215) {
		playermsg.addByte(0x00); // tournament button enabled
	}

	playermsg.addByte(0x0A); // sendPendingStateEntered
	playermsg.addByte(0x0F); // sendEnterWorld

	//gameworld settings
	AddWorldLight(g_game.getWorldLightInfo());

	writeToOutputBuffer(playermsg);

	sendTibiaTime(g_game.getLightHour());
	sendMapDescription(pos);
	if (isLogin) {
		sendMagicEffect(pos, CONST_ME_TELEPORT);
	}

	for (int i = CONST_SLOT_FIRST; i <= CONST_SLOT_LAST; ++i) {
		sendInventoryItem(static_cast<slots_t>(i), player->getInventoryItem(static_cast<slots_t>(i)));
	}

	sendStats();
	sendSkills();
	sendBlessStatus();
	sendPremiumTrigger();
	//sendStoreHighlight();

	//player light level
	sendCreatureLight(creature);
	sendVIPEntries();

	sendBasicData();
	sendItems();
	//sendPreyData();
	if (version >= 1130) {
		sendClientCheck();
		sendGameNews();
	}
	player->sendIcons();
}

void ProtocolGame::sendMoveCreature(const Creature* creature, const Position& newPos, int32_t newStackPos, const Position& oldPos, int32_t oldStackPos, bool teleport)
{
	if (creature == player) {
		if (oldStackPos >= 10) {
			sendMapDescription(newPos);
		} else if (teleport) {
			playermsg.reset();
			RemoveTileThing(oldPos, oldStackPos);
			writeToOutputBuffer(playermsg);
			sendMapDescription(newPos);
		} else {
			playermsg.reset();
			if (oldPos.z == 7 && newPos.z >= 8) {
				RemoveTileThing(oldPos, oldStackPos);
			} else {
				playermsg.addByte(0x6D);
				playermsg.addPosition(oldPos);
				playermsg.addByte(oldStackPos);
				playermsg.addPosition(newPos);
			}

			if (newPos.z > oldPos.z) {
				MoveDownCreature(creature, newPos, oldPos);
			} else if (newPos.z < oldPos.z) {
				MoveUpCreature(creature, newPos, oldPos);
			}

			if (oldPos.y > newPos.y) { // north, for old x
				playermsg.addByte(0x65);
				GetMapDescription(oldPos.x - 8, newPos.y - 6, newPos.z, 18, 1);
			} else if (oldPos.y < newPos.y) { // south, for old x
				playermsg.addByte(0x67);
				GetMapDescription(oldPos.x - 8, newPos.y + 7, newPos.z, 18, 1);
			}

			if (oldPos.x < newPos.x) { // east, [with new y]
				playermsg.addByte(0x66);
				GetMapDescription(newPos.x + 9, newPos.y - 6, newPos.z, 1, 14);
			} else if (oldPos.x > newPos.x) { // west, [with new y]
				playermsg.addByte(0x68);
				GetMapDescription(newPos.x - 8, newPos.y - 6, newPos.z, 1, 14);
			}
			writeToOutputBuffer(playermsg);
		}
	} else if (canSee(oldPos) && canSee(creature->getPosition())) {
		if (teleport || (oldPos.z == 7 && newPos.z >= 8) || oldStackPos >= 10) {
			sendRemoveTileThing(oldPos, oldStackPos);
			sendAddCreature(creature, newPos, newStackPos, false);
		} else {
			playermsg.reset();
			playermsg.addByte(0x6D);
			playermsg.addPosition(oldPos);
			playermsg.addByte(oldStackPos);
			playermsg.addPosition(creature->getPosition());
			writeToOutputBuffer(playermsg);
		}
	} else if (canSee(oldPos)) {
		sendRemoveTileThing(oldPos, oldStackPos);
	} else if (canSee(creature->getPosition())) {
		sendAddCreature(creature, newPos, newStackPos, false);
	}
}

void ProtocolGame::sendInventoryItem(slots_t slot, const Item* item)
{
	playermsg.reset();
	if (item) {
		playermsg.addByte(0x78);
		playermsg.addByte(slot);
		AddItem(item);
	} else {
		playermsg.addByte(0x79);
		playermsg.addByte(slot);
	}
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendItems()
{
	playermsg.reset();
	playermsg.addByte(0xF5);

	const std::vector<uint16_t>& inventory = Item::items.getInventory();
	playermsg.add<uint16_t>(inventory.size() + 11);
	for (uint16_t i = 1; i <= 11; i++) {
		playermsg.add<uint16_t>(i);
		playermsg.addByte(0); //always 0
		playermsg.add<uint16_t>(1); // always 1
	}

	for (auto clientId : inventory) {
		playermsg.add<uint16_t>(clientId);
		playermsg.addByte(0); //always 0
		playermsg.add<uint16_t>(1);
	}

	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendAddContainerItem(uint8_t cid, uint16_t slot, const Item* item)
{
	playermsg.reset();
	playermsg.addByte(0x70);
	playermsg.addByte(cid);
	playermsg.add<uint16_t>(slot);
	AddItem(item);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendUpdateContainerItem(uint8_t cid, uint16_t slot, const Item* item)
{
	playermsg.reset();
	playermsg.addByte(0x71);
	playermsg.addByte(cid);
	playermsg.add<uint16_t>(slot);
	AddItem(item);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendRemoveContainerItem(uint8_t cid, uint16_t slot, const Item* lastItem)
{
	playermsg.reset();
	playermsg.addByte(0x72);
	playermsg.addByte(cid);
	playermsg.add<uint16_t>(slot);
	if (lastItem) {
		AddItem(lastItem);
	} else {
		playermsg.add<uint16_t>(0x00);
	}
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendTextWindow(uint32_t windowTextId, Item* item, uint16_t maxlen, bool canWrite)
{
	playermsg.reset();
	playermsg.addByte(0x96);
	playermsg.add<uint32_t>(windowTextId);
	AddItem(item);
	if (canWrite) {
		playermsg.add<uint16_t>(maxlen);
		playermsg.addString(item->getText());
	} else {
		const std::string& text = item->getText();
		playermsg.add<uint16_t>(text.size());
		playermsg.addString(text);
	}

	const std::string& writer = item->getWriter();
	if (!writer.empty()) {
		playermsg.addString(writer);
	} else {
		playermsg.add<uint16_t>(0x00);
	}

	time_t writtenDate = item->getDate();
	if (writtenDate != 0) {
		playermsg.addString(formatDateShort(writtenDate));
	} else {
		playermsg.add<uint16_t>(0x00);
	}

	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendTextWindow(uint32_t windowTextId, uint32_t itemId, const std::string& text)
{
	playermsg.reset();
	playermsg.addByte(0x96);
	playermsg.add<uint32_t>(windowTextId);
	AddItem(itemId, 1);
	playermsg.add<uint16_t>(text.size());
	playermsg.addString(text);
	playermsg.add<uint16_t>(0x00);
	playermsg.add<uint16_t>(0x00);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendHouseWindow(uint32_t windowTextId, const std::string& text)
{
	playermsg.reset();
	playermsg.addByte(0x97);
	playermsg.addByte(0x00);
	playermsg.add<uint32_t>(windowTextId);
	playermsg.addString(text);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendOutfitWindow()
{
	playermsg.reset();
	playermsg.addByte(0xC8);

	bool mounted = false;
	Outfit_t currentOutfit = player->getDefaultOutfit();
	Mount* currentMount = g_game.mounts.getMountByID(player->getCurrentMount());
	if (currentMount) {
		mounted = (currentOutfit.lookMount == currentMount->clientId);
		currentOutfit.lookMount = currentMount->clientId;
	}

	AddOutfit(currentOutfit);

	std::vector<ProtocolOutfit> protocolOutfits;
	if (player->isAccessPlayer()) {
		static const std::string gmOutfitName = "Gamemaster";
		protocolOutfits.emplace_back(gmOutfitName, 75, 0);

		static const std::string csOutfitName = "Customer Support";
		protocolOutfits.emplace_back(csOutfitName, 266, 0);

		static const std::string cmOutfitName = "Community Manager";
		protocolOutfits.emplace_back(cmOutfitName, 302, 0);
	}

	const auto& outfits = Outfits::getInstance().getOutfits(player->getSex());
	protocolOutfits.reserve(outfits.size());
	for (const Outfit& outfit : outfits) {
		uint8_t addons;
		if (!player->getOutfitAddons(outfit, addons)) {
			continue;
		}

		protocolOutfits.emplace_back(outfit.name, outfit.lookType, addons);
		if (protocolOutfits.size() == 150 && version < 1185) {
			break;
		}
	}

	if (version >= 1185) {
		playermsg.add<uint16_t>(protocolOutfits.size());
	} else {
		playermsg.addByte(protocolOutfits.size());
	}

	for (const ProtocolOutfit& outfit : protocolOutfits) {
		playermsg.add<uint16_t>(outfit.lookType);
		playermsg.addString(outfit.name);
		playermsg.addByte(outfit.addons);
		if (version >= 1185) {
			playermsg.addByte(0x00);
		}
	}

	std::vector<const Mount*> mounts;
	for (const Mount& mount : g_game.mounts.getMounts()) {
		if (player->hasMount(&mount)) {
			mounts.push_back(&mount);
		}
	}

	if (version >= 1185) {
		playermsg.add<uint16_t>(mounts.size());
	} else {
		playermsg.addByte(mounts.size());
	}

	for (const Mount* mount : mounts) {
		playermsg.add<uint16_t>(mount->clientId);
		playermsg.addString(mount->name);
		if (version >= 1185) {
			playermsg.addByte(0x00);
		}
	}

	if (version >= 1185) {
		playermsg.addByte(0x00);//Try outfit
		playermsg.addByte(mounted ? 0x01 : 0x00);
	}

	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendUpdatedVIPStatus(uint32_t guid, VipStatus_t newStatus)
{
	playermsg.reset();
	playermsg.addByte(0xD3);
	playermsg.add<uint32_t>(guid);
	playermsg.addByte(newStatus);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendVIP(uint32_t guid, const std::string& name, const std::string& description, uint32_t icon, bool notify, VipStatus_t status)
{
	playermsg.reset();
	playermsg.addByte(0xD2);
	playermsg.add<uint32_t>(guid);
	playermsg.addString(name);
	playermsg.addString(description);
	playermsg.add<uint32_t>(std::min<uint32_t>(10, icon));
	playermsg.addByte(notify ? 0x01 : 0x00);
	playermsg.addByte(status);
	if (version >= 1110) {
		playermsg.addByte(0x00);
	}
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendVIPEntries()
{
	const std::forward_list<VIPEntry>& vipEntries = IOLoginData::getVIPEntries(player->getAccount());
	for (const VIPEntry& entry : vipEntries) {
		VipStatus_t vipStatus = VIPSTATUS_ONLINE;

		Player* vipPlayer = g_game.getPlayerByGUID(entry.guid);
		if (!vipPlayer || vipPlayer->isInGhostMode() || player->isAccessPlayer()) {
			vipStatus = VIPSTATUS_OFFLINE;
		}

		sendVIP(entry.guid, entry.name, entry.description, entry.icon, entry.notify, vipStatus);
	}
}

void ProtocolGame::sendSpellCooldown(uint8_t spellId, uint32_t time)
{
	playermsg.reset();
	playermsg.addByte(0xA4);
	if (version < 1120 && spellId >= 170) {
		spellId = 150;
	}
	playermsg.addByte(spellId);
	playermsg.add<uint32_t>(time);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendSpellGroupCooldown(SpellGroup_t groupId, uint32_t time)
{
	playermsg.reset();
	playermsg.addByte(0xA5);
	playermsg.addByte(groupId);
	playermsg.add<uint32_t>(time);
	writeToOutputBuffer(playermsg);
}

void ProtocolGame::sendModalWindow(const ModalWindow& modalWindow)
{
	playermsg.reset();
	playermsg.addByte(0xFA);

	playermsg.add<uint32_t>(modalWindow.id);
	playermsg.addString(modalWindow.title);
	playermsg.addString(modalWindow.message);

	playermsg.addByte(modalWindow.buttons.size());
	for (const auto& it : modalWindow.buttons) {
		playermsg.addString(it.first);
		playermsg.addByte(it.second);
	}

	playermsg.addByte(modalWindow.choices.size());
	for (const auto& it : modalWindow.choices) {
		playermsg.addString(it.first);
		playermsg.addByte(it.second);
	}

	playermsg.addByte(modalWindow.defaultEscapeButton);
	playermsg.addByte(modalWindow.defaultEnterButton);
	playermsg.addByte(modalWindow.priority ? 0x01 : 0x00);

	writeToOutputBuffer(playermsg);
}

////////////// Add common messages
void ProtocolGame::AddCreature(const Creature* creature, bool known, uint32_t remove)
{
	CreatureType_t creatureType = creature->getType();

	const Player* otherPlayer = creature->getPlayer();
	if (known) {
		playermsg.add<uint16_t>(0x62);
		playermsg.add<uint32_t>(creature->getID());
	} else {
		playermsg.add<uint16_t>(0x61);
		playermsg.add<uint32_t>(remove);
		playermsg.add<uint32_t>(creature->getID());
		playermsg.addByte(creatureType);
		playermsg.addString(creature->getName());
	}

	if (creature->isHealthHidden()) {
		playermsg.addByte(0x00);
	} else {
		playermsg.addByte(std::ceil((static_cast<double>(creature->getHealth()) / std::max<int32_t>(creature->getMaxHealth(), 1)) * 100));
	}

	playermsg.addByte(creature->getDirection());
	if (!creature->isInGhostMode() && !creature->isInvisible()) {
		AddOutfit(creature->getCurrentOutfit());
	} else {
		static Outfit_t outfit;
		AddOutfit(outfit);
	}

	LightInfo lightInfo = creature->getCreatureLight();
	playermsg.addByte(player->isAccessPlayer() ? 0xFF : lightInfo.level);
	playermsg.addByte(lightInfo.color);

	playermsg.add<uint16_t>(creature->getStepSpeed() / 2);

	playermsg.addByte(player->getSkullClient(creature));
	playermsg.addByte(player->getPartyShield(otherPlayer));
	if (!known) {
		playermsg.addByte(player->getGuildEmblem(otherPlayer));
	}

	if (creatureType == CREATURETYPE_MONSTER) {
		const Creature* master = creature->getMaster();
		if (master) {
			const Player* masterPlayer = master->getPlayer();
			if (masterPlayer) {
				if (masterPlayer == player) {
					creatureType = CREATURETYPE_SUMMON_OWN;
				} else {
					creatureType = CREATURETYPE_SUMMON_OTHERS;
				}
			}
		}
	}

	if (version >= 1120) {
		if (creatureType == CREATURETYPE_SUMMON_OTHERS) {
			creatureType = CREATURETYPE_SUMMON_OWN;
		}
		playermsg.addByte(creatureType);
		if (creatureType == CREATURETYPE_SUMMON_OWN) {
			const Creature* master = creature->getMaster();
			if (master) {
				playermsg.add<uint32_t>(master->getID());
			} else {
				playermsg.add<uint32_t>(0);
			}
		}
	} else {
		playermsg.addByte(creatureType); // Type (for summons)
	}
	if (version >= 1220 && creatureType == CREATURETYPE_PLAYER) {
		playermsg.addByte(creature->getPlayer()->getVocation()->getClientId());
	}

	playermsg.addByte(creature->getSpeechBubble());
	playermsg.addByte(0xFF); // MARK_UNMARKED
	if (version >= 1110) {
		playermsg.addByte(0); // inspection type
	}

	if (version < 1185) {
		if (otherPlayer) {
			playermsg.add<uint16_t>(otherPlayer->getHelpers());
		} else {
			playermsg.add<uint16_t>(0x00);
		}
	}

	playermsg.addByte(player->canWalkthroughEx(creature) ? 0x00 : 0x01);
}

void ProtocolGame::AddPlayerStats()
{
	playermsg.addByte(0xA0);

	playermsg.add<uint16_t>(std::min<int32_t>(player->getHealth(), std::numeric_limits<uint16_t>::max()));
	playermsg.add<uint16_t>(std::min<int32_t>(player->getMaxHealth(), std::numeric_limits<uint16_t>::max()));

	playermsg.add<uint32_t>(player->getFreeCapacity());
	if (version < 1150) {
		playermsg.add<uint32_t>(player->getCapacity());
	}

	playermsg.add<uint64_t>(player->getExperience());

	playermsg.add<uint16_t>(player->getLevel());
	playermsg.addByte(player->getLevelPercent());

	playermsg.add<uint16_t>(100); // base xp gain rate
	if (version < 1150) {
		playermsg.add<uint16_t>(0); // xp voucher
	}
	playermsg.add<uint16_t>(0); // low level bonus
	playermsg.add<uint16_t>(0); // xp boost
	playermsg.add<uint16_t>(100); // stamina multiplier (100 = x1.0)

	playermsg.add<uint16_t>(std::min<int32_t>(player->getMana(), std::numeric_limits<uint16_t>::max()));
	playermsg.add<uint16_t>(std::min<int32_t>(player->getMaxMana(), std::numeric_limits<uint16_t>::max()));

	if (version < 1200) {
		playermsg.addByte(std::min<uint32_t>(player->getMagicLevel(), std::numeric_limits<uint8_t>::max()));
		playermsg.addByte(std::min<uint32_t>(player->getBaseMagicLevel(), std::numeric_limits<uint8_t>::max()));
		playermsg.addByte(player->getMagicLevelPercent());
	}

	playermsg.addByte(player->getSoul());

	playermsg.add<uint16_t>(player->getStaminaMinutes());

	playermsg.add<uint16_t>(player->getBaseSpeed() / 2);

	Condition* condition = player->getCondition(CONDITION_REGENERATION);
	playermsg.add<uint16_t>(condition ? condition->getTicks() / 1000 : 0x00);

	playermsg.add<uint16_t>(player->getOfflineTrainingTime() / 60 / 1000);

	playermsg.add<uint16_t>(0); // xp boost time (seconds)
	playermsg.addByte(0); // enables exp boost in the store
}

void ProtocolGame::AddPlayerSkills()
{
	playermsg.addByte(0xA1);
	if (version >= 1200) {
		playermsg.add<uint16_t>(player->getMagicLevel());
		playermsg.add<uint16_t>(player->getBaseMagicLevel());
		playermsg.add<uint16_t>(player->getBaseMagicLevel());//loyalty bonus
		playermsg.add<uint16_t>(player->getMagicLevelPercent() * 100);
	}

	for (uint8_t i = SKILL_FIRST; i <= SKILL_LAST; ++i) {
		playermsg.add<uint16_t>(std::min<int32_t>(player->getSkillLevel(i), std::numeric_limits<uint16_t>::max()));
		playermsg.add<uint16_t>(player->getBaseSkill(i));
		if (version >= 1200) {
			playermsg.add<uint16_t>(player->getBaseSkill(i));//loyalty bonus
			playermsg.add<uint16_t>(player->getSkillPercent(i) * 100);
		} else {
			playermsg.addByte(player->getSkillPercent(i));
		}
	}

	for (uint8_t i = SPECIALSKILL_FIRST; i <= SPECIALSKILL_LAST; ++i) {
		playermsg.add<uint16_t>(std::min<int32_t>(100, player->varSpecialSkills[i]));
		playermsg.add<uint16_t>(0);
	}

	if (version >= 1150) {
		playermsg.add<uint32_t>(player->getCapacity());
		playermsg.add<uint32_t>(player->getCapacity());
	}
}

void ProtocolGame::AddOutfit(const Outfit_t& outfit, bool addMount/* = true*/)
{
	playermsg.add<uint16_t>(outfit.lookType);
	if (outfit.lookType != 0) {
		playermsg.addByte(outfit.lookHead);
		playermsg.addByte(outfit.lookBody);
		playermsg.addByte(outfit.lookLegs);
		playermsg.addByte(outfit.lookFeet);
		playermsg.addByte(outfit.lookAddons);
	} else {
		playermsg.addItemId(outfit.lookTypeEx);
	}

	if (addMount) {
		playermsg.add<uint16_t>(outfit.lookMount);
	}
}

void ProtocolGame::AddWorldLight(LightInfo lightInfo)
{
	playermsg.addByte(0x82);
	playermsg.addByte((player->isAccessPlayer() ? 0xFF : lightInfo.level));
	playermsg.addByte(lightInfo.color);
}

void ProtocolGame::AddCreatureLight(const Creature* creature)
{
	LightInfo lightInfo = creature->getCreatureLight();

	playermsg.addByte(0x8D);
	playermsg.add<uint32_t>(creature->getID());
	playermsg.addByte((player->isAccessPlayer() ? 0xFF : lightInfo.level));
	playermsg.addByte(lightInfo.color);
}

//tile
void ProtocolGame::RemoveTileThing(const Position& pos, uint32_t stackpos)
{
	if (stackpos >= 10) {
		return;
	}

	playermsg.addByte(0x6C);
	playermsg.addPosition(pos);
	playermsg.addByte(stackpos);
}

void ProtocolGame::MoveUpCreature(const Creature* creature, const Position& newPos, const Position& oldPos)
{
	if (creature != player) {
		return;
	}

	//floor change up
	playermsg.addByte(0xBE);

	//going to surface
	if (newPos.z == 7) {
		int32_t skip = -1;
		GetFloorDescription(oldPos.x - 8, oldPos.y - 6, 5, 18, 14, 3, skip); //(floor 7 and 6 already set)
		GetFloorDescription(oldPos.x - 8, oldPos.y - 6, 4, 18, 14, 4, skip);
		GetFloorDescription(oldPos.x - 8, oldPos.y - 6, 3, 18, 14, 5, skip);
		GetFloorDescription(oldPos.x - 8, oldPos.y - 6, 2, 18, 14, 6, skip);
		GetFloorDescription(oldPos.x - 8, oldPos.y - 6, 1, 18, 14, 7, skip);
		GetFloorDescription(oldPos.x - 8, oldPos.y - 6, 0, 18, 14, 8, skip);
		if (skip >= 0) {
			playermsg.addByte(skip);
			playermsg.addByte(0xFF);
		}
	}
	//underground, going one floor up (still underground)
	else if (newPos.z > 7) {
		int32_t skip = -1;
		GetFloorDescription(oldPos.x - 8, oldPos.y - 6, oldPos.getZ() - 3, 18, 14, 3, skip);
		if (skip >= 0) {
			playermsg.addByte(skip);
			playermsg.addByte(0xFF);
		}
	}

	//moving up a floor up makes us out of sync
	//west
	playermsg.addByte(0x68);
	GetMapDescription(oldPos.x - 8, oldPos.y - 5, newPos.z, 1, 14);

	//north
	playermsg.addByte(0x65);
	GetMapDescription(oldPos.x - 8, oldPos.y - 6, newPos.z, 18, 1);
}

void ProtocolGame::MoveDownCreature(const Creature* creature, const Position& newPos, const Position& oldPos)
{
	if (creature != player) {
		return;
	}

	//floor change down
	playermsg.addByte(0xBF);

	//going from surface to underground
	if (newPos.z == 8) {
		int32_t skip = -1;

		GetFloorDescription(oldPos.x - 8, oldPos.y - 6, newPos.z, 18, 14, -1, skip);
		GetFloorDescription(oldPos.x - 8, oldPos.y - 6, newPos.z + 1, 18, 14, -2, skip);
		GetFloorDescription(oldPos.x - 8, oldPos.y - 6, newPos.z + 2, 18, 14, -3, skip);
		if (skip >= 0) {
			playermsg.addByte(skip);
			playermsg.addByte(0xFF);
		}
	}
	//going further down
	else if (newPos.z > oldPos.z && newPos.z > 8 && newPos.z < 14) {
		int32_t skip = -1;
		GetFloorDescription(oldPos.x - 8, oldPos.y - 6, newPos.z + 2, 18, 14, -3, skip);
		if (skip >= 0) {
			playermsg.addByte(skip);
			playermsg.addByte(0xFF);
		}
	}

	//moving down a floor makes us out of sync
	//east
	playermsg.addByte(0x66);
	GetMapDescription(oldPos.x + 9, oldPos.y - 7, newPos.z, 1, 14);

	//south
	playermsg.addByte(0x67);
	GetMapDescription(oldPos.x - 8, oldPos.y + 7, newPos.z, 18, 1);
}

void ProtocolGame::AddShopItem(const ShopInfo& item)
{
	const ItemType& it = Item::items[item.itemId];
	playermsg.add<uint16_t>(it.clientId);
	if (it.isSplash() || it.isFluidContainer()) {
		playermsg.addByte(serverFluidToClient(item.subType));
	} else {
		playermsg.addByte(0x00);
	}

	playermsg.addString(item.realName);
	playermsg.add<uint32_t>(it.weight);
	playermsg.add<uint32_t>(item.buyPrice);
	playermsg.add<uint32_t>(item.sellPrice);
}

void ProtocolGame::AddItem(uint16_t id, uint8_t count)
{
	const ItemType& it = Item::items[id];

	playermsg.add<uint16_t>(it.clientId);
	if (version < 1200) {
		playermsg.addByte(0xFF); // MARK_UNMARKED
	}

	if (it.stackable) {
		playermsg.addByte(count);
	} else if (it.isSplash() || it.isFluidContainer()) {
		playermsg.addByte(fluidMap[count & 7]);
	}

	if (it.isAnimation) {
		playermsg.addByte(0xFE); // random phase (0xFF for async)
	}

	if (version >= 1150 && it.isContainer()) {
		playermsg.addByte(0);
	}
}

void ProtocolGame::AddItem(const Item* item)
{
	const ItemType& it = Item::items[item->getID()];

	playermsg.add<uint16_t>(it.clientId);
	if (version < 1200) {
		playermsg.addByte(0xFF); // MARK_UNMARKED
	}

	if (it.stackable) {
		playermsg.addByte(std::min<uint16_t>(0xFF, item->getItemCount()));
	} else if (it.isSplash() || it.isFluidContainer()) {
		playermsg.addByte(fluidMap[item->getFluidType() & 7]);
	}

	if (it.isAnimation) {
		playermsg.addByte(0xFE); // random phase (0xFF for async)
	}

	if (version >= 1150 && it.isContainer()) {
		playermsg.addByte(0);
	}
}

void ProtocolGame::parseExtendedOpcode(NetworkMessage& msg)
{
	uint8_t opcode = msg.getByte();
	const std::string& buffer = msg.getString();

	// process additional opcodes via lua script event
	addGameTask(&Game::parsePlayerExtendedOpcode, player->getID(), opcode, buffer);
}
