local pickaxe = Action()

function pickaxe.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return ActionsLib.usePick(player, item, fromPosition, target, toPosition, isHotkey)
end

pickaxe:id(2553)
pickaxe:register()
