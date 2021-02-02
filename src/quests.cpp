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

#include "quests.h"

#include "pugicast.h"

std::string Mission::getDescription(Player* player) const
{
	int32_t value;
	player->getStorageValue(storageID, value);

	if (!mainDescription.empty()) {
		std::string desc = mainDescription;
		replaceString(desc, "|STATE|", std::to_string(value));

		for (const auto& missionState : states) {
			player->getStorageValue(missionState.second, value);
			replaceString(desc, (std::string("|STATE") + std::to_string(missionState.first) + std::string("|")), std::to_string(std::max<int32_t>(value, 0)));
		}

		replaceString(desc, "\\n", "\n");
		return desc;
	}

	if (ignoreEndValue) {
		for (int32_t current = endValue; current >= startValue; current--) {
			if (value >= current) {
				auto sit = descriptions.find(current);
				if (sit != descriptions.end()) {
					return sit->second;
				}
			}
		}
	} else {
		for (int32_t current = endValue; current >= startValue; current--) {
			if (value == current) {
				auto sit = descriptions.find(current);
				if (sit != descriptions.end()) {
					return sit->second;
				}
			}
		}
	}
	return "An error has occurred, please contact a gamemaster.";
}

bool Mission::isStarted(Player* player) const
{
	if (!player) {
		return false;
	}

	int32_t value;
	if (!player->getStorageValue(storageID, value)) {
		return false;
	}

	if (value < startValue) {
		return false;
	}

	if (!ignoreEndValue && value > endValue) {
		return false;
	}

	return true;
}

bool Mission::isCompleted(Player* player) const
{
	if (!player) {
		return false;
	}

	int32_t value;
	if (!player->getStorageValue(storageID, value)) {
		return false;
	}

	if (ignoreEndValue) {
		return value >= endValue;
	}

	return value == endValue;
}

std::string Mission::getName(Player* player) const
{
	if (isCompleted(player)) {
		return name + " (completed)";
	}
	return name;
}

uint16_t Quest::getMissionsCount(Player* player) const
{
	uint16_t count = 0;
	for (const Mission& mission : missions) {
		if (mission.isStarted(player)) {
			count++;
		}
	}
	return count;
}

bool Quest::isCompleted(Player* player) const
{
	for (const Mission& mission : missions) {
		if (!mission.isCompleted(player)) {
			return false;
		}
	}
	return true;
}

bool Quest::isStarted(Player* player) const
{
	if (!player) {
		return false;
	}

	int32_t value;
	if (!player->getStorageValue(startStorageID, value) || value < startStorageValue) {
		return false;
	}

	return true;
}

bool Quests::reload()
{
	quests.clear();
	return loadFromXml();
}

bool Quests::loadFromXml()
{
	pugi::xml_document doc;
	pugi::xml_parse_result result = doc.load_file("data/XML/quests.xml");
	if (!result) {
		printXMLError("Error - Quests::loadFromXml", "data/XML/quests.xml", result);
		return false;
	}

	uint16_t id = 0;
	for (auto questNode : doc.child("quests").children()) {
		quests.emplace_back(
			questNode.attribute("name").as_string(),
			++id,
			pugi::cast<int32_t>(questNode.attribute("startstorageid").value()),
			pugi::cast<int32_t>(questNode.attribute("startstoragevalue").value())
		);
		Quest& quest = quests.back();

		for (auto missionNode : questNode.children()) {
			std::string mainDescription = missionNode.attribute("description").as_string();

			quest.missions.emplace_back(
				missionNode.attribute("name").as_string(),
				pugi::cast<int32_t>(missionNode.attribute("storageid").value()),
				pugi::cast<int32_t>(missionNode.attribute("startvalue").value()),
				pugi::cast<int32_t>(missionNode.attribute("endvalue").value()),
				missionNode.attribute("ignoreendvalue").as_bool()
			);
			Mission& mission = quest.missions.back();

			if (mainDescription.empty()) {
				for (auto missionStateNode : missionNode.children()) {
					int32_t missionId = pugi::cast<int32_t>(missionStateNode.attribute("id").value());
					mission.descriptions.emplace(missionId, missionStateNode.attribute("description").as_string());
				}
			} else {
				mission.mainDescription = std::move(mainDescription);
			}

			int32_t stateId = 0;
			while (true) {
				pugi::xml_attribute stateAttribute = missionNode.attribute((std::string("state") + std::to_string(stateId)).c_str());
				if (stateAttribute) {
					mission.states.emplace_back(stateId, pugi::cast<uint32_t>(stateAttribute.value()));
				} else if (stateId > 0) {
					break;
				}
				++stateId;
			}
			mission.states.shrink_to_fit();

			#if GAME_FEATURE_QUEST_TRACKER > 0
			pugi::xml_attribute idAttribute = missionNode.attribute("id");
			if (idAttribute) {
				mission.setMissionId(pugi::cast<uint16_t>(idAttribute.value()));
			} else {
				std::cout << "[Warning - Quests::loadFromXml] Missing id in mission: " << missionNode.attribute("name").as_string() << std::endl;
			}
			mission.setQuestId(id);
			#endif
		}
	}
	makeCache();
	return true;
}

void Quests::makeCache()
{
	cachedLogQuests.clear();
	cachedLogMissions.clear();
	#if GAME_FEATURE_QUEST_TRACKER > 0
	cachedMissions.clear();
	#endif

	for (const Quest& quest : quests) {
		cachedLogQuests[quest.getStartStorageId()].push_back(&quest);
		for (const Mission& mission : quest.getMissions()) {
			cachedLogMissions[mission.getStorageId()].push_back(&mission);
			for (const auto& missionState : mission.states) {
				cachedLogMissions[missionState.second].push_back(&mission);
			}

			#if GAME_FEATURE_QUEST_TRACKER > 0
			cachedMissions[mission.getMissionId()] = &mission;
			#endif
		}
	}
}

#if GAME_FEATURE_QUEST_TRACKER > 0
static std::vector<const Mission*> dummyMissions;

std::vector<const Mission*>& Quests::getMissions(uint32_t key)
{
	auto mit = cachedLogMissions.find(key);
	if (mit != cachedLogMissions.end()) {
		return mit->second;
	}
	return dummyMissions;
}

const Mission* Quests::getMissionByID(uint16_t id)
{
	auto it = cachedMissions.find(id);
	if (it != cachedMissions.end()) {
		return it->second;
	}
	return nullptr;
}
#endif

Quest* Quests::getQuestByID(uint16_t id)
{
	for (Quest& quest : quests) {
		if (quest.id == id) {
			return &quest;
		}
	}
	return nullptr;
}

uint16_t Quests::getQuestsCount(Player* player) const
{
	uint16_t count = 0;
	for (const Quest& quest : quests) {
		if (quest.isStarted(player)) {
			count++;
		}
	}
	return count;
}

bool Quests::isQuestStorage(const uint32_t key, const int32_t value, const int32_t oldValue) const
{
	auto qit = cachedLogQuests.find(key);
	if (qit != cachedLogQuests.end()) {
		for (const Quest* quest : qit->second) {
			if (quest->getStartStorageValue() == value) {
				return true;
			}
		}
	}

	auto mit = cachedLogMissions.find(key);
	if (mit != cachedLogMissions.end()) {
		for (const Mission* mission : mit->second) {
			if (mission->getStorageId() == key && value >= mission->getStartStorageValue() && value <= mission->getEndStorageValue()) {
				return mission->mainDescription.empty() || oldValue < mission->getStartStorageValue() || oldValue > mission->getEndStorageValue();
			}
		}
	}
	return false;
}
