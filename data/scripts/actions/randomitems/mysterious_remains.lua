if(CLIENT_VERSION < 1094) then
	return
end

local config = {
	{itemId = 2958, chanceFrom = 5041, chanceTo = 6034}, -- war horn
	{itemId = 2995, chanceFrom = 0, chanceTo = 471}, -- piggy bank
	{itemId = 3036, chanceFrom = 8939, chanceTo = 9147}, -- violet gem
	{itemId = 3037, chanceFrom = 472, chanceTo = 1413}, -- yellow gem
	{itemId = 3044, chanceFrom = 1989, chanceTo = 2616}, -- tusk
	{itemId = 3046, chanceFrom = 7152, chanceTo = 7360}, -- magic light wand
	{itemId = 3049, chanceFrom = 4343, chanceTo = 4708}, -- stealth ring
	{itemId = 3083 ,chanceFrom = 8625, chanceTo = 8938}, -- garlic necklace
	{itemId = 3572, chanceFrom = 6035, chanceTo = 6819}, -- scarf
	{itemId = 3723, count = 10, chanceFrom = 9514, chanceTo = 9879}, -- white mushroom
	{itemId = 5879, chanceFrom = 3192, chanceTo = 3557}, -- spider silk
	{itemId = 5880, chanceFrom = 2617, chanceTo = 3191}, -- iron ore
	{itemId = 5882, chanceFrom = 3558, chanceTo = 4342}, -- red dragon scale
	{itemId = 6570, chanceFrom = 7361, chanceTo = 7526}, -- surprise bag
	{itemId = 8899, chanceFrom = 9148, chanceTo = 9513}, -- slightly rusted legs
	{itemId = 9058, chanceFrom = 6820, chanceTo = 6985}, -- gold ingot
	{itemId = 12548, chanceFrom = 1414, chanceTo = 1988}, -- bag of apple slices
	{itemId = 15698, chanceFrom = 7945, chanceTo = 8624}, -- gnomish supply package
	{itemId = 22194, count = 2, chanceFrom = 9880, chanceTo = 10000}, -- opal
	{itemId = 22731, chanceFrom = 7527, chanceTo = 7944}, -- rift tapestry
	{itemId = 22737, chanceFrom = 4709, chanceTo = 4874}, -- folded rift carpet
	{itemId = 22763, chanceFrom = 6986, chanceTo = 7151}, -- shaggy ogre bag
	{itemId = 23536, chanceFrom = 4875, chanceTo = 5040} -- folded void carpet
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

surprise:id(23509)
surprise:register()
