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

#ifndef FS_MONSTERS_H_776E8327BCE2450EB7C4A260785E6C0D
#define FS_MONSTERS_H_776E8327BCE2450EB7C4A260785E6C0D

#include "creature.h"

const uint32_t MAX_LOOTCHANCE = 100000;
const uint32_t MAX_STATICWALK = 100;

struct LootBlock {
	LootBlock() = default;

	// non-copyable
	LootBlock(const LootBlock&) = delete;
	LootBlock& operator=(const LootBlock&) = delete;

	// moveable
	LootBlock(LootBlock&& rhs) noexcept :
		childLoot(std::move(rhs.childLoot)), chance(rhs.chance), subType(rhs.subType), actionId(rhs.actionId), countmax(rhs.countmax), id(rhs.id) {text.reset(rhs.text.release());}
	LootBlock& operator=(LootBlock&& rhs) noexcept {
		if (this != &rhs) {
			childLoot = std::move(rhs.childLoot);
			text.reset(rhs.text.release());
			chance = rhs.chance;
			subType = rhs.subType;
			actionId = rhs.actionId;
			countmax = rhs.countmax;
			id = rhs.id;
		}
		return *this;
	}

	std::vector<LootBlock> childLoot;
	std::unique_ptr<std::string> text;

	uint32_t chance = 0;
	int32_t subType = -1;
	int32_t actionId = -1;

	uint16_t countmax = 1;
	uint16_t id = 0;
};

class Loot {
	public:
		Loot() = default;

		// non-copyable
		Loot(const Loot&) = delete;
		Loot& operator=(const Loot&) = delete;

		LootBlock lootBlock;
};

struct summonBlock_t {
	summonBlock_t() = default;

	// non-copyable
	summonBlock_t(const summonBlock_t&) = delete;
	summonBlock_t& operator=(const summonBlock_t&) = delete;

	// moveable
	summonBlock_t(summonBlock_t&& rhs) noexcept :
		name(std::move(rhs.name)), chance(rhs.chance), speed(rhs.speed), max(rhs.max), force(rhs.force) {}
	summonBlock_t& operator=(summonBlock_t&& rhs) noexcept {
		if (this != &rhs) {
			name = std::move(rhs.name);
			chance = rhs.chance;
			speed = rhs.speed;
			max = rhs.max;
			force = rhs.force;
		}
		return *this;
	}

	std::string name;
	uint32_t chance;
	uint32_t speed;
	uint32_t max;
	bool force = false;
};

class BaseSpell;
struct spellBlock_t {
	constexpr spellBlock_t() = default;
	~spellBlock_t();

	// non-copyable
	spellBlock_t(const spellBlock_t&) = delete;
	spellBlock_t& operator=(const spellBlock_t&) = delete;

	// moveable
	spellBlock_t(spellBlock_t&& rhs) noexcept : spell(rhs.spell), chance(rhs.chance), speed(rhs.speed), range(rhs.range), minCombatValue(rhs.minCombatValue),
		maxCombatValue(rhs.maxCombatValue), combatSpell(rhs.combatSpell), isMelee(rhs.isMelee) {rhs.spell = nullptr;}
	spellBlock_t& operator=(spellBlock_t&& rhs) noexcept {
		if (this != &rhs) {
			spell = rhs.spell;
			chance = rhs.chance;
			speed = rhs.speed;
			range = rhs.range;
			minCombatValue = rhs.minCombatValue;
			maxCombatValue = rhs.maxCombatValue;
			combatSpell = rhs.combatSpell;
			isMelee = rhs.isMelee;
			rhs.spell = nullptr;
		}
		return *this;
	}

	BaseSpell* spell = nullptr;
	uint32_t chance = 100;
	uint32_t speed = 2000;
	uint32_t range = 0;
	int32_t minCombatValue = 0;
	int32_t maxCombatValue = 0;
	bool combatSpell = false;
	bool isMelee = false;
};

struct voiceBlock_t {
	voiceBlock_t() = default;

	// non-copyable
	voiceBlock_t(const voiceBlock_t&) = delete;
	voiceBlock_t& operator=(const voiceBlock_t&) = delete;

	// moveable
	voiceBlock_t(voiceBlock_t&& rhs) noexcept : text(std::move(rhs.text)), yellText(rhs.yellText) {}
	voiceBlock_t& operator=(voiceBlock_t&& rhs) noexcept {
		if (this != &rhs) {
			text = std::move(rhs.text);
			yellText = rhs.yellText;
		}
		return *this;
	}

	std::string text;
	bool yellText;
};

class MonsterType
{
	struct MonsterInfo {
		LuaScriptInterface* scriptInterface;

		std::map<CombatType_t, int32_t> elementMap;
		std::vector<voiceBlock_t> voiceVector;
		std::vector<LootBlock> lootItems;
		std::vector<std::string> scripts;
		std::vector<spellBlock_t> attackSpells;
		std::vector<spellBlock_t> defenseSpells;
		std::vector<summonBlock_t> summons;

		uint64_t experience = 0;

