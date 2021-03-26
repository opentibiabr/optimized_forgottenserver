local spellbooks = {
	--{itemid, client_version}
	{29431, 1200}, -- spirit guide
	{29420, 1200}, -- shoulder plate
	{25699, 1140}, -- wooden spellbook
	{22755, 1090}, -- book of lies
	{21400, 1055}, -- spellbook of the novice
	{20090, 1030}, -- umbral master spellbook
	{20089, 1030}, -- umbral spellbook
	{20088, 1030}, -- crude umbral spellbook
	{16107, 960}, -- spellbook of vigilance
	{14769, 960}, -- spellbook of ancient arcana
	{11691, 860}, -- snake god's wristguard
	{8090, 820}, -- spellbook of dark mysteries
	{8076, 820}, -- spellscroll of prophecies
	{8075, 820}, -- spellbook of lost souls
	{8074, 820}, -- spellbook of mind control
	{8073, 820}, -- spellbook of warding
	{8072, 820}, -- spellbook of enlightenment
	{6120, 780}, -- Dragha's spellbook
	{3059, 0} -- spellbook
}

local spellbook = Action()

function spellbook.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local text = {}
	local spells = {}
	for _, spell in ipairs(player:getInstantSpells()) do
		if spell.level ~= 0 then
			if spell.manapercent > 0 then
				spell.mana = spell.manapercent .. "%"
			end
			spells[#spells + 1] = spell
		end
	end

	table.sort(spells, function(a, b) return a.level < b.level end)

	local prevLevel = -1
	for i, spell in ipairs(spells) do
		if prevLevel ~= spell.level then
			if i == 1 then
				text[#text == nil and 1 or #text+1] = "Spells for Level "
			else
				text[#text+1] = "\nSpells for Level "
			end
			text[#text+1] = spell.level .. "\n"
			prevLevel = spell.level
		end
		text[#text+1] = spell.words .. " - " .. spell.name .. " : " .. spell.mana .. "\n"
	end

	player:showTextDialog(item:getId(), table.concat(text))
	return true
end

-- spellbookValues[1] = spellbook id (first number of the table)
-- spellbookValues[2] = item client version (second number of the table)
for index, spellbookValues in ipairs(spellbooks) do
	if(CLIENT_VERSION >= spellbookValues[2]) then
		spellbook:id(spellbookValues[1])
	end
end

spellbook:register()
