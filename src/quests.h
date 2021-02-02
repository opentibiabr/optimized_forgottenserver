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

#ifndef FS_QUESTS_H_16E44051F23547BE8097F8EA9FCAACA0
#define FS_QUESTS_H_16E44051F23547BE8097F8EA9FCAACA0

#include "player.h"
#include "networkmessage.h"

class Mission;
class Quest;

using MissionsList = std::vector<Mission>;
using QuestsList = std::vector<Quest>;

class Mission
{
	public:
		Mission(std::string name, int32_t storageID, int32_t startValue, int32_t endValue, bool ignoreEndValue) :
			name(std::move(name)), storageID(storageID), startValue(startValue), endValue(endValue), ignoreEndValue(ignoreEndValue) {}

		bool isCompleted(Player* player) const;
		bool isStarted(Player* player) const;
		std::string getName(Player* player) const;
		std::string getDescription(Player* player) const;

		#if GAME_FEATURE_QUEST_TRACKER > 0
		void setQuestId(uint16_t id) {
			questId = id;
		}
		uint16_t getQuestId() const {
			return questId;
		}
		void setMissionId(uint16_t id) {
			missionId = id;
		}
		uint16_t getMissionId() const {
			return missionId;
		}
		#endif

		uint32_t getStorageId() const {
			return storageID;
		}
		int32_t getStartStorageValue() const {
			return startValue;
		}
		int32_t getEndStorageValue() const {
			return endValue;
		}

		std::vector<std::pair<int32_t, uint32_t>> states;
		std::map<int32_t, std::string> descriptions;
		std::string mainDescription;

	private:
		std::string name;
		uint32_t storageID;
		int32_t startValue, endValue;
		#if GAME_FEATURE_QUEST_TRACKER > 0
		uint16_t questId;
		uint16_t missionId;
		#endif
		bool ignoreEndValue;
};

class Quest
{
	public:
		Quest(std::string name, uint16_t id, int32_t startStorageID, int32_t startStorageValue) :
			name(std::move(name)), startStorageID(startStorageID), startStorageValue(startStorageValue), id(id) {}

		bool isCompleted(Player* player) const;
		bool isStarted(Player* player) const;
		uint16_t getID() const {
			return id;
		}
		std::string getName() const {
			return name;
		}
		uint16_t getMissionsCount(Player* player) const;

		uint32_t getStartStorageId() const {
			return startStorageID;
		}
		int32_t getStartStorageValue() const {
			return startStorageValue;
		}

		const MissionsList& getMissions() const {
			return missions;
		}

	private:
		std::string name;

		uint32_t startStorageID;
		int32_t startStorageValue;
		uint16_t id;

		MissionsList missions;

	friend class Quests;
};

class Quests
{
	public:
		const QuestsList& getQuests() const {
			return quests;
		}

		bool loadFromXml();
		void makeCache();

		#if GAME_FEATURE_QUEST_TRACKER > 0
		std::vector<const Mission*>& getMissions(uint32_t key);
		const Mission* getMissionByID(uint16_t id);
		#endif
		Quest* getQuestByID(uint16_t id);
		bool isQuestStorage(const uint32_t key, const int32_t value, const int32_t oldValue) const;
		uint16_t getQuestsCount(Player* player) const;
		bool reload();

	private:
		QuestsList quests;
		std::map<uint32_t, std::vector<const Quest*>> cachedLogQuests;
		std::map<uint32_t, std::vector<const Mission*>> cachedLogMissions;
		#if GAME_FEATURE_QUEST_TRACKER > 0
		std::map<uint16_t, const Mission*> cachedMissions;
		#endif
};

#endif
