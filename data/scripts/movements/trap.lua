local traps = {
	[1510] = {transformTo = 1511, damage = {-50, -100}},
	[1513] = {damage = {-50, -100}},
	[2579] = {transformTo = 2578, damage = {-15, -30}},
	[4208] = {transformTo = 4209, damage = {-15, -30}, type = COMBAT_EARTHDAMAGE}
}

local trap = MoveEvent()
trap:type("stepin")

function trap.onStepIn(creature, item, position, fromPosition)
	local trap = traps[item.itemid]
	if not trap then
		return true
	end

	if creature:isMonster() then
		doTargetCombatHealth(0, creature, trap.type or COMBAT_PHYSICALDAMAGE, trap.damage[1], trap.damage[2], CONST_ME_NONE)
	end

	if trap.transformTo then
		item:transform(trap.transformTo)
	end
	return true
end

if(CLIENT_VERSION >= 750) then
	trap:id(4208)
end
trap:id(1510, 1513, 2579)
trap:register()

trap = MoveEvent()
trap:type("stepout")

function trap.onStepOut(creature, item, position, fromPosition)
	item:transform(item.itemid - 1)
	return true
end

if(CLIENT_VERSION >= 750) then
	trap:id(4209)
end
trap:id(1511)
trap:register()

trap = MoveEvent()
trap:type("removeitem")

function trap.onRemoveItem(moveitem, tileitem, position)
	local itemPosition = moveitem:getPosition()
	if itemPosition:getDistance(position) > 0 then
		tileitem:transform(tileitem.itemid - 1)
		position:sendMagicEffect(CONST_ME_POFF)
	end
	return true
end

trap:id(2579)
trap:register()
