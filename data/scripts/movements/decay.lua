local decayItems = {
	--[itemid] = {decayToId, clientVersion}
	[293] = {294, 0}, -- grass (hole)
	[475] = {476, 0}, -- closed trapdoor
	[1066] = {1067, 750} -- mud stain (hole)
}

local decay = MoveEvent()
decay:type("stepin")

function decay.onStepIn(creature, item, position, fromPosition)
	item:transform(decayItems[item.itemid][1])
	item:decay()
	return true
end

for decayTableIndex, decayTableValue in pairs(decayItems) do
	if (CLIENT_VERSION >= decayTableValue[2]) then
		decay:id(decayTableIndex)
	end
end
decay:register()
