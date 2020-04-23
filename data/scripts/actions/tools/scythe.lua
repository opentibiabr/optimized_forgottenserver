local scythe = Action()

function scythe.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return ActionsLib.useScythe(player, item, fromPosition, target, toPosition, isHotkey) or ActionsLib.destroyItem(player, target, toPosition)
end

if(CLIENT_VERSION >= 1180) then
	scythe:id(32446, 32447, 32448, 32449)
end
if(CLIENT_VERSION >= 940) then
	scythe:id(15492)
end
if(CLIENT_VERSION >= 850) then
	scythe:id(10301)
end
if(CLIENT_VERSION >= 750) then
	scythe:id(3963)
end
scythe:id(2550)
scythe:register()
