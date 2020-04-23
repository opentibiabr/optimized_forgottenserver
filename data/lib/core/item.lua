function Item.getType(self)
	return ItemType(self:getId())
end

function Item.isContainer(self)
	return false
end

function Item.isCreature(self)
	return false
end

function Item.isMonster(self)
	return false
end

function Item.isNpc(self)
	return false
end

function Item.isPlayer(self)
	return false
end

function Item.isTeleport(self)
	return false
end

function Item.isTile(self)
	return false
end

function Item.managedAddItem(self, itemId, itemCount)
	local parent = self:getParent()
	if(parent and parent:isContainer()) then
		local newitem = parent:addItem(itemId, itemCount)
		if(not newitem) then
			parent = self:getTopParent()
			if(parent) then
				newitem = parent:addItem(itemId, itemCount)
				if(newitem) then
					return
				end
			end
		else
			return
		end
	end

	Game.createItem(itemId, itemCount, self:getPosition())
end
