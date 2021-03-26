local liquidContainers = {2524, 2873, 2874, 2875, 2876, 2877, 2879, 2880, 2881, 2882, 2883, 2893, 2901, 2902, 2903}
local millstones = {1943, 1944, 1945, 1946}

local createbread = Action()

function createbread.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local itemId = item:getId()
	if itemId == 3603 then
		if target.type == 1 and table.contains(liquidContainers, target.itemid) then
			item:remove(1)
			player:addItem(3604, 1)
			target:transform(target.itemid, 0)
			return true
		end
	elseif table.contains(millstones, target.itemid) then
		item:remove(1)
		player:addItem(3603, 1)
		return true
	end
	return false
end

createbread:id(3603, 3605)
createbread:register()
