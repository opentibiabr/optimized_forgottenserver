local machete = Action()

function machete.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return ActionsLib.useMachete(player, item, fromPosition, target, toPosition, isHotkey)
	or ActionsLib.destroyItem(player, target, toPosition)
end

if(CLIENT_VERSION >= 730) then
	machete:id(3330)
end
machete:id(3308)
machete:register()
