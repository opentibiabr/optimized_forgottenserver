if(CLIENT_VERSION < 1202) then
	return
end

local config = {
	{chanceFrom = 0, chanceTo = 5000, itemId = 6570}, -- blue surprise bag
	{chanceFrom = 5001, chanceTo = 10000, itemId = 6571} -- red surprise bag
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

surprise:id(35143)
surprise:register()
