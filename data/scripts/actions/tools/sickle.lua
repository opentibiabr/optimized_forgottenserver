local sickle = Action()

function sickle.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return ActionsLib.useSickle(player, item, fromPosition, target, toPosition, isHotkey) or ActionsLib.destroyItem(player, target, toPosition)
end

if(CLIENT_VERSION >= 1230) then
	sickle:id(37430)
end
sickle:id(2405, 2418)
sickle:register()
