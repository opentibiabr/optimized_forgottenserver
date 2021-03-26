local sickle = Action()

function sickle.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return ActionsLib.useSickle(player, item, fromPosition, target, toPosition, isHotkey)
        or ActionsLib.destroyItem(player, target, toPosition)
end

if(CLIENT_VERSION >= 1230) then
	sickle:id(32595)
end
sickle:id(3293, 3306)
sickle:register()
