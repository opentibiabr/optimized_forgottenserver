local ResourceConfig = {
	RESOURCETYPE_BANK_GOLD = 0,
	RESOURCETYPE_INVENTORY_GOLD = 1,
	RESOURCETYPE_PREY_BONUS_REROLLS = 10,
	RESOURCETYPE_COLLECTION_TOKENS = 20,
	RESOURCETYPE_CHARM_POINTS = 30,
	RESOURCETYPE_TOURNAMENT_TICKET_VOUCHERS = 40
}

local function sendResource(player, resourceType, resourceValue)
	local omsg = NetworkMessage()
	omsg:addByte(0xEE)
	omsg:addByte(resourceType)
	if(resourceType == RESOURCETYPE_CHARM_POINTS) then
		omsg:addU32(resourceValue)
	else
		omsg:addU64(resourceValue)
	end
	omsg:sendToPlayer(player)
	omsg:delete()
end

function onRecvbyte(player, msg, byte)
	local resourceType = msg:getByte()
	if(resourceType == RESOURCETYPE_BANK_GOLD) then
		sendResource(player, RESOURCETYPE_BANK_GOLD, player:getBankBalance())
	elseif(resourceType == RESOURCETYPE_INVENTORY_GOLD) then
		sendResource(player, RESOURCETYPE_INVENTORY_GOLD, player:getMoney())
	elseif(resourceType == RESOURCETYPE_PREY_BONUS_REROLLS) then
		sendResource(player, RESOURCETYPE_PREY_BONUS_REROLLS, 0)
	elseif(resourceType == RESOURCETYPE_COLLECTION_TOKENS) then
		sendResource(player, RESOURCETYPE_COLLECTION_TOKENS, 0)
	elseif(resourceType == RESOURCETYPE_CHARM_POINTS) then
		sendResource(player, RESOURCETYPE_CHARM_POINTS, 0)
	elseif(resourceType == RESOURCETYPE_TOURNAMENT_TICKET_VOUCHERS) then
		sendResource(player, RESOURCETYPE_TOURNAMENT_TICKET_VOUCHERS, 0)
	end
end
