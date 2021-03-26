local scythe = Action()

function scythe.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return ActionsLib.useScythe(player, item, fromPosition, target, toPosition, isHotkey)
        or ActionsLib.destroyItem(player, target, toPosition)
end

if(CLIENT_VERSION >= 1180) then
	scythe:id(28746, 28747, 28748, 28749)
end
if(CLIENT_VERSION >= 940) then
	scythe:id(14089)
end
if(CLIENT_VERSION >= 850) then
	scythe:id(9384)
end
if(CLIENT_VERSION >= 750) then
	scythe:id(3345)
end
scythe:id(3453)
scythe:register()
