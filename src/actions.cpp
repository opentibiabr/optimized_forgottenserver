/**
 * The Forgotten Server - a free and open-source MMORPG server emulator
 * Copyright (C) 2019  Mark Samman <mark.samman@gmail.com>
 * Copyright (C) 2019-2021  Saiyans King
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

#include "actions.h"
#include "bed.h"
#include "configmanager.h"
#include "container.h"
#include "game.h"
#include "pugicast.h"
#include "spells.h"

extern Game g_game;
extern Spells* g_spells;
extern Actions* g_actions;
extern ConfigManager g_config;

Actions::Actions() :
	scriptInterface("Action Interface")
{
	scriptInterface.initState();
}

Actions::~Actions()
{
	clear(false);
}

void Actions::clearMap(ActionUseMap& map, bool fromLua)
{
	for (auto it = map.begin(); it != map.end(); ) {
		if (fromLua == it->second->fromLua) {
			it = map.erase(it);
		} else {
			++it;
		}
	}
}

void Actions::clear(bool fromLua)
{
	clearMap(useItemMap, fromLua);
	clearMap(uniqueItemMap, fromLua);
	clearMap(actionItemMap, fromLua);

	reInitState(fromLua);
}

LuaScriptInterface& Actions::getScriptInterface()
{
	return scriptInterface;
}

std::string Actions::getScriptBaseName() const
{
	return "actions";
}

Event_ptr Actions::getEvent(const std::string& nodeName)
{
	if (strcasecmp(nodeName.c_str(), "action") != 0) {
		return nullptr;
	}
	return Event_ptr(new Action(&scriptInterface));
}

bool Actions::registerEvent(Event_ptr event, const pugi::xml_node& node)
{
	Action_ptr action{static_cast<Action*>(event.release())}; //event is guaranteed to be an Action

	pugi::xml_attribute attr;
	if ((attr = node.attribute("itemid"))) {
		for (std::string& itemId : explodeString(attr.as_string(), ";")) {
			try {
				std::vector<int32_t> itemIds = vectorAtoi(explodeString(itemId, "-"));
				auto result = useItemMap.emplace(static_cast<uint16_t>(itemIds[0]), action);
				if (!result.second) {
					std::cout << "[Warning - Actions::registerEvent] Duplicate registered item with id: " << itemIds[0] << std::endl;
				}

				if (itemIds.size() > 1) {
					while (itemIds[0] < itemIds[1]) {
						result = useItemMap.emplace(static_cast<uint16_t>(++itemIds[0]), action);
						if (!result.second) {
							std::cout << "[Warning - Actions::registerEvent] Duplicate registered item with id: " << itemIds[0] << std::endl;
						}
					}
				}
			} catch (const std::invalid_argument&) {
				std::cout << "[Warning - Actions::registerEvent] Registered itemid have invalid id: " << itemId << std::endl;
				continue;
			} catch (const std::out_of_range&) {
				std::cout << "[Warning - Actions::registerEvent] Registered itemid have too long id: " << itemId << std::endl;
				continue;
			}
		}
	} else if ((attr = node.attribute("fromid"))) {
		pugi::xml_attribute toIdAttribute = node.attribute("toid");
		if (!toIdAttribute) {
			std::cout << "[Warning - Actions::registerEvent] Missing toid in fromid: " << attr.as_string() << std::endl;
			return false;
		}

		try {
			std::vector<int32_t> fromIds = vectorAtoi(explodeString(attr.as_string(), ";"));
			std::vector<int32_t> toIds = vectorAtoi(explodeString(toIdAttribute.as_string(), ";"));
			if (fromIds.size() != toIds.size()) {
				std::cout << "[Warning - MoveEvents::registerEvent] Registered range(fromid - toid) is malformed: (" << attr.as_string() << " - " << toIdAttribute.as_string() << ")" << std::endl;
				return false;
			}

			for (size_t i = 0, end = fromIds.size(); i < end; ++i) {
				auto result = useItemMap.emplace(static_cast<uint16_t>(fromIds[i]), action);
				if (!result.second) {
					std::cout << "[Warning - Actions::registerEvent] Duplicate registered item with id: " << fromIds[i] << " in range(fromid - toid): (" << attr.as_string() << " - " << toIdAttribute.as_string() << ")" << std::endl;
				}

				while (fromIds[i] < toIds[i]) {
					result = useItemMap.emplace(static_cast<uint16_t>(++fromIds[i]), action);
					if (!result.second) {
						std::cout << "[Warning - Actions::registerEvent] Duplicate registered item with id: " << fromIds[i] << " in range(fromid - toid): (" << attr.as_string() << " - " << toIdAttribute.as_string() << ")" << std::endl;
					}
				}
			}
		} catch (const std::invalid_argument&) {
			std::cout << "[Warning - Actions::registerEvent] Registered range(fromid - toid) have invalid ids: (" << attr.as_string() << " - " << toIdAttribute.as_string() << ")" << std::endl;
		} catch (const std::out_of_range&) {
			std::cout << "[Warning - Actions::registerEvent] Registered range(fromid - toid) have too long ids: (" << attr.as_string() << " - " << toIdAttribute.as_string() << ")" << std::endl;
		}
	} else if ((attr = node.attribute("uniqueid"))) {
		for (std::string& uniqueId : explodeString(attr.as_string(), ";")) {
			try {
				std::vector<int32_t> uniqueIds = vectorAtoi(explodeString(uniqueId, "-"));
				auto result = uniqueItemMap.emplace(static_cast<uint16_t>(uniqueIds[0]), action);
				if (!result.second) {
					std::cout << "[Warning - Actions::registerEvent] Duplicate registered item with uniqueid: " << uniqueIds[0] << std::endl;
				}

				if (uniqueIds.size() > 1) {
					while (uniqueIds[0] < uniqueIds[1]) {
						result = uniqueItemMap.emplace(static_cast<uint16_t>(++uniqueIds[0]), action);
						if (!result.second) {
							std::cout << "[Warning - Actions::registerEvent] Duplicate registered item with uniqueid: " << uniqueIds[0] << std::endl;
						}
					}
				}
			} catch (const std::invalid_argument&) {
				std::cout << "[Warning - Actions::registerEvent] Registered uniqueid have invalid id: " << uniqueId << std::endl;
				continue;
			} catch (const std::out_of_range&) {
				std::cout << "[Warning - Actions::registerEvent] Registered uniqueid have too long id: " << uniqueId << std::endl;
				continue;
			}
		}
	} else if ((attr = node.attribute("fromuid"))) {
		pugi::xml_attribute toIdAttribute = node.attribute("touid");
		if (!toIdAttribute) {
			std::cout << "[Warning - Actions::registerEvent] Missing touid in fromuid: " << attr.as_string() << std::endl;
			return false;
		}

		try {
			std::vector<int32_t> fromIds = vectorAtoi(explodeString(attr.as_string(), ";"));
			std::vector<int32_t> toIds = vectorAtoi(explodeString(toIdAttribute.as_string(), ";"));
			if (fromIds.size() != toIds.size()) {
				std::cout << "[Warning - MoveEvents::registerEvent] Registered range(fromuid - touid) is malformed: (" << attr.as_string() << " - " << toIdAttribute.as_string() << ")" << std::endl;
				return false;
			}

			for (size_t i = 0, end = fromIds.size(); i < end; ++i) {
				auto result = uniqueItemMap.emplace(static_cast<uint16_t>(fromIds[i]), action);
				if (!result.second) {
					std::cout << "[Warning - Actions::registerEvent] Duplicate registered item with unique id: " << fromIds[i] << " in range(fromuid - touid): (" << attr.as_string() << " - " << toIdAttribute.as_string() << ")" << std::endl;
				}

				while (fromIds[i] < toIds[i]) {
					result = uniqueItemMap.emplace(static_cast<uint16_t>(++fromIds[i]), action);
					if (!result.second) {
						std::cout << "[Warning - Actions::registerEvent] Duplicate registered item with unique id: " << fromIds[i] << " in range(fromuid - touid): (" << attr.as_string() << " - " << toIdAttribute.as_string() << ")" << std::endl;
					}
				}
			}
		} catch (const std::invalid_argument&) {
			std::cout << "[Warning - MoveEvents::registerEvent] Registered range(fromuid - touid) have invalid ids: (" << attr.as_string() << " - " << toIdAttribute.as_string() << ")" << std::endl;
		} catch (const std::out_of_range&) {
			std::cout << "[Warning - MoveEvents::registerEvent] Registered range(fromuid - touid) have too long ids: (" << attr.as_string() << " - " << toIdAttribute.as_string() << ")" << std::endl;
		}
	} else if ((attr = node.attribute("actionid"))) {
		for (std::string& actionId : explodeString(attr.as_string(), ";")) {
			try {
				std::vector<int32_t> actionIds = vectorAtoi(explodeString(actionId, "-"));
				auto result = actionItemMap.emplace(static_cast<uint16_t>(actionIds[0]), action);
				if (!result.second) {
					std::cout << "[Warning - Actions::registerEvent] Duplicate registered item with actionid: " << actionIds[0] << std::endl;
				}

				if (actionIds.size() > 1) {
					while (actionIds[0] < actionIds[1]) {
						result = actionItemMap.emplace(static_cast<uint16_t>(++actionIds[0]), action);
						if (!result.second) {
							std::cout << "[Warning - Actions::registerEvent] Duplicate registered item with actionid: " << actionIds[0] << std::endl;
						}
					}
				}
			} catch (const std::invalid_argument&) {
				std::cout << "[Warning - Actions::registerEvent] Registered actionid have invalid id: " << actionId << std::endl;
				continue;
			} catch (const std::out_of_range&) {
				std::cout << "[Warning - Actions::registerEvent] Registered actionid have too long id: " << actionId << std::endl;
				continue;
			}
		}
	} else if ((attr = node.attribute("fromaid"))) {
		pugi::xml_attribute toIdAttribute = node.attribute("toaid");
		if (!toIdAttribute) {
			std::cout << "[Warning - Actions::registerEvent] Missing toaid in fromaid: " << attr.as_string() << std::endl;
			return false;
		}

		try {
			std::vector<int32_t> fromIds = vectorAtoi(explodeString(attr.as_string(), ";"));
			std::vector<int32_t> toIds = vectorAtoi(explodeString(toIdAttribute.as_string(), ";"));
			if (fromIds.size() != toIds.size()) {
				std::cout << "[Warning - MoveEvents::registerEvent] Registered range(fromaid - toaid) is malformed: (" << attr.as_string() << " - " << toIdAttribute.as_string() << ")" << std::endl;
				return false;
			}

			for (size_t i = 0, end = fromIds.size(); i < end; ++i) {
				auto result = actionItemMap.emplace(static_cast<uint16_t>(fromIds[i]), action);
				if (!result.second) {
					std::cout << "[Warning - Actions::registerEvent] Duplicate registered item with action id: " << fromIds[i] << " in range(fromaid - toaid): (" << attr.as_string() << " - " << toIdAttribute.as_string() << ")" << std::endl;
				}

				while (fromIds[i] < toIds[i]) {
					result = actionItemMap.emplace(static_cast<uint16_t>(++fromIds[i]), action);
					if (!result.second) {
						std::cout << "[Warning - Actions::registerEvent] Duplicate registered item with action id: " << fromIds[i] << " in range(fromaid - toaid): (" << attr.as_string() << " - " << toIdAttribute.as_string() << ")" << std::endl;
					}
				}
			}
		} catch (const std::invalid_argument&) {
			std::cout << "[Warning - MoveEvents::registerEvent] Registered range(fromaid - toaid) have invalid ids: (" << attr.as_string() << " - " << toIdAttribute.as_string() << ")" << std::endl;
		} catch (const std::out_of_range&) {
			std::cout << "[Warning - MoveEvents::registerEvent] Registered range(fromaid - toaid) have too long ids: (" << attr.as_string() << " - " << toIdAttribute.as_string() << ")" << std::endl;
		}
	} else {
		return false;
	}
	return true;
}

bool Actions::registerLuaEvent(Action_ptr& event)
{
	bool result = false;

	std::vector<uint16_t>& itemIdRange = event->getItemIdRange();
	if (!itemIdRange.empty()) {
		for (uint16_t itemId : itemIdRange) {
			auto res = useItemMap.emplace(itemId, event);
			if (!res.second) {
				std::cout << "[Warning - Actions::registerLuaEvent] Duplicate registered item with id: " << itemId << " in range from id: " << event->getItemIdRange()[0] << ", to id: " << event->getItemIdRange()[event->getItemIdRange().size() - 1] << std::endl;
				continue;
			}
			result = true;
		}
		itemIdRange.clear();
		itemIdRange.shrink_to_fit();
	}

	std::vector<uint16_t>& actionIdRange = event->getActionIdRange();
	if (!actionIdRange.empty()) {
		for (uint16_t actionId : actionIdRange) {
			auto res = actionItemMap.emplace(actionId, event);
			if (!res.second) {
				std::cout << "[Warning - Actions::registerLuaEvent] Duplicate registered item with aid: " << actionId << " in range from aid: " << event->getActionIdRange()[0] << ", to aid: " << event->getActionIdRange()[event->getActionIdRange().size() - 1] << std::endl;
				continue;
			}
			result = true;
		}
		actionIdRange.clear();
		actionIdRange.shrink_to_fit();
	}

	std::vector<uint16_t>& uniqueIdRange = event->getUniqueIdRange();
	if (!uniqueIdRange.empty()) {
		for (uint16_t uniqueId : uniqueIdRange) {
			auto res = uniqueItemMap.emplace(uniqueId, event);
			if (!res.second) {
				std::cout << "[Warning - Actions::registerLuaEvent] Duplicate registered item with uid: " << uniqueId << " in range from uid: " << event->getUniqueIdRange()[0] << ", to uid: " << event->getUniqueIdRange()[event->getUniqueIdRange().size() - 1] << std::endl;
				continue;
			}
			result = true;
		}
		uniqueIdRange.clear();
		uniqueIdRange.shrink_to_fit();
	}

	if (!result) {
		std::cout << "[Warning - Actions::registerLuaEvent] There is no id / aid / uid set for this event" << std::endl;
	}
	return result;
}

ReturnValue Actions::canUse(const Player* player, const Position& pos)
{
	if (pos.x != 0xFFFF) {
		const Position& playerPos = player->getPosition();
		if (playerPos.z != pos.z) {
			return playerPos.z > pos.z ? RETURNVALUE_FIRSTGOUPSTAIRS : RETURNVALUE_FIRSTGODOWNSTAIRS;
		}

		if (!Position::areInRange<1, 1>(playerPos, pos)) {
			return RETURNVALUE_TOOFARAWAY;
		}
	}
	return RETURNVALUE_NOERROR;
}

ReturnValue Actions::canUse(const Player* player, const Position& pos, const Item* item)
{
	Action* action = getAction(item);
	if (action) {
		return action->canExecuteAction(player, pos);
	}
	return RETURNVALUE_NOERROR;
}

ReturnValue Actions::canUseFar(const Creature* creature, const Position& toPos, bool checkLineOfSight, bool checkFloor)
{
	if (toPos.x == 0xFFFF) {
		return RETURNVALUE_NOERROR;
	}

	const Position& creaturePos = creature->getPosition();
	if (checkFloor && creaturePos.z != toPos.z) {
		return creaturePos.z > toPos.z ? RETURNVALUE_FIRSTGOUPSTAIRS : RETURNVALUE_FIRSTGODOWNSTAIRS;
	}

	if (!Position::areInRange<7, 5>(toPos, creaturePos)) {
		return RETURNVALUE_TOOFARAWAY;
	}

	if (checkLineOfSight && !g_game.canThrowObjectTo(creaturePos, toPos, checkFloor ? SightLine_CheckSightLineAndFloor : SightLine_CheckSightLine)) {
		return RETURNVALUE_CANNOTTHROW;
	}

	return RETURNVALUE_NOERROR;
}

Action* Actions::getAction(const Item* item)
{
	if (item->hasAttribute(ITEM_ATTRIBUTE_UNIQUEID)) {
		auto it = uniqueItemMap.find(item->getUniqueId());
		if (it != uniqueItemMap.end()) {
			return it->second.get();
		}
	}

	if (item->hasAttribute(ITEM_ATTRIBUTE_ACTIONID)) {
		auto it = actionItemMap.find(item->getActionId());
		if (it != actionItemMap.end()) {
			return it->second.get();
		}
	}

	auto it = useItemMap.find(item->getID());
	if (it != useItemMap.end()) {
		return it->second.get();
	}

	//rune items
	return g_spells->getRuneSpell(item->getID());
}

ReturnValue Actions::internalUseItem(Player* player, const Position& pos, uint8_t index, Item* item, bool isHotkey)
{
	if (Door* door = item->getDoor()) {
		if (!door->canUse(player)) {
			return RETURNVALUE_CANNOTUSETHISOBJECT;
		}
	}

	Action* action = getAction(item);
	if (action) {
		if (action->isScripted()) {
			if (action->executeUse(player, item, pos, nullptr, pos, isHotkey)) {
				return RETURNVALUE_NOERROR;
			}

			if (item->isRemoved()) {
				return RETURNVALUE_CANNOTUSETHISOBJECT;
			}
		} else if (action->function) {
			if (action->function(player, item, pos, nullptr, pos, isHotkey)) {
				return RETURNVALUE_NOERROR;
			}
		}
	}

	if (BedItem* bed = item->getBed()) {
		if (!bed->canUse(player)) {
			return RETURNVALUE_CANNOTUSETHISOBJECT;
		}

		if (bed->trySleep(player)) {
			player->setBedItem(bed);
			g_game.sendOfflineTrainingDialog(player);
		}

		return RETURNVALUE_NOERROR;
	}

	if (Container* container = item->getContainer()) {
		Container* openContainer;

		//depot container
		if (DepotLocker* depot = container->getDepotLocker()) {
			DepotLocker* myDepotLocker = player->getDepotLocker(depot->getDepotId());
			myDepotLocker->setParent(depot->getParent()->getTile());
			openContainer = myDepotLocker;
			player->setLastDepotId(depot->getDepotId());
		} else {
			openContainer = container;
		}

		uint32_t corpseOwner = container->getCorpseOwner();
		if (corpseOwner != 0 && !player->canOpenCorpse(corpseOwner)) {
			return RETURNVALUE_YOUARENOTTHEOWNER;
		}

		//open/close container
		int32_t oldContainerId = player->getContainerID(openContainer);
		if (oldContainerId != -1) {
			player->onCloseContainer(openContainer);
			player->closeContainer(oldContainerId);
		} else {
			player->addContainer(index, openContainer);
			player->onSendContainer(openContainer);
		}

		return RETURNVALUE_NOERROR;
	}

	const ItemType& it = Item::items[item->getID()];
	if (it.canReadText) {
		if (it.canWriteText) {
			player->setWriteItem(item, it.maxTextLen);
			player->sendTextWindow(item, it.maxTextLen, true);
		} else {
			player->setWriteItem(nullptr);
			player->sendTextWindow(item, 0, false);
		}

		return RETURNVALUE_NOERROR;
	}

	return RETURNVALUE_CANNOTUSETHISOBJECT;
}

bool Actions::useItem(Player* player, const Position& pos, uint8_t index, Item* item, bool isHotkey)
{
	player->setNextAction(OTSYS_TIME() + g_config.getNumber(ConfigManager::ACTIONS_DELAY_INTERVAL));
	player->stopWalk();

	if (isHotkey) {
		showUseHotkeyMessage(player, item, player->getItemTypeCount(item->getID(), (Item::items[item->getID()].isFluid() ? item->getFluidType() : -1)));
	}

	ReturnValue ret = internalUseItem(player, pos, index, item, isHotkey);
	if (ret != RETURNVALUE_NOERROR) {
		player->sendCancelMessage(ret);
		return false;
	}
	return true;
}

bool Actions::useItemEx(Player* player, const Position& fromPos, const Position& toPos,
                        uint8_t toStackPos, Item* item, bool isHotkey, Creature* creature/* = nullptr*/)
{
	player->setNextAction(OTSYS_TIME() + g_config.getNumber(ConfigManager::EX_ACTIONS_DELAY_INTERVAL));
	player->stopWalk();

	Action* action = getAction(item);
	if (!action) {
		player->sendCancelMessage(RETURNVALUE_CANNOTUSETHISOBJECT);
		return false;
	}

	ReturnValue ret = action->canExecuteAction(player, toPos);
	if (ret != RETURNVALUE_NOERROR) {
		player->sendCancelMessage(ret);
		return false;
	}

	if (isHotkey) {
		showUseHotkeyMessage(player, item, player->getItemTypeCount(item->getID(), (Item::items[item->getID()].isFluid() ? item->getFluidType() : -1)));
	}

	if (!action->executeUse(player, item, fromPos, action->getTarget(player, creature, toPos, toStackPos), toPos, isHotkey)) {
		if (!action->hasOwnErrorHandler()) {
			player->sendCancelMessage(RETURNVALUE_CANNOTUSETHISOBJECT);
		}
		return false;
	}
	return true;
}

