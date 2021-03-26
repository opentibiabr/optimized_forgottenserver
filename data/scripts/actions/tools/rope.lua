local rope = Action()

function rope.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return ActionsLib.useRope(player, item, fromPosition, target, toPosition, isHotkey)
end

if(CLIENT_VERSION >= 810) then
	rope:id(646)
end
rope:id(3003)
rope:register()
