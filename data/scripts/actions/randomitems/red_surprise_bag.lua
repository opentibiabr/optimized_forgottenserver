if(CLIENT_VERSION < 792) then
	return
end

local config = {
	{itemId = 2993, chanceFrom = 9886, chanceTo = 9907}, -- teddy bear
	{itemId = 2995, chanceFrom = 9008, chanceTo = 9519}, -- piggy bank
	{itemId = 3036, chanceFrom = 9520, chanceTo = 9692}, -- violet gem
	{itemId = 3039, chanceFrom = 9851, chanceTo = 9885}, -- red gem
	{itemId = 3057, chanceFrom = 9987, chanceTo = 9995}, -- amulet of loss
	{itemId = 3079, chanceFrom = 9945, chanceTo = 9959}, -- boots of haste
	{itemId = 3386, chanceFrom = 9960, chanceTo = 9974}, -- dragon scale mail
	{itemId = 3392, chanceFrom = 9975, chanceTo = 9986}, -- royal helmet
	{itemId = 3420, chanceFrom = 9908, chanceTo = 9925}, -- demon shield
	{itemId = 5944, chanceFrom = 9693, chanceTo = 9850}, -- soul orb
	{itemId = 6393, chanceFrom = 4761, chanceTo = 6841}, -- cream cake
	{itemId = 6566, chanceFrom = 9996, chanceTo = 10000}, -- stuffed dragon
	{itemId = 6568, chanceFrom = 9926, chanceTo = 9944}, -- panda teddy
	{itemId = 6574, chanceFrom = 6842, chanceTo = 7975}, -- bar of chocolate
	{itemId = 6576, chanceFrom = 0, chanceTo = 4760}, -- fireworks rocket
	{itemId = 6578, chanceFrom = 7976, chanceTo = 9007}, -- party hat
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

surprise:id(6571)
surprise:register()
