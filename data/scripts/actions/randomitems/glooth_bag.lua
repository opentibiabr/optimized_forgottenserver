if(CLIENT_VERSION < 1050) then
	return
end

local config = {
	{itemId = 21143, count = 10, chanceFrom = 8463, chanceTo = 8975}, -- glooth sandwich
	{itemId = 21144, count = 10, chanceFrom = 8976, chanceTo = 9469}, -- bowl of glooth soup
	{itemId = 21146, count = 10, chanceFrom = 9470, chanceTo = 9922}, -- glooth steak
	{itemId = 21158, count = 2, chanceFrom = 0, chanceTo = 1875}, -- glooth spear
	{itemId = 21178, chanceFrom = 3419, chanceTo = 4933}, -- glooth club
	{itemId = 21179, chanceFrom = 6398, chanceTo = 7829}, -- glooth blade
	{itemId = 21180, chanceFrom = 4934, chanceTo = 6397}, -- glooth axe
	{itemId = 21183, chanceFrom = 1876, chanceTo = 3418}, -- glooth amulet
	{itemId = 21186, chanceFrom = 9923, chanceTo = 10000}, -- control unit
	{itemId = 21295, chanceFrom = 7830, chanceTo = 8462} -- glooth backpack
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

surprise:id(21203)
surprise:register()
