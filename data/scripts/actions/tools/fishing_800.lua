if(CLIENT_VERSION < 800 or CLIENT_VERSION >= 850) then
	return
end

local waterIds = {629, 630, 631, 632, 633, 634, 4597, 4598, 4599, 4600, 4601, 4602, 4609, 4610, 4611, 4612, 4613, 4614, 7236}
local useWorms = true

local fishing = Action()

function fishing.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local targetId = target.itemid
	if not table.contains(waterIds, target.itemid) then
		return false
	end

	if targetId ~= 7236 then
		toPosition:sendMagicEffect(CONST_ME_LOSEENERGY)
	end

	if targetId == 622 then
		return true
	end

	player:addSkillTries(SKILL_FISHING, 1)
	if math.random(1, 100) <= math.min(math.max(10 + (player:getEffectiveSkillLevel(SKILL_FISHING) - 10) * 0.597, 10), 50) then
		if useWorms and not player:removeItem(3492, 1) then
			return true
		end

		if targetId == 7236 then
			target:transform(targetId + 1)
			target:decay()

			local rareChance = math.random(1, 100)
			if rareChance == 1 then
				-- rainbow trout
				player:addItem(7158, 1)
				return true
			elseif rareChance <= 4 then
				-- northern pike
				player:addItem(3580, 1)
				return true
			elseif rareChance <= 10 then
				-- green perch
				player:addItem(7159, 1)
				return true
			end
		end
		player:addItem(3578, 1)
	end
	return true
end

fishing:id(3483)
fishing:allowFarUse(true)
fishing:register()
