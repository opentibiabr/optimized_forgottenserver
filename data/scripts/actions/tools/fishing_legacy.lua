if(CLIENT_VERSION >= 800) then
	return
end

local waterIds = {629, 630, 631, 632, 633, 634, 4597, 4598, 4599, 4600, 4601, 4602, 4609, 4610, 4611, 4612, 4613, 4614, 7236, 9582, 12560, 12562, 12561, 12563, 13988, 13989}
local useWorms = true

local fishing = Action()

function fishing.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetId = target.itemid
	if not table.contains(waterIds, target.itemid) then
		return false
	end

	toPosition:sendMagicEffect(CONST_ME_LOSEENERGY)
	if targetId == 493 then
		return true
	end

	player:addSkillTries(SKILL_FISHING, 1)
	if math.random(1, 100) <= math.min(math.max(10 + (player:getEffectiveSkillLevel(SKILL_FISHING) - 10) * 0.597, 10), 50) then
		if useWorms and not player:removeItem(3492, 1) then
			return true
		end

		player:addItem(3578, 1)
	end
	return true
end

fishing:id(3483)
fishing:allowFarUse(true)
fishing:register()
