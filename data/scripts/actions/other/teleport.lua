local teleports = {
	--[itemid] = {upFloor, client_version}
	[435] = {false, 0}, -- sewer grate
	[1931] = {false, 0}, -- draw well
	[1948] = {true, 0}, -- ladder
	[1968] = {true, 750}, -- ladder
	[5542] = {true, 780}, -- rope-ladder
	[7750] = {false, 820}, -- sewer grate
	[7771] = {true, 820}, -- ladder
	[9116] = {true, 850}, -- ladder
	[20474] = {true, 1030}, -- ladder rung
	[20475] = {true, 1030}, -- ladder rung
	[28656] = {true, 1200}, -- ladder
	[31262] = {true, 1220}, -- ladder
}
local teleport = Action()

function teleport.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local floorTeleport = teleports[item.itemid]
	if floorTeleport and floorTeleport[1] then
		fromPosition:moveUpstairs()
	else
		fromPosition.z = fromPosition.z + 1
	end

	if player:isPzLocked() and Tile(fromPosition):hasFlag(TILESTATE_PROTECTIONZONE) then
		player:sendCancelMessage(RETURNVALUE_PLAYERISPZLOCKED)
		return true
	end

	player:teleportTo(fromPosition, false)
	return true
end

-- teleportsValues[2] = second value of the table (client version)
for teleportsIds, teleportsValues in pairs(teleports) do
	if(CLIENT_VERSION >= teleportsValues[2]) then
		teleport:id(teleportsIds)
	end
end
teleport:register()