void Actions::showUseHotkeyMessage(Player* player, const Item* item, uint32_t count)
{
	std::stringExtended str(128);

	const ItemType& it = Item::items[item->getID()];
	if (!it.showCount) {
		str << "Using one of " << item->getName() << "...";
	} else if (count == 1) {
		str << "Using the last " << item->getName() << "...";
	} else {
		str << "Using one of " << count << ' ' << item->getPluralName() << "...";
	}
	player->sendTextMessage(MESSAGE_INFO_DESCR, str);
}

Action::Action(LuaScriptInterface* interface) :
	Event(interface), function(nullptr), allowFarUse(false), checkFloor(true), checkLineOfSight(true) {}

bool Action::configureEvent(const pugi::xml_node& node)
{
	pugi::xml_attribute allowFarUseAttr = node.attribute("allowfaruse");
	if (allowFarUseAttr) {
		allowFarUse = allowFarUseAttr.as_bool();
	}

	pugi::xml_attribute blockWallsAttr = node.attribute("blockwalls");
	if (blockWallsAttr) {
		checkLineOfSight = blockWallsAttr.as_bool();
	}

	pugi::xml_attribute checkFloorAttr = node.attribute("checkfloor");
	if (checkFloorAttr) {
		checkFloor = checkFloorAttr.as_bool();
	}

	return true;
}

