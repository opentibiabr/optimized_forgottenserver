if(CLIENT_VERSION < 1150) then
	return
end

local config = {
	{chanceFrom = 0, chanceTo = 4269, itemId = 2158}, -- blue gem
	{chanceFrom = 4270, chanceTo = 6829, itemId = 25172}, -- silver token
	{chanceFrom = 6830, chanceTo = 8195, itemId = 2153}, -- violet gem
	{chanceFrom = 6196, chanceTo = 9074, itemId = 30888}, -- suspicious device
	{chanceFrom = 9075, chanceTo = 10000, itemId = 25377} -- gold token
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

			item:getPosition():sendMagicEffect(CONST_ME_ENERGYAREA)
			item:remove(1)
			return true
		end
	end
	return false
end

surprise:id(32014)
surprise:register()
