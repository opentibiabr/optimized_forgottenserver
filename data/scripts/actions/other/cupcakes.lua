if(CLIENT_VERSION < 1160) then
	return
end

local config = {
    storage = 19043, --use empty storage
    exhaust = 600 --Exhaust is in seconds 600 equals 10min
}
local lemon = Condition(CONDITION_ATTRIBUTES)
lemon:setParameter(CONDITION_PARAM_TICKS, 60 * 60 * 1000)
lemon:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 10)

local cupcake = Action()

function cupcake.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	if(player:getStorageValue(config.storage) <= os.time()) then
		item:remove(1)
		player:say("Mmmm.", TALKTYPE_MONSTER_SAY)
		player:setStorageValue(config.storage, os.time() + config.exhaust)
		if(item.itemid == 31719) then
			player:addMana(player:getMaxMana())
		elseif(item.itemid == 31720) then
			player:addHealth(player:getMaxHealth())
		else
			player:addCondition(lemon)
		end
	else
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You are full or you've already eaten a dish within 10 minutes.")
	end
	return true
end

cupcake:id(31719, 31720, 31721)
cupcake:register()
