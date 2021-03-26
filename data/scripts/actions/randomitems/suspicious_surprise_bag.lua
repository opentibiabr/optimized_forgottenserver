if(CLIENT_VERSION < 840) then
	return
end

local config = {
	{chanceFrom = 0, chanceTo = 3394}, -- nothing
	{itemId = 123, chanceFrom = 9987, chanceTo = 10000}, -- toy mouse
	{itemId = 651, chanceFrom = 5160, chanceTo = 6954}, -- spellwand
	{itemId = 900, chanceFrom = 3395, chanceTo = 5159}, -- yellow pillow
	{itemId = 2995, chanceFrom = 6955, chanceTo = 8327}, -- piggy bank
	{itemId = 3218, chanceFrom = 9851, chanceTo = 9986}, -- present
	{itemId = 6574, chanceFrom = 8328, chanceTo = 9141}, -- bar of chocolate
	{itemId = 6393, chanceFrom = 9142, chanceTo = 9654}, -- cream cake
	{itemId = 7377, chanceFrom = 9655, chanceTo = 9850} -- ice cream cone
}
local surprise = Action()

function surprise.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local chance = math.random(0, 10000)
	for i = 1, #config do
		local randomItem = config[i]
		if chance >= randomItem.chanceFrom and chance <= randomItem.chanceTo then
			if randomItem.itemId then
				local gift = randomItem.itemId
				local count = randomItem.count or 1
				if type(count) == "table" then
					count = math.random(count[1], count[2])
				end
				item:managedAddItem(gift, count)
				item:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
			else
				item:getPosition():sendMagicEffect(CONST_ME_CAKE)
			end

			item:remove(1)
			return true
		end
	end
	return false
end

surprise:id(8853)
surprise:register()
