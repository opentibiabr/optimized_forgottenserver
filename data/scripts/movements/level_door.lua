local lvldoor = MoveEvent()
lvldoor:type("stepin")

function lvldoor.onStepIn(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		return false
	end

	if creature:getLevel() < item.actionid - 1000 then
		creature:sendTextMessage(MESSAGE_INFO_DESCR, "Only the worthy may pass.")
		creature:teleportTo(fromPosition, true)
		return false
	end
	return true
end

for _, i in ipairs(openLevelDoors) do
	lvldoor:id(i)
end
lvldoor:register()