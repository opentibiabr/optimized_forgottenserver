local keyLockedDoor = {}
local keyUnlockedDoor = {}

for index, value in ipairs(KeyDoorTable) do
	if not table.contains(keyLockedDoor, value.lockedDoor) then
		table.insert(keyLockedDoor, value.lockedDoor)
	end
	if not table.contains(keyUnlockedDoor, value.closedDoor) then
		table.insert(keyUnlockedDoor, value.closedDoor)
	end
end

local keyDoor = Action()

function keyDoor.onUse(creature, item, fromPosition, target, toPosition, isHotkey)
	local position = item:getPosition()
	local stringPosition = "{x = " .. position.x .. ", y = " .. position.y .. ", z = " .. position.z .. "}"
	-- It is locked msg
	if table.contains(keyLockedDoor, item.itemid) or (table.contains(keyUnlockedDoor, item.itemid) and table.contains({1001, 101}, item.actionid)) then
		creature:sendTextMessage(MESSAGE_INFO_DESCR, "It is locked.")
		if useInformationLog then
			print("[Info] - Player (".. creature:getName() ..") used locked door at the position ".. stringPosition .."")
		end
		return true
	end

	-- onUse unlocked key door
	for index, value in ipairs(KeyDoorTable) do
		if value.closedDoor == item.itemid then
			item:transform(value.openDoor)
			if useInformationLog then
				print("[Info] - Player (".. creature:getName() ..") opened door at the position ".. stringPosition .."")
			end
			return true
		end
	end
	for index, value in ipairs(KeyDoorTable) do
		if value.openDoor == item.itemid then
			item:transform(value.closedDoor)
			creature:isInsideDoor(toPosition)
			if useInformationLog then
				print("[Info] - Player (".. creature:getName() ..") closed door at the position ".. stringPosition .."")
			end
			return true
		end
	end

	-- Key use on door (locked key door)
	if target.actionid > 0 then
		for index, value in ipairs(KeyDoorTable) do
			if item.actionid ~= target.actionid and value.lockedDoor == target.itemid or value.closedDoor == target.itemid then
				creature:sendCancelMessage("The key does not match.")
				if useInformationLog then
					print("[Info] - Player (".. creature:getName() ..") tried use the key in door in position ".. stringPosition .."")
				end
				return true
			end
			if item.actionid == target.actionid then
				if value.lockedDoor == target.itemid then
					target:transform(value.openDoor)
					if useInformationLog then
						print("[Info] - Player (".. creature:getName() ..") opened key door in position ".. stringPosition .."")
					end
					return true
				elseif table.contains({value.openDoor, value.closedDoor}, target.itemid) then
					target:transform(value.lockedDoor)
					if useInformationLog then
						print("[Info] - Player (".. creature:getName() ..") locked key door in position ".. stringPosition .."")
					end
					return true
				end
			end
		end
	end
	return print("[Error] - Key door in position ".. stringPosition .." cannot work")
end

-- Register doors ids and check version
for doorTableIndex, doorTableValue in ipairs(KeyDoorTable) do
	if (CLIENT_VERSION >= doorTableValue.clientVersion) then
		keyDoor:id(doorTableValue.closedDoor)
		keyDoor:id(doorTableValue.lockedDoor)
		keyDoor:id(doorTableValue.openDoor)
	end
end

-- Register keys ids
keyDoor:id(2967, 2968, 2969, 2970, 2971, 2972, 2973, 21392)

keyDoor:register()
