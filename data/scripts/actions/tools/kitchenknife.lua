local kitchenknife = Action()

function kitchenknife.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return ActionsLib.useKitchenKnife(player, item, fromPosition, target, toPosition, isHotkey)
end

kitchenknife:id(2566)
kitchenknife:register()
