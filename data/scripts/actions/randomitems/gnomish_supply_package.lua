if(CLIENT_VERSION < 960) then
	return
end

local config = {
	{itemId = 236, count = 2, chanceFrom = 4837, chanceTo = 5443}, -- strong health potion
	{itemId = 237, count = 2, chanceFrom = 5444, chanceTo = 6024}, -- strong mana potion
	{itemId = 238, chanceFrom = 7070, chanceTo = 7518}, -- great mana potion
	{itemId = 239, chanceFrom = 7519, chanceTo = 7930}, -- great health potion
	{itemId = 266, count = 4, chanceFrom = 6025, chanceTo = 6568}, -- health potion
	{itemId = 268, count = 4, chanceFrom = 6569, chanceTo = 7069}, -- mana potion
	{itemId = 3035, count = 5, chanceFrom = 8901, chanceTo = 9204}, -- platinum coin
	{itemId = 3037, chanceFrom = 9924, chanceTo = 9956}, -- yellow gem
	{itemId = 3038, chanceFrom = 9994, chanceTo = 10000}, -- green gem
	{itemId = 3039, chanceFrom = 9891, chanceTo = 9923}, -- red gem
	{itemId = 3041, chanceFrom = 9987, chanceTo = 9993}, -- blue gem
	{itemId = 3043, chanceFrom = 9838, chanceTo = 9890}, -- crystal coin
	{itemId = 3723, count = 20, chanceFrom = 0, chanceTo = 1438}, -- white mushroom
	{itemId = 5911, chanceFrom = 8588, chanceTo = 8900}, -- red piece of cloth
	{itemId = 7439, chanceFrom = 8271, chanceTo = 8587}, -- berserk potion
	{itemId = 7440, chanceFrom = 9205, chanceTo = 9504}, -- mastermind potion
	{itemId = 7443, chanceFrom = 7931, chanceTo = 8270}, -- bullseye potion
	{itemId = 15793, count = 15, chanceFrom = 3260, chanceTo = 4057}, -- crystalline arrow
	{itemId = 16103, chanceFrom = 1439, chanceTo = 2454}, -- mushroom pie
	{itemId = 16143, count = 15, chanceFrom = 2455, chanceTo = 3259}, -- envenomed arrow
	{itemId = 16165, chanceFrom = 9505, chanceTo = 9629}, -- pet pig
	{itemId = 16167, chanceFrom = 4058, chanceTo = 4836}, -- teleport crystal
	{itemId = 16242, chanceFrom = 9957, chanceTo = 9986}, -- red teleport crystal
	{itemId = 16254, chanceFrom = 9742, chanceTo = 9837}, -- gnomish voucher type MA2
	{itemId = 16257, chanceFrom = 9630, chanceTo = 9741} -- gnomish voucher type CA2
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

			item:remove(1)
			return true
		end
	end
	return false
end

surprise:id(15698)
surprise:register()
