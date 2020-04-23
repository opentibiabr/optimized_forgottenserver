local dough = MoveEvent()
dough:type("additem")

function dough.onAddItem(moveitem, tileitem, position)
	if moveitem.itemid == 2693 then
		moveitem:transform(2689)
		position:sendMagicEffect(CONST_ME_HITBYFIRE)
	elseif moveitem.itemid == 6277 then
		moveitem:transform(2687, 12)
		position:sendMagicEffect(CONST_ME_HITBYFIRE)
	end
	return true
end

dough:id(1786, 1788, 1790, 1792)
dough:register()