local shovel = Action()

function shovel.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return ActionsLib.useShovel(player, item, fromPosition, target, toPosition, isHotkey)
end

if(CLIENT_VERSION >= 780) then
	shovel:id(5710)
end
shovel:id(2554)
shovel:register()
