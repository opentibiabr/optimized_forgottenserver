if(CLIENT_VERSION < 950) then
	return
end

local config = {
	{itemId = 3215, chanceFrom = 9991, chanceTo = 10000}, -- phoenix egg
	{itemId = 4839, chanceFrom = 9551, chanceTo = 9850}, -- hydra egg
	{itemId = 6541, count = 10, chanceFrom = 0, chanceTo = 1500}, -- coloured egg
	{itemId = 6542, count = 10, chanceFrom = 1501, chanceTo = 3000}, -- coloured egg
	{itemId = 6543, count = 10, chanceFrom = 3001, chanceTo = 4500}, -- coloured egg
	{itemId = 6544, count = 10, chanceFrom = 4501, chanceTo = 6000}, -- coloured egg
	{itemId = 6545, count = 10, chanceFrom = 6001, chanceTo = 7500}, -- coloured egg
	{itemId = 6569, count = 10, chanceFrom = 7501, chanceTo = 8550}, -- candy
	{itemId = 6570, chanceFrom = 9851, chanceTo = 9950}, -- blue surprise bag
	{itemId = 6571, chanceFrom = 9951, chanceTo = 9990}, -- red surprise bag
	{itemId = 6574, chanceFrom = 8551, chanceTo = 9550} -- bar of chocolate
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
			end

			item:getPosition():sendMagicEffect(CONST_ME_GIFT_WRAPS)
			item:remove(1)
			return true
		end
	end
	return false
end

surprise:id(14759)
surprise:register()
