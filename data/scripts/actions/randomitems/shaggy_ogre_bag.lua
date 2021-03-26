if(CLIENT_VERSION < 1090) then
	return
end

local config = {
	{itemId = 7413, chanceFrom = 9842, chanceTo = 9926}, -- titan axe
	{itemId = 7432, chanceFrom = 8596, chanceTo = 8872}, -- furry club
	{itemId = 7452, chanceFrom = 9927, chanceTo = 9969}, -- spiked squelcher
	{itemId = 3403, chanceFrom = 7764, chanceTo = 8339}, -- tribal mask
	{itemId = 3406, chanceFrom = 8340, chanceTo = 8595}, -- feather headdress
	{itemId = 3443, chanceFrom = 9076, chanceTo = 9394}, -- tusk shield
	{itemId = 3560, chanceFrom = 9395, chanceTo = 9703}, -- bast skirt
	{itemId = 5668, chanceFrom = 9970, chanceTo = 10000}, -- mysterious voodoo skull
	{itemId = 22171, chanceFrom = 9012, chanceTo = 9075}, -- ogre klubba
	{itemId = 22172, chanceFrom = 8884, chanceTo = 9011}, -- ogre choppa
	{itemId = 22187, count = 5, chanceFrom = 0, chanceTo = 2865}, -- roasted meat
	{itemId = 22183, chanceFrom = 8873, chanceTo = 8883}, -- ogre scepta
	{itemId = 22184, chanceFrom = 3409, chanceTo = 4356}, -- shamanic talisman
	{itemId = 22188, chanceFrom = 6306, chanceTo = 7327}, -- ogre ear stud
	{itemId = 22189, chanceFrom = 4357, chanceTo = 5666}, -- ogre nose ring
	{itemId = 22191, chanceFrom = 2866, chanceTo = 3408}, -- skull fetish
	{itemId = 22192, chanceFrom = 9704, chanceTo = 9841}, -- shamanic mask
	{itemId = 22193, count = 3, chanceFrom = 7328, chanceTo = 7764}, -- onyx chip
	{itemId = 22194, count = 2, chanceFrom = 5667, chanceTo = 6305} -- opal
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

surprise:id(22763)
surprise:register()
