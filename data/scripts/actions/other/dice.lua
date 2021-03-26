if(CLIENT_VERSION < 780) then
	return
end

local dice = Action()

function dice.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local position = item:getPosition()
	local value = math.random(1, 6)
	local isInGhostMode = player:isInGhostMode()

	position:sendMagicEffect(CONST_ME_CRAPS, isInGhostMode and player)

	local spectators = Game.getSpectators(position, false, true, 3, 3)
	for _, spectator in ipairs(spectators) do
		player:say(player:getName() .. " rolled a " .. value .. ".", TALKTYPE_MONSTER_SAY, isInGhostMode, spectator, position)
	end

	item:transform(5791 + value)
	return true
end

for items = 5792, 5797 do
	dice:id(items)
end

dice:register()
