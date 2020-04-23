if(CLIENT_VERSION < 792) then
	return
end

local partyhat = Action()

function partyhat.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local headSlotItem = player:getSlotItem(CONST_SLOT_HEAD)
	if not headSlotItem or item ~= headSlotItem then
		return false
	end

	player:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
	return true
end

partyhat:id(6578)
partyhat:register()
