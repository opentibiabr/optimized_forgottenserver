local trap = Action()

function trap.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	item:transform(item:getId() - 1)
	fromPosition:sendMagicEffect(CONST_ME_POFF)
	return true
end

trap:id(2579)
trap:register()
