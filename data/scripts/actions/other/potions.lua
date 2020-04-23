if(CLIENT_VERSION < 790) then
	return
end

local berserk = Condition(CONDITION_ATTRIBUTES)
berserk:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
berserk:setParameter(CONDITION_PARAM_SKILL_MELEE, 5)
berserk:setParameter(CONDITION_PARAM_SKILL_SHIELD, -10)
berserk:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local mastermind = Condition(CONDITION_ATTRIBUTES)
mastermind:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
mastermind:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 3)
mastermind:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local bullseye = Condition(CONDITION_ATTRIBUTES)
bullseye:setParameter(CONDITION_PARAM_TICKS, 10 * 60 * 1000)
bullseye:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 5)
bullseye:setParameter(CONDITION_PARAM_SKILL_SHIELD, -10)
bullseye:setParameter(CONDITION_PARAM_BUFF_SPELL, true)

local potions = {
	[6558] = {transform = {7588, 7589}, effect = CONST_ME_DRAWBLOOD, client_version = 790}, -- concentrated demonic blood
	[7439] = {condition = berserk, vocations = {4, 8}, effect = CONST_ME_MAGIC_RED, description = "Only knights may drink this potion.", text = "You feel stronger.", client_version = 800}, -- berserk potion
	[7440] = {condition = mastermind, vocations = {1, 2, 5, 6}, effect = CONST_ME_MAGIC_BLUE, description = "Only sorcerers and druids may drink this potion.", text = "You feel smarter.", client_version = 800}, -- mastermind potion
	[7443] = {condition = bullseye, vocations = {3, 7}, effect = CONST_ME_MAGIC_GREEN, description = "Only paladins may drink this potion.", text = "You feel more accurate.", client_version = 800}, -- bullseye potion
	[7588] = {health = {250, 350}, vocations = {3, 4, 7, 8}, level = 50, flask = 7634, description = "Only knights and paladins of level 50 or above may drink this fluid.", client_version = 810}, -- strong health potion
	[7589] = {mana = {115, 185}, vocations = {1, 2, 3, 5, 6, 7}, level = 50, flask = 7634, description = "Only sorcerers, druids and paladins of level 50 or above may drink this fluid.", client_version = 810}, -- strong mana potion
	[7590] = {mana = {150, 250}, vocations = {1, 2, 5, 6}, level = 80, flask = 7635, description = "Only druids and sorcerers of level 80 or above may drink this fluid.", client_version = 810}, -- great mana potion
	[7591] = {health = {425, 575}, vocations = {4, 8}, level = 80, flask = 7635, description = "Only knights of level 80 or above may drink this fluid.", client_version = 810}, -- great health potion
	[7618] = {health = {125, 175}, flask = 7636, client_version = 810}, -- health potion
	[7620] = {mana = {75, 125}, flask = 7636, client_version = 810}, -- mana potion
	[8472] = {health = {250, 350}, mana = {100, 200}, vocations = {3, 7}, level = 80, flask = 7635, description = "Only paladins of level 80 or above may drink this fluid.", client_version = 820}, -- great spirit potion
	[8473] = {health = {650, 850}, vocations = {4, 8}, level = 130, flask = 7635, description = "Only knights of level 130 or above may drink this fluid.", client_version = 820}, -- ultimate health potion
	[8474] = {antidote = true, flask = 7636, client_version = 820}, -- antidote potion
	[8704] = {health = {60, 90}, flask = 7636, client_version = 820}, -- small health potion
	[26029] = {mana = {425, 575}, vocations = {1, 2, 5, 6}, level = 130, flask = 7635, description = "Only druids and sorcerers of level 130 or above may drink this fluid.", client_version = 1092}, -- ultimate mana potion
	[26030] = {health = {420, 580}, mana = {250, 350}, vocations = {3, 7}, level = 130, flask = 7635, description = "Only paladins of level 130 or above may drink this fluid.", client_version = 1092}, -- supreme health potion
	[26031] = {health = {875, 1125}, vocations = {4, 8}, level = 200, flask = 7635, description = "Only knights of level 200 or above may drink this fluid.", client_version = 1092} -- ultimate spirit potion
}
local potion = Action()

function potion.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if type(target) == "userdata" and not target:isPlayer() then
		return false
	end

	local potion = potions[item:getId()]
	if potion.level and player:getLevel() < potion.level or potion.vocations and not table.contains(potion.vocations, player:getVocation():getId()) then
		player:say(potion.description, TALKTYPE_MONSTER_SAY)
		return true
	end

	if potion.condition then
		player:addCondition(potion.condition)
		player:say(potion.text, TALKTYPE_MONSTER_SAY)
		player:getPosition():sendMagicEffect(potion.effect)
	elseif potion.transform then
		item:transform(potion.transform[math.random(#potion.transform)])
		item:getPosition():sendMagicEffect(potion.effect)
		return true
	else
		if potion.health then
			doTargetCombatHealth(0, target, COMBAT_HEALING, potion.health[1], potion.health[2])
		end

		if potion.mana then
			doTargetCombatMana(0, target, potion.mana[1], potion.mana[2])
		end

		if potion.antidote then
			target:removeCondition(CONDITION_POISON)
		end

		player:addItem(potion.flask)
		target:say("Aaaah...", TALKTYPE_MONSTER_SAY)
		target:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	end

	item:remove(1)
	return true
end

for i, p in pairs(potions) do
	if(CLIENT_VERSION >= p.client_version) then
		potion:id(i)
	end
end
potion:register()
