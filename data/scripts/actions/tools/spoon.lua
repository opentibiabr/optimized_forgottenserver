local spoon = Action()

function spoon.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return ActionsLib.useSpoon(player, item, fromPosition, target, toPosition, isHotkey)
end

if(CLIENT_VERSION >= 1030) then
	spoon:id(20189)
end
spoon:id(3468)
spoon:register()