namespace {
	bool enterMarket(Player* player, Item*, const Position&, Thing*, const Position&, bool)
	{
		#if GAME_FEATURE_MARKET > 0
		if (player->isInMarket() || player->getLastDepotId() == -1) {
			return false;
		}

		player->sendMarketEnter(player->getLastDepotId());
		#else
		(void)player;
		#endif
		return true;
	}
	
	bool enterStash(Player* player, Item*, const Position&, Thing*, const Position&, bool)
	{
		#if GAME_FEATURE_STASH > 0
		player->sendSupplyStash();
		#else
		(void)player;
		#endif
		return true;
	}
}

bool Action::loadFunction(const pugi::xml_attribute& attr, bool isScripted)
{
	const char* functionName = attr.as_string();
	if (strcasecmp(functionName, "market") == 0) {
		function = enterMarket;
	} else if (strcasecmp(functionName, "stash") == 0) {
		function = enterStash;
	} else {
		if (!isScripted) {
			std::cout << "[Warning - Action::loadFunction] Function \"" << functionName << "\" does not exist." << std::endl;
			return false;
		}
	}

	if (!isScripted) {
		scripted = false;
	}
	return true;
}

std::string Action::getScriptEventName() const
{
	return "onUse";
}

ReturnValue Action::canExecuteAction(const Player* player, const Position& toPos)
{
	if (!allowFarUse) {
		return g_actions->canUse(player, toPos);
	} else {
		return g_actions->canUseFar(player, toPos, checkLineOfSight, checkFloor);
	}
}

