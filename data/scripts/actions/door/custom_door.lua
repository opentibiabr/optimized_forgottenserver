local customDoor = Action()

function customDoor.onUse(creature, item, fromPosition, target, toPosition, isHotkey)
	local position = item:getPosition()
	local stringPosition = "{x = " .. position.x .. ", y = " .. position.y .. ", z = " .. position.z .. "}"
	for index, value in ipairs(CustomDoorTable) do
		 if value.closedDoor == item.itemid then
			item:transform(value.openDoor)
			if useInformationLog then
				print("[Info] - Player (".. creature:getName() ..") opened door in position ".. stringPosition .."")
			end
			return true
		end
	end
	for index, value in ipairs(CustomDoorTable) do
		if value.openDoor == item.itemid then
			creature:isInsideDoor(toPosition)
			item:transform(value.closedDoor)
			if useInformationLog then
				print("[Info] - Player (".. creature:getName() ..") closed door in position ".. stringPosition .."")
			end
			return true
		end
	end
	return print("[Error] - Door in position ".. stringPosition .." cannot work")
end

for doorTableIndex, doorTableValue in ipairs(CustomDoorTable) do
	if (CLIENT_VERSION >= doorTableValue.clientVersion) then
		customDoor:id(doorTableValue.closedDoor)
		customDoor:id(doorTableValue.openDoor)
	end
end

customDoor:register()
