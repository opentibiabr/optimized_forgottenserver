local snowheap = Action()

function snowheap.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	Game.createItem(2111, 1, item:getPosition())
	return true
end

snowheap:id(486)
snowheap:register()
