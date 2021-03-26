if(CLIENT_VERSION < 1094) then
	return
end

local config = {
	{itemId = 3035, count = 5, chanceFrom = 0, chanceTo = 1450}, -- platinum coin
	{itemId = 3049, chanceFrom = 8751, chanceTo = 9050}, -- stealth ring
	{itemId = 3051, chanceFrom = 8451, chanceTo = 8750}, -- energy ring
	{itemId = 3053, chanceFrom = 7451, chanceTo = 8050}, -- time ring
	{itemId = 3097, chanceFrom = 8051, chanceTo = 8450}, -- dwarven ring
	{itemId = 3098, chanceFrom = 9351, chanceTo = 9550}, -- ring of healing
	{itemId = 3586, count = 20, chanceFrom = 5051, chanceTo = 6050}, -- orange
	{itemId = 7439, chanceFrom = 9551, chanceTo = 9750}, -- berserk potion
	{itemId = 7440, chanceFrom = 9051, chanceTo = 9350}, -- mastermind potion
	{itemId = 7443, chanceFrom = 9851, chanceTo = 9950}, -- bullseye potion
	{itemId = 16119, chanceFrom = 6051, chanceTo = 6850}, -- blue crystal shard
	{itemId = 16120, chanceFrom = 9751, chanceTo = 9850}, -- violet crystal shard
	{itemId = 16121, chanceFrom = 6851, chanceTo = 7450}, -- green crystal shard
	{itemId = 16127, chanceFrom = 1451, chanceTo = 2850}, -- green crystal fragment
	{itemId = 16125, chanceFrom = 2851, chanceTo = 3950}, -- cyan crystal fragment
	{itemId = 16126, chanceFrom = 3951, chanceTo = 5050}, -- red crystal fragment
	{itemId = 23489, chanceFrom = 9951, chanceTo = 9960}, -- brown pit demon
	{itemId = 23490, chanceFrom = 9961, chanceTo = 9970}, -- green pit demon
	{itemId = 23491, chanceFrom = 9971, chanceTo = 9980}, -- blue pit demon
	{itemId = 23492, chanceFrom = 9981, chanceTo = 9990}, -- black pit demon
	{itemId = 23493, chanceFrom = 9991, chanceTo = 10000} -- red pit demon
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

surprise:id(23488)
surprise:register()
