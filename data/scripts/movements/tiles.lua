local increasing = {[419] = 420, [431] = 430, [452] = 453, [563] = 564, [549] = 562, [10145] = 10146}
local decreasing = {[420] = 419, [430] = 431, [453] = 452, [564] = 563, [562] = 549, [10146] = 10145}

local itemAdjusting = nil
if GAME_FEATURE_STASH then
	itemAdjusting = 4
elseif GAME_FEATURE_MARKET then
	itemAdjusting = 3
else
	itemAdjusting = 1
end

local tile = MoveEvent()
tile:type("stepin")

function tile.onStepIn(creature, item, position, fromPosition)
	if not increasing[item.itemid] then
		return true
	end

	if not creature:isPlayer() or creature:isInGhostMode() then
		return true
	end

	item:transform(increasing[item.itemid])

	if item.actionid >= 1000 then
		if creature:getLevel() < item.actionid - 1000 then
			creature:teleportTo(fromPosition, false)
			position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			creature:sendTextMessage(MESSAGE_INFO_DESCR, "The tile seems to be protected against unwanted intruders.")
		end
		return true
	end

	if Tile(position):hasFlag(TILESTATE_PROTECTIONZONE) then
		local lookPosition = creature:getPosition()
		lookPosition:getNextPosition(creature:getDirection())
		local depotItem = Tile(lookPosition):getItemByType(ITEM_TYPE_DEPOT)
		if depotItem then
			local depotItems = creature:getDepotLocker(getDepotId(depotItem:getUniqueId()), true):getItemHoldingCount() - itemAdjusting
			creature:sendTextMessage(MESSAGE_STATUS_DEFAULT, "Your depot contains " .. depotItems .. " item" .. (depotItems > 1 and "s." or "."))
			if GAME_FEATURE_STASH then
				creature:setSpecialContainersAvailable(true, true)
			end
			return true
		end
	end

	if item.actionid ~= 0 and creature:getStorageValue(item.actionid) <= 0 then
		creature:teleportTo(fromPosition, false)
		position:sendMagicEffect(CONST_ME_MAGIC_BLUE)
		creature:sendTextMessage(MESSAGE_INFO_DESCR, "The tile seems to be protected against unwanted intruders.")
		return true
	end
	return true
end

if(CLIENT_VERSION >= 853) then
	tile:id(10145)
end
tile:id(419, 431, 452, 563)
tile:register()

tile = MoveEvent()
tile:type("stepout")

function tile.onStepOut(creature, item, position, fromPosition)
	if not decreasing[item.itemid] then
		return true
	end

	if creature:isPlayer() and creature:isInGhostMode() then
		return true
	end

	if GAME_FEATURE_STASH and creature:isPlayer() and (creature:isSupplyStashAvailable() or creature:isMarketAvailable()) then
		creature:setSpecialContainersAvailable(false, false)
	end

	item:transform(decreasing[item.itemid])
	return true
end

if(CLIENT_VERSION >= 853) then
	tile:id(10145)
end
tile:id(419, 431, 452, 563)
tile:register()
