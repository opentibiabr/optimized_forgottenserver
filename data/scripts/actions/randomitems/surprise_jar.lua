if(CLIENT_VERSION < 1150) then
	return
end

local config = {
	{itemId = 3036, chanceFrom = 6830, chanceTo = 8195}, -- violet gem
	{itemId = 3041, chanceFrom = 0, chanceTo = 4269}, -- blue gem
	{itemId = 22516, chanceFrom = 4270, chanceTo = 6829}, -- silver token
	{itemId = 22721, chanceFrom = 9075, chanceTo = 10000}, -- gold token
	{itemId = 27653, chanceFrom = 6196, chanceTo = 9074} -- suspicious device
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

surprise:id(27654)
surprise:register()