Thing* Action::getTarget(Player* player, Creature* targetCreature, const Position& toPosition, uint8_t toStackPos) const
{
	if (targetCreature) {
		return targetCreature;
	}
	return g_game.internalGetThing(player, toPosition, toStackPos, 0, STACKPOS_USETARGET);
}

bool Action::executeUse(Player* player, Item* item, const Position& fromPosition, Thing* target, const Position& toPosition, bool isHotkey)
{
	//onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if (!scriptInterface->reserveScriptEnv()) {
		std::cout << "[Error - Action::executeUse] Call stack overflow" << std::endl;
		return false;
	}

	ScriptEnvironment* env = scriptInterface->getScriptEnv();
	env->setScriptId(scriptId, scriptInterface);

	lua_State* L = scriptInterface->getLuaState();

	scriptInterface->pushFunction(scriptId);

	LuaScriptInterface::pushUserdata<Player>(L, player);
	LuaScriptInterface::setMetatable(L, -1, "Player");

	LuaScriptInterface::pushThing(L, item);
	LuaScriptInterface::pushPosition(L, fromPosition);

	LuaScriptInterface::pushThing(L, target);
	LuaScriptInterface::pushPosition(L, toPosition);

	LuaScriptInterface::pushBoolean(L, isHotkey);
	return scriptInterface->callFunction(6);
}
