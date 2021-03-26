local blueberry = Action()

function blueberry.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	item:transform(3700)
	item:decay()
	Game.createItem(3588, 3, fromPosition)
	return true
end

blueberry:id(3699)
blueberry:register()