		uint32_t manaCost = 0;
		uint32_t yellChance = 0;
		uint32_t yellSpeedTicks = 0;
		uint32_t staticAttackChance = 95;
		uint32_t maxSummons = 0;
		uint32_t changeTargetSpeed = 0;
		uint32_t conditionImmunities = 0;
		uint32_t damageImmunities = 0;
		uint32_t baseSpeed = 200;

		int32_t creatureAppearEvent = -1;
		int32_t creatureDisappearEvent = -1;
		int32_t creatureMoveEvent = -1;
		int32_t creatureSayEvent = -1;
		int32_t thinkEvent = -1;
		int32_t targetDistance = 1;
		int32_t runAwayHealth = 0;
		int32_t health = 100;
		int32_t healthMax = 100;
		int32_t changeTargetChance = 0;
		int32_t defense = 0;
		int32_t armor = 0;

		uint16_t lookcorpse = 0;
		Outfit_t outfit = {};
		LightInfo light = {};
		Skulls_t skull = SKULL_NONE;
		RaceType_t race = RACE_BLOOD;

		bool canPushItems = false;
		bool canPushCreatures = false;
		bool pushable = true;
		bool isSummonable = false;
		bool isIllusionable = false;
		bool isConvinceable = false;
		bool isAttackable = true;
		bool isHostile = true;
		#if CLIENT_VERSION >= 1070
		bool isBlockable = false;
		#else
		bool isBlockable = true;
		#endif
		bool hiddenHealth = false;
		bool canWalkOnEnergy = true;
		bool canWalkOnFire = true;
		bool canWalkOnPoison = true;

		MonstersEvent_t eventType = MONSTERS_EVENT_NONE;
	};

	public:
		MonsterType() = default;

		// non-copyable
		MonsterType(const MonsterType&) = delete;
		MonsterType& operator=(const MonsterType&) = delete;

		std::string name;
		std::string nameDescription;

		MonsterInfo info;

		void loadLoot(MonsterType* monsterType, LootBlock& lootblock);
};

class MonsterSpell
{
	public:
		MonsterSpell() = default;

		// non-copyable
		MonsterSpell(const MonsterSpell&) = delete;
		MonsterSpell& operator=(const MonsterSpell&) = delete;

		std::string name = "";
		std::string scriptName = "";

		uint8_t chance = 100;
		uint8_t range = 0;

		uint16_t interval = 2000;

		int32_t minCombatValue = 0;
		int32_t maxCombatValue = 0;
		int32_t attack = 0;
		int32_t skill = 0;
		int32_t length = 0;
		int32_t spread = 0;
		int32_t radius = 0;
		int32_t conditionMinDamage = 0;
		int32_t conditionMaxDamage = 0;
		int32_t conditionStartDamage = 0;
		int32_t tickInterval = 0;
		int32_t minSpeedChange = 0;
		int32_t maxSpeedChange = 0;
		int32_t duration = 0;

		bool isScripted = false;
		bool needTarget = false;
		bool needDirection = false;
		bool combatSpell = false;
		bool isMelee = false;

		Outfit_t outfit = {};
		ShootType_t shoot = CONST_ANI_NONE;
		MagicEffectClasses effect = CONST_ME_NONE;
		ConditionType_t conditionType = CONDITION_NONE;
		CombatType_t combatType = COMBAT_UNDEFINEDDAMAGE;
};

class Monsters
{
	public:
		Monsters() = default;

		// non-copyable
		Monsters(const Monsters&) = delete;
		Monsters& operator=(const Monsters&) = delete;

		bool loadRaces();
		bool loadFromXml(bool reloading = false);
		bool isLoaded() const {
			return loaded;
		}
		bool reload();

		std::unordered_map<std::string, uint16_t>& getRaces() {return races;}
		std::map<uint16_t, std::map<uint16_t, std::string>>& getMonsterRaces() {return monsterRaces;}
		std::string getRaceName(uint16_t raceId);

		MonsterType* getMonsterType(const std::string& name);
		MonsterType* addMonsterType(const std::string& name);
		bool deserializeSpell(MonsterSpell* spell, spellBlock_t& sb, const std::string& description = "");

		std::unique_ptr<LuaScriptInterface> scriptInterface;
		bool loadCallback(LuaScriptInterface* scriptInterface, MonsterType* mType);

	private:
		ConditionDamage* getDamageCondition(ConditionType_t conditionType,
		                                    int32_t maxDamage, int32_t minDamage, int32_t startDamage, uint32_t tickInterval);
		bool deserializeSpell(const pugi::xml_node& node, spellBlock_t& sb, const std::string& description = "");

		MonsterType* loadMonster(const std::string& file, const std::string& monsterName, bool reloading = false);

		void loadLootContainer(const pugi::xml_node& node, LootBlock&);
		bool loadLootItem(const pugi::xml_node& node, LootBlock&);

		std::unordered_map<std::string, uint16_t> races;
		std::map<uint16_t, std::map<uint16_t, std::string>> monsterRaces;

		std::map<std::string, MonsterType> monsters;

		bool loaded = false;
};

#endif
