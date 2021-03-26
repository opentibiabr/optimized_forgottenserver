local questDoor = Action()

function questDoor.onUse(creature, item, fromPosition, target, toPosition, isHotkey)
	local position = item:getPosition()
	local stringPosition = "{x = " .. position.x .. ", y = " .. position.y .. ", z = " .. position.z .. "}"
	for index, value in ipairs(QuestDoorTable) do
		if value.closedDoor == item.itemid then
			if item.actionid > 0 and creature:getStorageValue(item.actionid) ~= -1 then
				item:transform(value.openDoor)
				creature:teleportTo(toPosition, true)
				if useInformationLog then
					print("[Info] - Player (".. creature:getName() ..") opened door level in position ".. stringPosition .."")
				end
				return true
			else
				creature:sendTextMessage(MESSAGE_EVENT_ADVANCE, "The door seems to be sealed against unwanted intruders.")
				if useInformationLog then
					print("[Info] - Player (".. creature:getName() ..") tried open the level door in position ".. stringPosition .."")
				end
				return true
			end
		end
	end

	if creature:isInsideDoor(toPosition) then
		return true
	end
	return print("[Error] - Level door in position ".. stringPosition .." cannot work")
end

for doorTableIndex, doorTableValue in ipairs(QuestDoorTable) do
	if (CLIENT_VERSION >= doorTableValue.clientVersion) then
		questDoor:id(doorTableValue.closedDoor)
		questDoor:id(doorTableValue.openDoor)
	end
end

questDoor:register()
