if(CLIENT_VERSION < 792) then
	return
end

local config = {
	{itemId = 2995, chanceFrom = 2963, chanceTo = 3872}, -- piggy bank
	{itemId = 3598, chanceFrom = 8479, chanceTo = 9212, count = 10}, -- cookie
	{itemId = 6279, chanceFrom = 1047, chanceTo = 1997}, -- party cake
	{itemId = 6393, chanceFrom = 6726, chanceTo = 7649}, -- cream cake
	{itemId = 6569, chanceFrom = 0, chanceTo = 1046, count = 3}, -- candy
	{itemId = 6572, chanceFrom = 3873, chanceTo = 4782}, -- party trumpet
	{itemId = 6574, chanceFrom = 9213, chanceTo = 10000}, -- bar of chocolate
	{itemId = 6575, chanceFrom = 4783, chanceTo = 5842}, -- red balloons
	{itemId = 6576, chanceFrom = 1998, chanceTo = 2962}, -- fireworks rocket
	{itemId = 6577, chanceFrom = 7650, chanceTo = 8478}, -- green balloons
	{itemId = 6578, chanceFrom = 5843, chanceTo = 6725} -- party hat
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

surprise:id(6570)
surprise:register()
