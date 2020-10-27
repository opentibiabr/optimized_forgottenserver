function Container.isContainer(self)
	return true
end

function Container.createLootItem(self, item)
	if self:getEmptySlots() == 0 then
		return true
	end

	local itemCount = nil
	local randvalue = getLootRandom()
	if randvalue < item.chance then
		local it = ItemType(item.itemId)
		if it:isStackable() then
			itemCount = math.min(randvalue % item.maxCount + 1, 100)
		elseif it:isFluidContainer() then
			itemCount = item.maxCount
		else
			itemCount = 1
		end
	end

	if itemCount then
		local tmpItem = Game.createItem(item.itemId, itemCount)
		if not tmpItem then
			return false
		end

		if tmpItem:isContainer() then
			local childLoot = #item.childLoot
			for i = 1, childLoot do
				if not tmpItem:createLootItem(item.childLoot[i]) then
					return false
				end
			end

			if tmpItem:getSize() == 0 and childLoot > 0 then
				return true
			end
		end

		if item.subType ~= -1 then
			tmpItem:setAttribute(ITEM_ATTRIBUTE_CHARGES, item.subType)
		end

		if item.actionId ~= -1 then
			tmpItem:setActionId(item.actionId)
		end

		if item.text and item.text ~= "" then
			tmpItem:setText(item.text)
		end

		self:addItemEx(tmpItem)
	end
	return true
end
