if(CLIENT_VERSION < 790) then
	return
end

local cake = MoveEvent()
cake:type("additem")

function cake.onAddItem(moveitem, tileitem, position)
	if moveitem.itemid == 2918 then
		tileitem:transform(6279)
		moveitem:remove()
		position:sendMagicEffect(CONST_ME_MAGIC_RED)
	end
	return true
end

cake:id(6278)
cake:register()