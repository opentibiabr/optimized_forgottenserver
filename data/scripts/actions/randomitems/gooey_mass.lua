if(CLIENT_VERSION < 940) then
	return
end

local config = {
	{chanceFrom = 0, chanceTo = 38}, -- nothing
	{itemId = 238, count = 2, chanceFrom = 7952, chanceTo = 9843}, -- great mana potion
	{itemId = 239, count = 2, chanceFrom = 6041, chanceTo = 7951}, -- great health potion
	{itemId = 3027, count = 2, chanceFrom = 4188, chanceTo = 6040}, -- black pearl
	{itemId = 3035, count = 2, chanceFrom = 39, chanceTo = 2132}, -- platinum coin
	{itemId = 9058, chanceFrom = 9844, chanceTo = 9941}, -- gold ingot
	{itemId = 14143, chanceFrom = 9942, chanceTo = 9987}, -- four-leaf clover
	{itemId = 14084, count = 10, chanceFrom = 2133, chanceTo = 4187}, -- larvae
	{itemId = 14089, chanceFrom = 9988, chanceTo = 10000} -- hive scythe
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

			item:getPosition():sendMagicEffect(CONST_ME_HITBYPOISON)
			item:remove(1)
			return true
		end
	end
	return false
end

surprise:id(14172)
surprise:register()
