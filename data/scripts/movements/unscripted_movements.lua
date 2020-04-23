local items = {
	{itemid = 37471, type = "equip", slot = "ring", level = 200, client_version = 1230}, -- ring of souls
	{itemid = 37471, type = "deequip", slot = "ring", level = 200, client_version = 1230}, -- ring of souls
	{itemid = 37470, type = "equip", slot = "ring", level = 200, client_version = 1230}, -- ring of souls
	{itemid = 37470, type = "deequip", slot = "ring", level = 200, client_version = 1230}, -- ring of souls
	{itemid = 37465, type = "equip", slot = "head", client_version = 1230}, -- spooky hood
	{itemid = 37465, type = "deequip", slot = "head", client_version = 1230}, -- spooky hood
	{itemid = 37463, type = "equip", slot = "armor", level = 230, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 1230}, -- ghost chestplate
	{itemid = 37463, type = "deequip", slot = "armor", level = 230, client_version = 1230}, -- ghost chestplate
	{itemid = 37456, type = "equip", slot = "ring", level = 200, client_version = 1230}, -- ring of souls
	{itemid = 37456, type = "deequip", slot = "ring", level = 200, client_version = 1230}, -- ring of souls
	{itemid = 37455, type = "equip", slot = "backpack", client_version = 1230}, -- ghost backpack
	{itemid = 37455, type = "deequip", slot = "backpack", client_version = 1230}, -- ghost backpack
	{itemid = 37454, type = "equip", slot = "feet", level = 140, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1230}, -- pair of nightmare boots
	{itemid = 37454, type = "deequip", slot = "feet", level = 140, client_version = 1230}, -- pair of nightmare boots
	{itemid = 37453, type = "equip", slot = "legs", level = 180, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1230}, -- soulful legs
	{itemid = 37453, type = "deequip", slot = "legs", level = 180, client_version = 1230}, -- soulful legs
	{itemid = 37452, type = "equip", slot = "legs", level = 225, vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 1230}, -- fabulous legs
	{itemid = 37452, type = "deequip", slot = "legs", level = 225, client_version = 1230}, -- fabulous legs
	{itemid = 37451, type = "equip", slot = "hand", client_version = 1230}, -- phantasmal axe
	{itemid = 37451, type = "deequip", slot = "hand", client_version = 1230}, -- phantasmal axe
	{itemid = 37420, type = "equip", slot = "armor", client_version = 1230}, -- burial shroud
	{itemid = 37420, type = "deequip", slot = "armor", client_version = 1230}, -- burial shroud
	{itemid = 36928, type = "equip", slot = "hand", client_version = 1220}, -- meat hammer
	{itemid = 36928, type = "deequip", slot = "hand", client_version = 1220}, -- meat hammer
	{itemid = 36511, type = "equip", slot = "necklace", client_version = 1220}, -- note about two souls
	{itemid = 36511, type = "deequip", slot = "necklace", client_version = 1220}, -- note about two souls
	{itemid = 36466, type = "equip", slot = "necklace", level = 250, client_version = 1220}, -- the cobra amulet
	{itemid = 36466, type = "deequip", slot = "necklace", level = 250, client_version = 1220}, -- the cobra amulet
	{itemid = 36460, type = "equip", slot = "backpack", client_version = 1220}, -- winged backpack
	{itemid = 36460, type = "deequip", slot = "backpack", client_version = 1220}, -- winged backpack
	{itemid = 36456, type = "equip", slot = "ring", level = 220, client_version = 1220}, -- blister ring
	{itemid = 36456, type = "deequip", slot = "ring", level = 220, client_version = 1220}, -- blister ring
	{itemid = 36452, type = "equip", slot = "feet", level = 220, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 1220}, -- winged boots
	{itemid = 36452, type = "deequip", slot = "feet", level = 220, client_version = 1220}, -- winged boots
	{itemid = 36451, type = "equip", slot = "ring", level = 220, client_version = 1220}, -- blister ring
	{itemid = 36451, type = "deequip", slot = "ring", level = 220, client_version = 1220}, -- blister ring
	{itemid = 36449, type = "equip", slot = "hand", client_version = 1220}, -- tagralt blade
	{itemid = 36449, type = "deequip", slot = "hand", client_version = 1220}, -- tagralt blade
	{itemid = 36418, type = "equip", slot = "armor", level = 220, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 1220}, -- toga mortis
	{itemid = 36418, type = "deequip", slot = "armor", level = 220, client_version = 1220}, -- toga mortis
	{itemid = 36417, type = "equip", slot = "head", level = 220, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 1220}, -- galea mortis
	{itemid = 36417, type = "deequip", slot = "head", level = 220, client_version = 1220}, -- galea mortis
	{itemid = 36416, type = "equip", slot = "hand", client_version = 1220}, -- bow of cataclysm
	{itemid = 36416, type = "deequip", slot = "hand", client_version = 1220}, -- bow of cataclysm
	{itemid = 36415, type = "equip", slot = "hand", client_version = 1220}, -- mortal mace
	{itemid = 36415, type = "deequip", slot = "hand", client_version = 1220}, -- mortal mace
	{itemid = 36414, type = "equip", slot = "armor", level = 220, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 1220}, -- embrace of nature
	{itemid = 36414, type = "deequip", slot = "armor", level = 220, client_version = 1220}, -- embrace of nature
	{itemid = 36413, type = "equip", slot = "armor", level = 230, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 1220}, -- bear skin
	{itemid = 36413, type = "deequip", slot = "armor", level = 230, client_version = 1220}, -- bear skin
	{itemid = 36412, type = "equip", slot = "head", level = 230, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1220}, -- terra helmet
	{itemid = 36412, type = "deequip", slot = "head", level = 230, client_version = 1220}, -- terra helmet
	{itemid = 36392, type = "equip", slot = "ring", level = 220, client_version = 1220}, -- blister ring
	{itemid = 36392, type = "deequip", slot = "ring", level = 220, client_version = 1220}, -- blister ring
	{itemid = 36391, type = "equip", slot = "necklace", level = 220, client_version = 1220}, -- rainbow amulet
	{itemid = 36391, type = "deequip", slot = "necklace", level = 220, client_version = 1220}, -- rainbow amulet
	{itemid = 36273, type = "equip", slot = "head", client_version = 1220}, -- sphinx tiara
	{itemid = 36273, type = "deequip", slot = "head", client_version = 1220}, -- sphinx tiara
	{itemid = 36268, type = "equip", slot = "head", client_version = 1220}, -- gryphon mask
	{itemid = 36268, type = "deequip", slot = "head", client_version = 1220}, -- gryphon mask
	{itemid = 36266, type = "equip", slot = "ring", client_version = 1220}, -- symbol of sun and sea
	{itemid = 36266, type = "deequip", slot = "ring", client_version = 1220}, -- symbol of sun and sea
	{itemid = 36205, type = "equip", slot = "head", client_version = 1220}, -- silver mask
	{itemid = 36205, type = "deequip", slot = "head", client_version = 1220}, -- silver mask
	{itemid = 36141, type = "equip", slot = "ring", client_version = 1220}, -- ring of secret thoughts
	{itemid = 36141, type = "deequip", slot = "ring", client_version = 1220}, -- ring of secret thoughts
	{itemid = 36103, type = "equip", slot = "necklace", client_version = 1220}, -- jade amulet
	{itemid = 36103, type = "deequip", slot = "necklace", client_version = 1220}, -- jade amulet
	{itemid = 36098, type = "equip", slot = "ring", client_version = 1220}, -- ring of secret thoughts
	{itemid = 36098, type = "deequip", slot = "ring", client_version = 1220}, -- ring of secret thoughts
	{itemid = 35238, type = "equip", slot = "necklace", level = 220, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1220}, -- amulet of theurgy
	{itemid = 35238, type = "deequip", slot = "necklace", level = 220, client_version = 1220}, -- amulet of theurgy
	{itemid = 35237, type = "equip", slot = "necklace", level = 220, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1220}, -- enchanted theurgic amulet
	{itemid = 35237, type = "deequip", slot = "necklace", level = 220, client_version = 1220}, -- enchanted theurgic amulet
	{itemid = 35236, type = "equip", slot = "necklace", level = 220, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1220}, -- amulet of theurgy
	{itemid = 35236, type = "deequip", slot = "necklace", level = 220, client_version = 1220}, -- amulet of theurgy
	{itemid = 35235, type = "equip", slot = "hand", level = 220, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 1220}, -- cobra rod
	{itemid = 35235, type = "deequip", slot = "hand", level = 220, client_version = 1220}, -- cobra rod
	{itemid = 35234, type = "equip", slot = "hand", level = 270, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 1220}, -- cobra wand
	{itemid = 35234, type = "deequip", slot = "hand", level = 270, client_version = 1220}, -- cobra wand
	{itemid = 35233, type = "equip", slot = "hand", client_version = 1220}, -- cobra sword
	{itemid = 35233, type = "deequip", slot = "hand", client_version = 1220}, -- cobra sword
	{itemid = 35232, type = "equip", slot = "head", level = 270, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1220}, -- cobra hood
	{itemid = 35232, type = "deequip", slot = "head", level = 270, client_version = 1220}, -- cobra hood
	{itemid = 35231, type = "equip", slot = "hand", client_version = 1220}, -- cobra axe
	{itemid = 35231, type = "deequip", slot = "hand", client_version = 1220}, -- cobra axe
	{itemid = 35230, type = "equip", slot = "hand", client_version = 1220}, -- cobra club
	{itemid = 35230, type = "deequip", slot = "hand", client_version = 1220}, -- cobra club
	{itemid = 35229, type = "equip", slot = "feet", level = 220, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1220}, -- cobra boots
	{itemid = 35229, type = "deequip", slot = "feet", level = 220, client_version = 1220}, -- cobra boots
	{itemid = 35228, type = "equip", slot = "hand", client_version = 1220}, -- cobra crossbow
	{itemid = 35228, type = "deequip", slot = "hand", client_version = 1220}, -- cobra crossbow
	{itemid = 35150, type = "equip", slot = "necklace", level = 220, client_version = 1202}, -- rainbow necklace
	{itemid = 35150, type = "deequip", slot = "necklace", level = 220, client_version = 1202}, -- rainbow necklace
	{itemid = 35112, type = "equip", slot = "hand", client_version = 1202}, -- ice hatchet
	{itemid = 35112, type = "deequip", slot = "hand", client_version = 1202}, -- ice hatchet
	{itemid = 35108, type = "equip", slot = "ring", client_version = 1202}, -- frozen claw
	{itemid = 35108, type = "deequip", slot = "ring", client_version = 1202}, -- frozen claw
	{itemid = 35105, type = "equip", slot = "head", client_version = 1202}, -- the crown of the percht queen
	{itemid = 35105, type = "deequip", slot = "head", client_version = 1202}, -- the crown of the percht queen
	{itemid = 35104, type = "equip", slot = "head", client_version = 1202}, -- the crown of the percht queen
	{itemid = 35104, type = "deequip", slot = "head", client_version = 1202}, -- the crown of the percht queen
	{itemid = 35056, type = "equip", slot = "backpack", client_version = 1202}, -- festive backpack
	{itemid = 35056, type = "deequip", slot = "backpack", client_version = 1202}, -- festive backpack
	{itemid = 35055, type = "equip", slot = "feet", client_version = 1202}, -- yetislippers
	{itemid = 35055, type = "deequip", slot = "feet", client_version = 1202}, -- yetislippers
	{itemid = 34983, type = "equip", slot = "necklace", level = 180, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 1200}, -- pendulet
	{itemid = 34983, type = "deequip", slot = "necklace", level = 180, client_version = 1200}, -- pendulet
	{itemid = 34982, type = "equip", slot = "necklace", level = 180, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 1200}, -- enchanted pendulet
	{itemid = 34982, type = "deequip", slot = "necklace", level = 180, client_version = 1200}, -- enchanted pendulet
	{itemid = 34981, type = "equip", slot = "necklace", level = 180, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 1200}, -- sleep shawl
	{itemid = 34981, type = "deequip", slot = "necklace", level = 180, client_version = 1200}, -- sleep shawl
	{itemid = 34980, type = "equip", slot = "necklace", level = 180, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 1200}, -- enchanted sleep shawl
	{itemid = 34980, type = "deequip", slot = "necklace", level = 180, client_version = 1200}, -- enchanted sleep shawl
	{itemid = 34819, type = "equip", slot = "shield", client_version = 1200}, -- shield of endless search
	{itemid = 34819, type = "deequip", slot = "shield", client_version = 1200}, -- shield of endless search
	{itemid = 34069, type = "equip", slot = "shield", level = 180, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1200}, -- spirit guide
	{itemid = 34069, type = "deequip", slot = "shield", level = 180, client_version = 1200}, -- spirit guide
	{itemid = 34068, type = "equip", slot = "shield", level = 180, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1200}, -- ectoplasmic shield
	{itemid = 34068, type = "deequip", slot = "shield", level = 180, client_version = 1200}, -- ectoplasmic shield
	{itemid = 34067, type = "equip", slot = "necklace", level = 180, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 1200}, -- pendulet
	{itemid = 34067, type = "deequip", slot = "necklace", level = 180, client_version = 1200}, -- pendulet
	{itemid = 34066, type = "equip", slot = "necklace", level = 180, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 1200}, -- sleep shawl
	{itemid = 34066, type = "deequip", slot = "necklace", level = 180, client_version = 1200}, -- sleep shawl
	{itemid = 34065, type = "equip", slot = "head", level = 180, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 1200}, -- dark whispers
	{itemid = 34065, type = "deequip", slot = "head", level = 180, client_version = 1200}, -- dark whispers
	{itemid = 34064, type = "equip", slot = "shield", level = 180, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1200}, -- brain in a jar
	{itemid = 34064, type = "deequip", slot = "shield", level = 180, client_version = 1200}, -- brain in a jar
	{itemid = 34063, type = "equip", slot = "hand", level = 180, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1200}, -- energized limb
	{itemid = 34063, type = "deequip", slot = "hand", level = 180, client_version = 1200}, -- energized limb
	{itemid = 34062, type = "equip", slot = "feet", level = 180, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1200}, -- pair of dreamwalkers
	{itemid = 34062, type = "deequip", slot = "feet", level = 180, client_version = 1200}, -- pair of dreamwalkers
	{itemid = 34061, type = "equip", slot = "armor", level = 180, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1200}, -- dream shroud
	{itemid = 34061, type = "deequip", slot = "armor", level = 180, client_version = 1200}, -- dream shroud
	{itemid = 34060, type = "equip", slot = "hand", client_version = 1200}, -- winterblade
	{itemid = 34060, type = "deequip", slot = "hand", client_version = 1200}, -- winterblade
	{itemid = 34059, type = "equip", slot = "hand", client_version = 1200}, -- summerblade
	{itemid = 34059, type = "deequip", slot = "hand", client_version = 1200}, -- summerblade
	{itemid = 34058, type = "equip", slot = "shield", level = 180, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1200}, -- shoulder plate
	{itemid = 34058, type = "deequip", slot = "shield", level = 180, client_version = 1200}, -- shoulder plate
	{itemid = 34057, type = "equip", slot = "hand", client_version = 1200}, -- resizer
	{itemid = 34057, type = "deequip", slot = "hand", client_version = 1200}, -- resizer
	{itemid = 34056, type = "equip", slot = "armor", level = 180, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1200}, -- living armor
	{itemid = 34056, type = "deequip", slot = "armor", level = 180, client_version = 1200}, -- living armor
	{itemid = 34055, type = "equip", slot = "hand", client_version = 1200}, -- living vine bow
	{itemid = 34055, type = "deequip", slot = "hand", client_version = 1200}, -- living vine bow
	{itemid = 33925, type = "equip", slot = "hand", client_version = 1200}, -- golden axe
	{itemid = 33925, type = "deequip", slot = "hand", client_version = 1200}, -- golden axe
	{itemid = 33552, type = "equip", slot = "shield", client_version = 1180}, -- mathmaster shield (souvenir)
	{itemid = 33552, type = "deequip", slot = "shield", client_version = 1180}, -- mathmaster shield (souvenir)
	{itemid = 33318, type = "equip", slot = "backpack", client_version = 1180}, -- book backpack
	{itemid = 33318, type = "deequip", slot = "backpack", client_version = 1180}, -- book backpack
	{itemid = 33267, type = "equip", slot = "hand", client_version = 1180}, -- wand of destruction test
	{itemid = 33267, type = "deequip", slot = "hand", client_version = 1180}, -- wand of destruction test
	{itemid = 33266, type = "equip", slot = "hand", client_version = 1180}, -- umbral master bow test
	{itemid = 33266, type = "deequip", slot = "hand", client_version = 1180}, -- umbral master bow test
	{itemid = 33263, type = "equip", slot = "armor", client_version = 1180}, -- ornate testtplate
	{itemid = 33263, type = "deequip", slot = "armor", client_version = 1180}, -- ornate testtplate
	{itemid = 33254, type = "equip", slot = "hand", client_version = 1180}, -- sorcerer test weapon
	{itemid = 33254, type = "deequip", slot = "hand", client_version = 1180}, -- sorcerer test weapon
	{itemid = 33253, type = "equip", slot = "hand", client_version = 1180}, -- bow of destruction test
	{itemid = 33253, type = "deequip", slot = "hand", client_version = 1180}, -- bow of destruction test
	{itemid = 33252, type = "equip", slot = "hand", client_version = 1180}, -- test weapon for knights
	{itemid = 33252, type = "deequip", slot = "hand", client_version = 1180}, -- test weapon for knights
	{itemid = 32529, type = "equip", slot = "hand", client_version = 1180}, -- sulphurous demonbone
	{itemid = 32529, type = "deequip", slot = "hand", client_version = 1180}, -- sulphurous demonbone
	{itemid = 32528, type = "equip", slot = "hand", client_version = 1180}, -- unliving demonbone
	{itemid = 32528, type = "deequip", slot = "hand", client_version = 1180}, -- unliving demonbone
	{itemid = 32527, type = "equip", slot = "hand", client_version = 1180}, -- energized demonbone
	{itemid = 32527, type = "deequip", slot = "hand", client_version = 1180}, -- energized demonbone
	{itemid = 32526, type = "equip", slot = "hand", client_version = 1180}, -- rotten demonbone
	{itemid = 32526, type = "deequip", slot = "hand", client_version = 1180}, -- rotten demonbone
	{itemid = 32523, type = "equip", slot = "hand", level = 230, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1180}, -- deepling fork
	{itemid = 32523, type = "deequip", slot = "hand", level = 230, client_version = 1180}, -- deepling fork
	{itemid = 32522, type = "equip", slot = "hand", level = 180, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1180}, -- deepling ceremonial dagger
	{itemid = 32522, type = "deequip", slot = "hand", level = 180, client_version = 1180}, -- deepling ceremonial dagger
	{itemid = 32425, type = "equip", slot = "hand", client_version = 1180}, -- falcon mace
	{itemid = 32425, type = "deequip", slot = "hand", client_version = 1180}, -- falcon mace
	{itemid = 32424, type = "equip", slot = "hand", client_version = 1180}, -- falcon battleaxe
	{itemid = 32424, type = "deequip", slot = "hand", client_version = 1180}, -- falcon battleaxe
	{itemid = 32423, type = "equip", slot = "hand", client_version = 1180}, -- falcon longsword
	{itemid = 32423, type = "deequip", slot = "hand", client_version = 1180}, -- falcon longsword
	{itemid = 32422, type = "equip", slot = "shield", level = 300, vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 1180}, -- falcon escutcheon
	{itemid = 32422, type = "deequip", slot = "shield", level = 300, client_version = 1180}, -- falcon escutcheon
	{itemid = 32421, type = "equip", slot = "shield", level = 300, vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 1180}, -- falcon shield
	{itemid = 32421, type = "deequip", slot = "shield", level = 300, client_version = 1180}, -- falcon shield
	{itemid = 32420, type = "equip", slot = "legs", level = 300, vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 1180}, -- falcon greaves
	{itemid = 32420, type = "deequip", slot = "legs", level = 300, client_version = 1180}, -- falcon greaves
	{itemid = 32419, type = "equip", slot = "armor", level = 300, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1180}, -- falcon plate
	{itemid = 32419, type = "deequip", slot = "armor", level = 300, client_version = 1180}, -- falcon plate
	{itemid = 32418, type = "equip", slot = "hand", client_version = 1180}, -- falcon bow
	{itemid = 32418, type = "deequip", slot = "hand", client_version = 1180}, -- falcon bow
	{itemid = 32417, type = "equip", slot = "hand", level = 300, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 1180}, -- falcon wand
	{itemid = 32417, type = "deequip", slot = "hand", level = 300, client_version = 1180}, -- falcon wand
	{itemid = 32416, type = "equip", slot = "hand", level = 300, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 1180}, -- falcon rod
	{itemid = 32416, type = "deequip", slot = "hand", level = 300, client_version = 1180}, -- falcon rod
	{itemid = 32415, type = "equip", slot = "head", level = 300, vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 1180}, -- falcon coif
	{itemid = 32415, type = "deequip", slot = "head", level = 300, client_version = 1180}, -- falcon coif
	{itemid = 32414, type = "equip", slot = "head", level = 300, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1180}, -- falcon circlet
	{itemid = 32414, type = "deequip", slot = "head", level = 300, client_version = 1180}, -- falcon circlet
	{itemid = 32078, type = "equip", slot = "shield", client_version = 1180}, -- silver chimes
	{itemid = 32078, type = "deequip", slot = "shield", client_version = 1180}, -- silver chimes
	{itemid = 30888, type = "equip", slot = "necklace", client_version = 1150}, -- suspicious device
	{itemid = 30888, type = "deequip", slot = "necklace", client_version = 1150}, -- suspicious device
	{itemid = 30886, type = "equip", slot = "hand", client_version = 1150}, -- gnome sword
	{itemid = 30886, type = "deequip", slot = "hand", client_version = 1150}, -- gnome sword
	{itemid = 30885, type = "equip", slot = "shield", level = 200, vocation = {{"Knight", true}, {"Paladin", true, true}, {"Royal Paladin"}, {"Elite Knight"}}, client_version = 1150}, -- gnome shield
	{itemid = 30885, type = "deequip", slot = "shield", level = 200, client_version = 1150}, -- gnome shield
	{itemid = 30884, type = "equip", slot = "legs", level = 200, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1150}, -- gnome legs
	{itemid = 30884, type = "deequip", slot = "legs", level = 200, client_version = 1150}, -- gnome legs
	{itemid = 30883, type = "equip", slot = "armor", level = 200, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 1150}, -- gnome armor
	{itemid = 30883, type = "deequip", slot = "armor", level = 200, client_version = 1150}, -- gnome armor
	{itemid = 30882, type = "equip", slot = "head", level = 200, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1150}, -- gnome helmet
	{itemid = 30882, type = "deequip", slot = "head", level = 200, client_version = 1150}, -- gnome helmet
	{itemid = 30800, type = "equip", slot = "necklace", level = 100, client_version = 1150}, -- foxtail amulet
	{itemid = 30800, type = "deequip", slot = "necklace", level = 100, client_version = 1150}, -- foxtail amulet
	{itemid = 30760, type = "equip", slot = "hand", client_version = 1150}, -- mallet handle
	{itemid = 30760, type = "deequip", slot = "hand", client_version = 1150}, -- mallet handle
	{itemid = 30758, type = "equip", slot = "hand", client_version = 1150}, -- strange mallet
	{itemid = 30758, type = "deequip", slot = "hand", client_version = 1150}, -- strange mallet
	{itemid = 30757, type = "equip", slot = "head", client_version = 1150}, -- blue spectacles
	{itemid = 30757, type = "deequip", slot = "head", client_version = 1150}, -- blue spectacles
	{itemid = 30693, type = "equip", slot = "hand", level = 200, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 1150}, -- rod of destruction
	{itemid = 30693, type = "deequip", slot = "hand", level = 200, client_version = 1150}, -- rod of destruction
	{itemid = 30692, type = "equip", slot = "hand", level = 200, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 1150}, -- wand of destruction
	{itemid = 30692, type = "deequip", slot = "hand", level = 200, client_version = 1150}, -- wand of destruction
	{itemid = 30691, type = "equip", slot = "hand", client_version = 1150}, -- crossbow of destruction
	{itemid = 30691, type = "deequip", slot = "hand", client_version = 1150}, -- crossbow of destruction
	{itemid = 30690, type = "equip", slot = "hand", client_version = 1150}, -- bow of destruction
	{itemid = 30690, type = "deequip", slot = "hand", client_version = 1150}, -- bow of destruction
	{itemid = 30689, type = "equip", slot = "hand", client_version = 1150}, -- hammer of destruction
	{itemid = 30689, type = "deequip", slot = "hand", client_version = 1150}, -- hammer of destruction
	{itemid = 30688, type = "equip", slot = "hand", client_version = 1150}, -- mace of destruction
	{itemid = 30688, type = "deequip", slot = "hand", client_version = 1150}, -- mace of destruction
	{itemid = 30687, type = "equip", slot = "hand", client_version = 1150}, -- chopper of destruction
	{itemid = 30687, type = "deequip", slot = "hand", client_version = 1150}, -- chopper of destruction
	{itemid = 30686, type = "equip", slot = "hand", client_version = 1150}, -- axe of destruction
	{itemid = 30686, type = "deequip", slot = "hand", client_version = 1150}, -- axe of destruction
	{itemid = 30685, type = "equip", slot = "hand", client_version = 1150}, -- slayer of destruction
	{itemid = 30685, type = "deequip", slot = "hand", client_version = 1150}, -- slayer of destruction
	{itemid = 30684, type = "equip", slot = "hand", client_version = 1150}, -- blade of destruction
	{itemid = 30684, type = "deequip", slot = "hand", client_version = 1150}, -- blade of destruction
	{itemid = 30183, type = "equip", slot = "shield", client_version = 1148}, -- Journal Shield
	{itemid = 30183, type = "deequip", slot = "shield", client_version = 1148}, -- Journal Shield
	{itemid = 29426, type = "equip", slot = "head", client_version = 1140}, -- reflecting crown
	{itemid = 29426, type = "deequip", slot = "head", client_version = 1140}, -- reflecting crown
	{itemid = 29425, type = "equip", slot = "head", client_version = 1140}, -- incandescent crown
	{itemid = 29425, type = "deequip", slot = "head", client_version = 1140}, -- incandescent crown
	{itemid = 29424, type = "equip", slot = "head", client_version = 1140}, -- iron crown
	{itemid = 29424, type = "deequip", slot = "head", client_version = 1140}, -- iron crown
	{itemid = 29423, type = "equip", slot = "head", client_version = 1140}, -- leaf crown
	{itemid = 29423, type = "deequip", slot = "head", client_version = 1140}, -- leaf crown
	{itemid = 29297, type = "equip", slot = "hand", client_version = 1140}, -- ornate carving hammer
	{itemid = 29297, type = "deequip", slot = "hand", client_version = 1140}, -- ornate carving hammer
	{itemid = 29296, type = "equip", slot = "hand", client_version = 1140}, -- valuable carving hammer
	{itemid = 29296, type = "deequip", slot = "hand", client_version = 1140}, -- valuable carving hammer
	{itemid = 29295, type = "equip", slot = "hand", client_version = 1140}, -- plain carving hammer
	{itemid = 29295, type = "deequip", slot = "hand", client_version = 1140}, -- plain carving hammer
	{itemid = 29294, type = "equip", slot = "hand", client_version = 1140}, -- ornate carving mace
	{itemid = 29294, type = "deequip", slot = "hand", client_version = 1140}, -- ornate carving mace
	{itemid = 29293, type = "equip", slot = "hand", client_version = 1140}, -- valuable carving mace
	{itemid = 29293, type = "deequip", slot = "hand", client_version = 1140}, -- valuable carving mace
	{itemid = 29292, type = "equip", slot = "hand", client_version = 1140}, -- plain carving mace
	{itemid = 29292, type = "deequip", slot = "hand", client_version = 1140}, -- plain carving mace
	{itemid = 29291, type = "equip", slot = "hand", client_version = 1140}, -- ornate carving chopper
	{itemid = 29291, type = "deequip", slot = "hand", client_version = 1140}, -- ornate carving chopper
	{itemid = 29290, type = "equip", slot = "hand", client_version = 1140}, -- valuable carving chopper
	{itemid = 29290, type = "deequip", slot = "hand", client_version = 1140}, -- valuable carving chopper
	{itemid = 29289, type = "equip", slot = "hand", client_version = 1140}, -- plain carving chopper
	{itemid = 29289, type = "deequip", slot = "hand", client_version = 1140}, -- plain carving chopper
	{itemid = 29288, type = "equip", slot = "hand", client_version = 1140}, -- ornate carving axe
	{itemid = 29288, type = "deequip", slot = "hand", client_version = 1140}, -- ornate carving axe
	{itemid = 29287, type = "equip", slot = "hand", client_version = 1140}, -- valuable carving axe
	{itemid = 29287, type = "deequip", slot = "hand", client_version = 1140}, -- valuable carving axe
	{itemid = 29286, type = "equip", slot = "hand", client_version = 1140}, -- plain carving axe
	{itemid = 29286, type = "deequip", slot = "hand", client_version = 1140}, -- plain carving axe
	{itemid = 29285, type = "equip", slot = "hand", client_version = 1140}, -- ornate carving slayer
	{itemid = 29285, type = "deequip", slot = "hand", client_version = 1140}, -- ornate carving slayer
	{itemid = 29284, type = "equip", slot = "hand", client_version = 1140}, -- valuable carving slayer
	{itemid = 29284, type = "deequip", slot = "hand", client_version = 1140}, -- valuable carving slayer
	{itemid = 29283, type = "equip", slot = "hand", client_version = 1140}, -- plain carving slayer
	{itemid = 29283, type = "deequip", slot = "hand", client_version = 1140}, -- plain carving slayer
	{itemid = 29282, type = "equip", slot = "hand", client_version = 1140}, -- ornate carving blade
	{itemid = 29282, type = "deequip", slot = "hand", client_version = 1140}, -- ornate carving blade
	{itemid = 29281, type = "equip", slot = "hand", client_version = 1140}, -- valuable carving blade
	{itemid = 29281, type = "deequip", slot = "hand", client_version = 1140}, -- valuable carving blade
	{itemid = 29280, type = "equip", slot = "hand", client_version = 1140}, -- plain carving blade
	{itemid = 29280, type = "deequip", slot = "hand", client_version = 1140}, -- plain carving blade
	{itemid = 29267, type = "equip", slot = "hand", client_version = 1140}, -- ornate remedy hammer
	{itemid = 29267, type = "deequip", slot = "hand", client_version = 1140}, -- ornate remedy hammer
	{itemid = 29266, type = "equip", slot = "hand", client_version = 1140}, -- valuable remedy hammer
	{itemid = 29266, type = "deequip", slot = "hand", client_version = 1140}, -- valuable remedy hammer
	{itemid = 29265, type = "equip", slot = "hand", client_version = 1140}, -- plain remedy hammer
	{itemid = 29265, type = "deequip", slot = "hand", client_version = 1140}, -- plain remedy hammer
	{itemid = 29264, type = "equip", slot = "hand", client_version = 1140}, -- ornate remedy mace
	{itemid = 29264, type = "deequip", slot = "hand", client_version = 1140}, -- ornate remedy mace
	{itemid = 29263, type = "equip", slot = "hand", client_version = 1140}, -- valuable remedy mace
	{itemid = 29263, type = "deequip", slot = "hand", client_version = 1140}, -- valuable remedy mace
	{itemid = 29262, type = "equip", slot = "hand", client_version = 1140}, -- plain remedy mace
	{itemid = 29262, type = "deequip", slot = "hand", client_version = 1140}, -- plain remedy mace
	{itemid = 29261, type = "equip", slot = "hand", client_version = 1140}, -- ornate remedy chopper
	{itemid = 29261, type = "deequip", slot = "hand", client_version = 1140}, -- ornate remedy chopper
	{itemid = 29260, type = "equip", slot = "hand", client_version = 1140}, -- valuable remedy chopper
	{itemid = 29260, type = "deequip", slot = "hand", client_version = 1140}, -- valuable remedy chopper
	{itemid = 29259, type = "equip", slot = "hand", client_version = 1140}, -- plain remedy chopper
	{itemid = 29259, type = "deequip", slot = "hand", client_version = 1140}, -- plain remedy chopper
	{itemid = 29258, type = "equip", slot = "hand", client_version = 1140}, -- ornate remedy axe
	{itemid = 29258, type = "deequip", slot = "hand", client_version = 1140}, -- ornate remedy axe
	{itemid = 29257, type = "equip", slot = "hand", client_version = 1140}, -- valuable remedy axe
	{itemid = 29257, type = "deequip", slot = "hand", client_version = 1140}, -- valuable remedy axe
	{itemid = 29256, type = "equip", slot = "hand", client_version = 1140}, -- plain remedy axe
	{itemid = 29256, type = "deequip", slot = "hand", client_version = 1140}, -- plain remedy axe
	{itemid = 29255, type = "equip", slot = "hand", client_version = 1140}, -- ornate remedy slayer
	{itemid = 29255, type = "deequip", slot = "hand", client_version = 1140}, -- ornate remedy slayer
	{itemid = 29254, type = "equip", slot = "hand", client_version = 1140}, -- valuable remedy slayer
	{itemid = 29254, type = "deequip", slot = "hand", client_version = 1140}, -- valuable remedy slayer
	{itemid = 29253, type = "equip", slot = "hand", client_version = 1140}, -- plain remedy slayer
	{itemid = 29253, type = "deequip", slot = "hand", client_version = 1140}, -- plain remedy slayer
	{itemid = 29252, type = "equip", slot = "hand", client_version = 1140}, -- ornate remedy blade
	{itemid = 29252, type = "deequip", slot = "hand", client_version = 1140}, -- ornate remedy blade
	{itemid = 29251, type = "equip", slot = "hand", client_version = 1140}, -- valuable remedy blade
	{itemid = 29251, type = "deequip", slot = "hand", client_version = 1140}, -- valuable remedy blade
	{itemid = 29250, type = "equip", slot = "hand", client_version = 1140}, -- plain remedy blade
	{itemid = 29250, type = "deequip", slot = "hand", client_version = 1140}, -- plain remedy blade
	{itemid = 29236, type = "equip", slot = "hand", client_version = 1140}, -- ornate mayhem hammer
	{itemid = 29236, type = "deequip", slot = "hand", client_version = 1140}, -- ornate mayhem hammer
	{itemid = 29235, type = "equip", slot = "hand", client_version = 1140}, -- valuable mayhem hammer
	{itemid = 29235, type = "deequip", slot = "hand", client_version = 1140}, -- valuable mayhem hammer
	{itemid = 29234, type = "equip", slot = "hand", client_version = 1140}, -- plain mayhem hammer
	{itemid = 29234, type = "deequip", slot = "hand", client_version = 1140}, -- plain mayhem hammer
	{itemid = 29233, type = "equip", slot = "hand", client_version = 1140}, -- ornate mayhem mace
	{itemid = 29233, type = "deequip", slot = "hand", client_version = 1140}, -- ornate mayhem mace
	{itemid = 29232, type = "equip", slot = "hand", client_version = 1140}, -- valuable mayhem mace
	{itemid = 29232, type = "deequip", slot = "hand", client_version = 1140}, -- valuable mayhem mace
	{itemid = 29231, type = "equip", slot = "hand", client_version = 1140}, -- plain mayhem mace
	{itemid = 29231, type = "deequip", slot = "hand", client_version = 1140}, -- plain mayhem mace
	{itemid = 29230, type = "equip", slot = "hand", client_version = 1140}, -- ornate mayhem chopper
	{itemid = 29230, type = "deequip", slot = "hand", client_version = 1140}, -- ornate mayhem chopper
	{itemid = 29229, type = "equip", slot = "hand", client_version = 1140}, -- valuable mayhem chopper
	{itemid = 29229, type = "deequip", slot = "hand", client_version = 1140}, -- valuable mayhem chopper
	{itemid = 29228, type = "equip", slot = "hand", client_version = 1140}, -- plain mayhem chopper
	{itemid = 29228, type = "deequip", slot = "hand", client_version = 1140}, -- plain mayhem chopper
	{itemid = 29227, type = "equip", slot = "hand", client_version = 1140}, -- ornate mayhem axe
	{itemid = 29227, type = "deequip", slot = "hand", client_version = 1140}, -- ornate mayhem axe
	{itemid = 29226, type = "equip", slot = "hand", client_version = 1140}, -- valuable mayhem axe
	{itemid = 29226, type = "deequip", slot = "hand", client_version = 1140}, -- valuable mayhem axe
	{itemid = 29225, type = "equip", slot = "hand", client_version = 1140}, -- plain mayhem axe
	{itemid = 29225, type = "deequip", slot = "hand", client_version = 1140}, -- plain mayhem axe
	{itemid = 29224, type = "equip", slot = "hand", client_version = 1140}, -- ornate mayhem slayer
	{itemid = 29224, type = "deequip", slot = "hand", client_version = 1140}, -- ornate mayhem slayer
	{itemid = 29223, type = "equip", slot = "hand", client_version = 1140}, -- valuable mayhem slayer
	{itemid = 29223, type = "deequip", slot = "hand", client_version = 1140}, -- valuable mayhem slayer
	{itemid = 29222, type = "equip", slot = "hand", client_version = 1140}, -- plain mayhem slayer
	{itemid = 29222, type = "deequip", slot = "hand", client_version = 1140}, -- plain mayhem slayer
	{itemid = 29221, type = "equip", slot = "hand", client_version = 1140}, -- ornate mayhem blade
	{itemid = 29221, type = "deequip", slot = "hand", client_version = 1140}, -- ornate mayhem blade
	{itemid = 29220, type = "equip", slot = "hand", client_version = 1140}, -- valuable mayhem blade
	{itemid = 29220, type = "deequip", slot = "hand", client_version = 1140}, -- valuable mayhem blade
	{itemid = 29219, type = "equip", slot = "hand", client_version = 1140}, -- plain mayhem blade
	{itemid = 29219, type = "deequip", slot = "hand", client_version = 1140}, -- plain mayhem blade
	{itemid = 29218, type = "equip", slot = "shield", client_version = 1140}, -- mathmaster shield (souvenir)
	{itemid = 29218, type = "deequip", slot = "shield", client_version = 1140}, -- mathmaster shield (souvenir)
	{itemid = 29210, type = "equip", slot = "hand", client_version = 1140}, -- energy war hammer replica
	{itemid = 29210, type = "deequip", slot = "hand", client_version = 1140}, -- energy war hammer replica
	{itemid = 29209, type = "equip", slot = "hand", client_version = 1140}, -- energy orcish maul replica
	{itemid = 29209, type = "deequip", slot = "hand", client_version = 1140}, -- energy orcish maul replica
	{itemid = 29208, type = "equip", slot = "hand", client_version = 1140}, -- energy basher replica
	{itemid = 29208, type = "deequip", slot = "hand", client_version = 1140}, -- energy basher replica
	{itemid = 29207, type = "equip", slot = "hand", client_version = 1140}, -- energy crystal mace replica
	{itemid = 29207, type = "deequip", slot = "hand", client_version = 1140}, -- energy crystal mace replica
	{itemid = 29206, type = "equip", slot = "hand", client_version = 1140}, -- energy clerical mace replica
	{itemid = 29206, type = "deequip", slot = "hand", client_version = 1140}, -- energy clerical mace replica
	{itemid = 29205, type = "equip", slot = "hand", client_version = 1140}, -- energy war axe replica
	{itemid = 29205, type = "deequip", slot = "hand", client_version = 1140}, -- energy war axe replica
	{itemid = 29204, type = "equip", slot = "hand", client_version = 1140}, -- energy headchopper replica
	{itemid = 29204, type = "deequip", slot = "hand", client_version = 1140}, -- energy headchopper replica
	{itemid = 29203, type = "equip", slot = "hand", client_version = 1140}, -- energy heroic axe replica
	{itemid = 29203, type = "deequip", slot = "hand", client_version = 1140}, -- energy heroic axe replica
	{itemid = 29202, type = "equip", slot = "hand", client_version = 1140}, -- energy knight axe replica
	{itemid = 29202, type = "deequip", slot = "hand", client_version = 1140}, -- energy knight axe replica
	{itemid = 29201, type = "equip", slot = "hand", client_version = 1140}, -- energy barbarian axe replica
	{itemid = 29201, type = "deequip", slot = "hand", client_version = 1140}, -- energy barbarian axe replica
	{itemid = 29200, type = "equip", slot = "hand", client_version = 1140}, -- energy dragon slayer replica
	{itemid = 29200, type = "deequip", slot = "hand", client_version = 1140}, -- energy dragon slayer replica
	{itemid = 29199, type = "equip", slot = "hand", client_version = 1140}, -- energy blacksteel replica
	{itemid = 29199, type = "deequip", slot = "hand", client_version = 1140}, -- energy blacksteel replica
	{itemid = 29198, type = "equip", slot = "hand", client_version = 1140}, -- energy mystic blade replica
	{itemid = 29198, type = "deequip", slot = "hand", client_version = 1140}, -- energy mystic blade replica
	{itemid = 29197, type = "equip", slot = "hand", client_version = 1140}, -- energy relic sword replica
	{itemid = 29197, type = "deequip", slot = "hand", client_version = 1140}, -- energy relic sword replica
	{itemid = 29196, type = "equip", slot = "hand", client_version = 1140}, -- energy spike sword replica
	{itemid = 29196, type = "deequip", slot = "hand", client_version = 1140}, -- energy spike sword replica
	{itemid = 29195, type = "equip", slot = "hand", client_version = 1140}, -- earth war hammer replica
	{itemid = 29195, type = "deequip", slot = "hand", client_version = 1140}, -- earth war hammer replica
	{itemid = 29194, type = "equip", slot = "hand", client_version = 1140}, -- earth orcish maul replica
	{itemid = 29194, type = "deequip", slot = "hand", client_version = 1140}, -- earth orcish maul replica
	{itemid = 29193, type = "equip", slot = "hand", client_version = 1140}, -- earth basher replica
	{itemid = 29193, type = "deequip", slot = "hand", client_version = 1140}, -- earth basher replica
	{itemid = 29192, type = "equip", slot = "hand", client_version = 1140}, -- earth crystal mace replica
	{itemid = 29192, type = "deequip", slot = "hand", client_version = 1140}, -- earth crystal mace replica
	{itemid = 29191, type = "equip", slot = "hand", client_version = 1140}, -- earth clerical mace replica
	{itemid = 29191, type = "deequip", slot = "hand", client_version = 1140}, -- earth clerical mace replica
	{itemid = 29190, type = "equip", slot = "hand", client_version = 1140}, -- earth war axe replica
	{itemid = 29190, type = "deequip", slot = "hand", client_version = 1140}, -- earth war axe replica
	{itemid = 29189, type = "equip", slot = "hand", client_version = 1140}, -- earth headchopper replica
	{itemid = 29189, type = "deequip", slot = "hand", client_version = 1140}, -- earth headchopper replica
	{itemid = 29188, type = "equip", slot = "hand", client_version = 1140}, -- earth heroic axe replica
	{itemid = 29188, type = "deequip", slot = "hand", client_version = 1140}, -- earth heroic axe replica
	{itemid = 29187, type = "equip", slot = "hand", client_version = 1140}, -- earth knight axe replica
	{itemid = 29187, type = "deequip", slot = "hand", client_version = 1140}, -- earth knight axe replica
	{itemid = 29186, type = "equip", slot = "hand", client_version = 1140}, -- earth barbarian axe replica
	{itemid = 29186, type = "deequip", slot = "hand", client_version = 1140}, -- earth barbarian axe replica
	{itemid = 29185, type = "equip", slot = "hand", client_version = 1140}, -- earth dragon slayer replica
	{itemid = 29185, type = "deequip", slot = "hand", client_version = 1140}, -- earth dragon slayer replica
	{itemid = 29184, type = "equip", slot = "hand", client_version = 1140}, -- earth blacksteel replica
	{itemid = 29184, type = "deequip", slot = "hand", client_version = 1140}, -- earth blacksteel replica
	{itemid = 29183, type = "equip", slot = "hand", client_version = 1140}, -- earth mystic blade replica
	{itemid = 29183, type = "deequip", slot = "hand", client_version = 1140}, -- earth mystic blade replica
	{itemid = 29182, type = "equip", slot = "hand", client_version = 1140}, -- earth relic sword replica
	{itemid = 29182, type = "deequip", slot = "hand", client_version = 1140}, -- earth relic sword replica
	{itemid = 29181, type = "equip", slot = "hand", client_version = 1140}, -- earth spike sword replica
	{itemid = 29181, type = "deequip", slot = "hand", client_version = 1140}, -- earth spike sword replica
	{itemid = 29180, type = "equip", slot = "hand", client_version = 1140}, -- icy war hammer replica
	{itemid = 29180, type = "deequip", slot = "hand", client_version = 1140}, -- icy war hammer replica
	{itemid = 29179, type = "equip", slot = "hand", client_version = 1140}, -- icy orcish maul replica
	{itemid = 29179, type = "deequip", slot = "hand", client_version = 1140}, -- icy orcish maul replica
	{itemid = 29178, type = "equip", slot = "hand", client_version = 1140}, -- icy basher replica
	{itemid = 29178, type = "deequip", slot = "hand", client_version = 1140}, -- icy basher replica
	{itemid = 29177, type = "equip", slot = "hand", client_version = 1140}, -- icy crystal mace replica
	{itemid = 29177, type = "deequip", slot = "hand", client_version = 1140}, -- icy crystal mace replica
	{itemid = 29176, type = "equip", slot = "hand", client_version = 1140}, -- icy clerical mace replica
	{itemid = 29176, type = "deequip", slot = "hand", client_version = 1140}, -- icy clerical mace replica
	{itemid = 29175, type = "equip", slot = "hand", client_version = 1140}, -- icy war axe replica
	{itemid = 29175, type = "deequip", slot = "hand", client_version = 1140}, -- icy war axe replica
	{itemid = 29174, type = "equip", slot = "hand", client_version = 1140}, -- icy headchopper replica
	{itemid = 29174, type = "deequip", slot = "hand", client_version = 1140}, -- icy headchopper replica
	{itemid = 29173, type = "equip", slot = "hand", client_version = 1140}, -- icy heroic axe replica
	{itemid = 29173, type = "deequip", slot = "hand", client_version = 1140}, -- icy heroic axe replica
	{itemid = 29172, type = "equip", slot = "hand", client_version = 1140}, -- icy knight axe replica
	{itemid = 29172, type = "deequip", slot = "hand", client_version = 1140}, -- icy knight axe replica
	{itemid = 29171, type = "equip", slot = "hand", client_version = 1140}, -- icy barbarian axe replica
	{itemid = 29171, type = "deequip", slot = "hand", client_version = 1140}, -- icy barbarian axe replica
	{itemid = 29170, type = "equip", slot = "hand", client_version = 1140}, -- icy dragon slayer replica
	{itemid = 29170, type = "deequip", slot = "hand", client_version = 1140}, -- icy dragon slayer replica
	{itemid = 29169, type = "equip", slot = "hand", client_version = 1140}, -- icy blacksteel replica
	{itemid = 29169, type = "deequip", slot = "hand", client_version = 1140}, -- icy blacksteel replica
	{itemid = 29168, type = "equip", slot = "hand", client_version = 1140}, -- icy mystic blade replica
	{itemid = 29168, type = "deequip", slot = "hand", client_version = 1140}, -- icy mystic blade replica
	{itemid = 29167, type = "equip", slot = "hand", client_version = 1140}, -- icy relic sword replica
	{itemid = 29167, type = "deequip", slot = "hand", client_version = 1140}, -- icy relic sword replica
	{itemid = 29166, type = "equip", slot = "hand", client_version = 1140}, -- icy spike sword replica
	{itemid = 29166, type = "deequip", slot = "hand", client_version = 1140}, -- icy spike sword replica
	{itemid = 29165, type = "equip", slot = "hand", client_version = 1140}, -- fiery war hammer replica
	{itemid = 29165, type = "deequip", slot = "hand", client_version = 1140}, -- fiery war hammer replica
	{itemid = 29164, type = "equip", slot = "hand", client_version = 1140}, -- fiery orcish maul replica
	{itemid = 29164, type = "deequip", slot = "hand", client_version = 1140}, -- fiery orcish maul replica
	{itemid = 29163, type = "equip", slot = "hand", client_version = 1140}, -- fiery basher replica
	{itemid = 29163, type = "deequip", slot = "hand", client_version = 1140}, -- fiery basher replica
	{itemid = 29162, type = "equip", slot = "hand", client_version = 1140}, -- fiery crystal mace replica
	{itemid = 29162, type = "deequip", slot = "hand", client_version = 1140}, -- fiery crystal mace replica
	{itemid = 29161, type = "equip", slot = "hand", client_version = 1140}, -- fiery clerical mace replica
	{itemid = 29161, type = "deequip", slot = "hand", client_version = 1140}, -- fiery clerical mace replica
	{itemid = 29160, type = "equip", slot = "hand", client_version = 1140}, -- fiery war axe replica
	{itemid = 29160, type = "deequip", slot = "hand", client_version = 1140}, -- fiery war axe replica
	{itemid = 29159, type = "equip", slot = "hand", client_version = 1140}, -- fiery headchopper replica
	{itemid = 29159, type = "deequip", slot = "hand", client_version = 1140}, -- fiery headchopper replica
	{itemid = 29158, type = "equip", slot = "hand", client_version = 1140}, -- fiery heroic axe replica
	{itemid = 29158, type = "deequip", slot = "hand", client_version = 1140}, -- fiery heroic axe replica
	{itemid = 29157, type = "equip", slot = "hand", client_version = 1140}, -- fiery knight axe replica
	{itemid = 29157, type = "deequip", slot = "hand", client_version = 1140}, -- fiery knight axe replica
	{itemid = 29156, type = "equip", slot = "hand", client_version = 1140}, -- fiery barbarian axe replica
	{itemid = 29156, type = "deequip", slot = "hand", client_version = 1140}, -- fiery barbarian axe replica
	{itemid = 29155, type = "equip", slot = "hand", client_version = 1140}, -- fiery dragon slayer replica
	{itemid = 29155, type = "deequip", slot = "hand", client_version = 1140}, -- fiery dragon slayer replica
	{itemid = 29154, type = "equip", slot = "hand", client_version = 1140}, -- fiery blacksteel replica
	{itemid = 29154, type = "deequip", slot = "hand", client_version = 1140}, -- fiery blacksteel replica
	{itemid = 29153, type = "equip", slot = "hand", client_version = 1140}, -- fiery mystic blade replica
	{itemid = 29153, type = "deequip", slot = "hand", client_version = 1140}, -- fiery mystic blade replica
	{itemid = 29152, type = "equip", slot = "hand", client_version = 1140}, -- fiery relic sword replica
	{itemid = 29152, type = "deequip", slot = "hand", client_version = 1140}, -- fiery relic sword replica
	{itemid = 29151, type = "equip", slot = "hand", client_version = 1140}, -- fiery spike sword replica
	{itemid = 29151, type = "deequip", slot = "hand", client_version = 1140}, -- fiery spike sword replica
	{itemid = 29080, type = "equip", slot = "backpack", client_version = 1140}, -- blossom bag
	{itemid = 29080, type = "deequip", slot = "backpack", client_version = 1140}, -- blossom bag
	{itemid = 29079, type = "equip", slot = "armor", level = 60, client_version = 1140}, -- swan feather cloak
	{itemid = 29079, type = "deequip", slot = "armor", level = 60, client_version = 1140}, -- swan feather cloak
	{itemid = 29060, type = "equip", slot = "hand", level = 41, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 1140}, -- wand of darkness
	{itemid = 29060, type = "deequip", slot = "hand", level = 41, client_version = 1140}, -- wand of darkness
	{itemid = 29059, type = "equip", slot = "hand", client_version = 1140}, -- royal star
	{itemid = 29059, type = "deequip", slot = "hand", client_version = 1140}, -- royal star
	{itemid = 29058, type = "equip", slot = "ammo", client_version = 1140}, -- spectral bolt
	{itemid = 29058, type = "deequip", slot = "ammo", client_version = 1140}, -- spectral bolt
	{itemid = 29036, type = "equip", slot = "hand", client_version = 1140}, -- leaf star
	{itemid = 29036, type = "deequip", slot = "hand", client_version = 1140}, -- leaf star
	{itemid = 29005, type = "equip", slot = "hand", level = 80, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1140}, -- dream blossom staff
	{itemid = 29005, type = "deequip", slot = "hand", level = 80, client_version = 1140}, -- dream blossom staff
	{itemid = 29004, type = "equip", slot = "shield", level = 80, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1140}, -- wooden spellbook
	{itemid = 29004, type = "deequip", slot = "shield", level = 80, client_version = 1140}, -- wooden spellbook
	{itemid = 29003, type = "equip", slot = "ring", level = 50, client_version = 1140}, -- butterfly ring
	{itemid = 29003, type = "deequip", slot = "ring", level = 50, client_version = 1140}, -- butterfly ring
	{itemid = 28658, type = "equip", slot = "necklace", client_version = 1140}, -- glowing rubbish amulet
	{itemid = 28658, type = "deequip", slot = "necklace", client_version = 1140}, -- glowing rubbish amulet
	{itemid = 28657, type = "equip", slot = "necklace", client_version = 1140}, -- rubbish amulet
	{itemid = 28657, type = "deequip", slot = "necklace", client_version = 1140}, -- rubbish amulet
	{itemid = 27756, type = "equip", slot = "head", client_version = 1102}, -- porcelain mask
	{itemid = 27756, type = "deequip", slot = "head", client_version = 1102}, -- porcelain mask
	{itemid = 27077, type = "equip", slot = "feet", client_version = 1102}, -- filthy bunnyslippers
	{itemid = 27077, type = "deequip", slot = "feet", client_version = 1102}, -- filthy bunnyslippers
	{itemid = 27073, type = "equip", slot = "head", client_version = 1102}, -- rusty winged helmet
	{itemid = 27073, type = "deequip", slot = "head", client_version = 1102}, -- rusty winged helmet
	{itemid = 27072, type = "equip", slot = "legs", client_version = 1102}, -- tatty Dragon scale legs
	{itemid = 27072, type = "deequip", slot = "legs", client_version = 1102}, -- tatty Dragon scale legs
	{itemid = 27070, type = "equip", slot = "legs", client_version = 1102}, -- chocolatey dragon scale legs
	{itemid = 27070, type = "deequip", slot = "legs", client_version = 1102}, -- chocolatey dragon scale legs
	{itemid = 27065, type = "equip", slot = "head", client_version = 1102}, -- Ferumbras' Candy Hat
	{itemid = 27065, type = "deequip", slot = "head", client_version = 1102}, -- Ferumbras' Candy Hat
	{itemid = 27063, type = "equip", slot = "backpack", client_version = 1102}, -- birthday backpack
	{itemid = 27063, type = "deequip", slot = "backpack", client_version = 1102}, -- birthday backpack
	{itemid = 27061, type = "equip", slot = "backpack", client_version = 1102}, -- pillow backpack
	{itemid = 27061, type = "deequip", slot = "backpack", client_version = 1102}, -- pillow backpack
	{itemid = 26200, type = "equip", slot = "necklace", level = 150, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1094}, -- collar of red plasma
	{itemid = 26200, type = "deequip", slot = "necklace", level = 150, client_version = 1094}, -- collar of red plasma
	{itemid = 26199, type = "equip", slot = "necklace", level = 150, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1094}, -- collar of green plasma
	{itemid = 26199, type = "deequip", slot = "necklace", level = 150, client_version = 1094}, -- collar of green plasma
	{itemid = 26198, type = "equip", slot = "necklace", level = 150, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 1094}, -- collar of blue plasma
	{itemid = 26198, type = "deequip", slot = "necklace", level = 150, client_version = 1094}, -- collar of blue plasma
	{itemid = 26190, type = "equip", slot = "ring", level = 100, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1094}, -- ring of red plasma
	{itemid = 26190, type = "deequip", slot = "ring", level = 100, client_version = 1094}, -- ring of red plasma
	{itemid = 26189, type = "equip", slot = "ring", level = 100, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1094}, -- ring of red plasma
	{itemid = 26189, type = "deequip", slot = "ring", level = 100, client_version = 1094}, -- ring of red plasma
	{itemid = 26188, type = "equip", slot = "ring", level = 100, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1094}, -- ring of green plasma
	{itemid = 26188, type = "deequip", slot = "ring", level = 100, client_version = 1094}, -- ring of green plasma
	{itemid = 26187, type = "equip", slot = "ring", level = 100, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1094}, -- ring of green plasma
	{itemid = 26187, type = "deequip", slot = "ring", level = 100, client_version = 1094}, -- ring of green plasma
	{itemid = 26186, type = "equip", slot = "ring", level = 100, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 1094}, -- ring of blue plasma
	{itemid = 26186, type = "deequip", slot = "ring", level = 100, client_version = 1094}, -- ring of blue plasma
	{itemid = 26185, type = "equip", slot = "ring", level = 100, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 1094}, -- ring of blue plasma
	{itemid = 26185, type = "deequip", slot = "ring", level = 100, client_version = 1094}, -- ring of blue plasma
	{itemid = 26184, type = "equip", slot = "necklace", level = 150, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1094}, -- collar of red plasma
	{itemid = 26184, type = "deequip", slot = "necklace", level = 150, client_version = 1094}, -- collar of red plasma
	{itemid = 26183, type = "equip", slot = "necklace", level = 150, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1094}, -- collar of green plasma
	{itemid = 26183, type = "deequip", slot = "necklace", level = 150, client_version = 1094}, -- collar of green plasma
	{itemid = 26182, type = "equip", slot = "necklace", level = 150, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 1094}, -- collar of blue plasma
	{itemid = 26182, type = "deequip", slot = "necklace", level = 150, client_version = 1094}, -- collar of blue plasma
	{itemid = 26181, type = "equip", slot = "backpack", client_version = 1094}, -- energetic backpack
	{itemid = 26181, type = "deequip", slot = "backpack", client_version = 1094}, -- energetic backpack
	{itemid = 26133, type = "equip", slot = "feet", level = 150, client_version = 1094}, -- void boots
	{itemid = 26133, type = "deequip", slot = "feet", level = 150, client_version = 1094}, -- void boots
	{itemid = 26132, type = "equip", slot = "feet", level = 150, client_version = 1094}, -- void boots
	{itemid = 26132, type = "deequip", slot = "feet", level = 150, client_version = 1094}, -- void boots
	{itemid = 26131, type = "equip", slot = "head", level = 100, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1094}, -- tiara of power
	{itemid = 26131, type = "deequip", slot = "head", level = 100, client_version = 1094}, -- tiara of power
	{itemid = 26130, type = "equip", slot = "head", level = 100, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1094}, -- tiara of power
	{itemid = 26130, type = "deequip", slot = "head", level = 100, client_version = 1094}, -- tiara of power
	{itemid = 25995, type = "equip", slot = "hand", level = 100, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 1094}, -- rod of carving
	{itemid = 25995, type = "deequip", slot = "hand", level = 100, client_version = 1094}, -- rod of carving
	{itemid = 25991, type = "equip", slot = "hand", level = 100, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 1094}, -- wand of carving
	{itemid = 25991, type = "deequip", slot = "hand", level = 100, client_version = 1094}, -- wand of carving
	{itemid = 25987, type = "equip", slot = "hand", client_version = 1094}, -- crossbow of carving
	{itemid = 25987, type = "deequip", slot = "hand", client_version = 1094}, -- crossbow of carving
	{itemid = 25983, type = "equip", slot = "hand", client_version = 1094}, -- bow of carving
	{itemid = 25983, type = "deequip", slot = "hand", client_version = 1094}, -- bow of carving
	{itemid = 25979, type = "equip", slot = "hand", client_version = 1094}, -- hammer of carving
	{itemid = 25979, type = "deequip", slot = "hand", client_version = 1094}, -- hammer of carving
	{itemid = 25975, type = "equip", slot = "hand", client_version = 1094}, -- mace of carving
	{itemid = 25975, type = "deequip", slot = "hand", client_version = 1094}, -- mace of carving
	{itemid = 25971, type = "equip", slot = "hand", client_version = 1094}, -- chopper of carving
	{itemid = 25971, type = "deequip", slot = "hand", client_version = 1094}, -- chopper of carving
	{itemid = 25967, type = "equip", slot = "hand", client_version = 1094}, -- axe of carving
	{itemid = 25967, type = "deequip", slot = "hand", client_version = 1094}, -- axe of carving
	{itemid = 25963, type = "equip", slot = "hand", client_version = 1094}, -- slayer of carving
	{itemid = 25963, type = "deequip", slot = "hand", client_version = 1094}, -- slayer of carving
	{itemid = 25959, type = "equip", slot = "hand", client_version = 1094}, -- blade of carving
	{itemid = 25959, type = "deequip", slot = "hand", client_version = 1094}, -- blade of carving
	{itemid = 25955, type = "equip", slot = "hand", level = 100, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 1094}, -- rod of remedy
	{itemid = 25955, type = "deequip", slot = "hand", level = 100, client_version = 1094}, -- rod of remedy
	{itemid = 25951, type = "equip", slot = "hand", level = 100, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 1094}, -- wand of remedy
	{itemid = 25951, type = "deequip", slot = "hand", level = 100, client_version = 1094}, -- wand of remedy
	{itemid = 25947, type = "equip", slot = "hand", client_version = 1094}, -- crossbow of remedy
	{itemid = 25947, type = "deequip", slot = "hand", client_version = 1094}, -- crossbow of remedy
	{itemid = 25943, type = "equip", slot = "hand", client_version = 1094}, -- bow of remedy
	{itemid = 25943, type = "deequip", slot = "hand", client_version = 1094}, -- bow of remedy
	{itemid = 25935, type = "equip", slot = "hand", client_version = 1094}, -- mace of remedy
	{itemid = 25935, type = "deequip", slot = "hand", client_version = 1094}, -- mace of remedy
	{itemid = 25931, type = "equip", slot = "hand", client_version = 1094}, -- chopper of remedy
	{itemid = 25931, type = "deequip", slot = "hand", client_version = 1094}, -- chopper of remedy
	{itemid = 25927, type = "equip", slot = "hand", client_version = 1094}, -- axe of remedy
	{itemid = 25927, type = "deequip", slot = "hand", client_version = 1094}, -- axe of remedy
	{itemid = 25923, type = "equip", slot = "hand", client_version = 1094}, -- slayer of remedy
	{itemid = 25923, type = "deequip", slot = "hand", client_version = 1094}, -- slayer of remedy
	{itemid = 25919, type = "equip", slot = "hand", client_version = 1094}, -- blade of remedy
	{itemid = 25919, type = "deequip", slot = "hand", client_version = 1094}, -- blade of remedy
	{itemid = 25888, type = "equip", slot = "hand", level = 100, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 1094}, -- rod of mayhem
	{itemid = 25888, type = "deequip", slot = "hand", level = 100, client_version = 1094}, -- rod of mayhem
	{itemid = 25887, type = "equip", slot = "hand", level = 100, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 1094}, -- wand of mayhem
	{itemid = 25887, type = "deequip", slot = "hand", level = 100, client_version = 1094}, -- wand of mayhem
	{itemid = 25886, type = "equip", slot = "hand", client_version = 1094}, -- crossbow of mayhem
	{itemid = 25886, type = "deequip", slot = "hand", client_version = 1094}, -- crossbow of mayhem
	{itemid = 25885, type = "equip", slot = "hand", client_version = 1094}, -- bow of mayhem
	{itemid = 25885, type = "deequip", slot = "hand", client_version = 1094}, -- bow of mayhem
	{itemid = 25884, type = "equip", slot = "hand", client_version = 1094}, -- hammer of mayhem
	{itemid = 25884, type = "deequip", slot = "hand", client_version = 1094}, -- hammer of mayhem
	{itemid = 25883, type = "equip", slot = "hand", client_version = 1094}, -- mace of mayhem
	{itemid = 25883, type = "deequip", slot = "hand", client_version = 1094}, -- mace of mayhem
	{itemid = 25882, type = "equip", slot = "hand", client_version = 1094}, -- chopper of mayhem
	{itemid = 25882, type = "deequip", slot = "hand", client_version = 1094}, -- chopper of mayhem
	{itemid = 25881, type = "equip", slot = "hand", client_version = 1094}, -- axe of mayhem
	{itemid = 25881, type = "deequip", slot = "hand", client_version = 1094}, -- axe of mayhem
	{itemid = 25880, type = "equip", slot = "hand", client_version = 1094}, -- slayer of mayhem
	{itemid = 25880, type = "deequip", slot = "hand", client_version = 1094}, -- slayer of mayhem
	{itemid = 25879, type = "equip", slot = "hand", client_version = 1094}, -- blade of mayhem
	{itemid = 25879, type = "deequip", slot = "hand", client_version = 1094}, -- blade of mayhem
	{itemid = 25546, type = "equip", slot = "shield", client_version = 1090}, -- shield of destiny
	{itemid = 25546, type = "deequip", slot = "shield", client_version = 1090}, -- shield of destiny
	{itemid = 25545, type = "equip", slot = "shield", client_version = 1090}, -- shield of destiny
	{itemid = 25545, type = "deequip", slot = "shield", client_version = 1090}, -- shield of destiny
	{itemid = 25523, type = "equip", slot = "hand", client_version = 1090}, -- rift crossbow
	{itemid = 25523, type = "deequip", slot = "hand", client_version = 1090}, -- rift crossbow
	{itemid = 25522, type = "equip", slot = "hand", client_version = 1090}, -- rift bow
	{itemid = 25522, type = "deequip", slot = "hand", client_version = 1090}, -- rift bow
	{itemid = 25430, type = "equip", slot = "feet", level = 100, client_version = 1090}, -- boots of homecoming
	{itemid = 25430, type = "deequip", slot = "feet", level = 100, client_version = 1090}, -- boots of homecoming
	{itemid = 25429, type = "equip", slot = "feet", level = 100, client_version = 1090}, -- boots of homecoming
	{itemid = 25429, type = "deequip", slot = "feet", level = 100, client_version = 1090}, -- boots of homecoming
	{itemid = 25424, type = "equip", slot = "necklace", level = 100, client_version = 1090}, -- ferumbras' amulet
	{itemid = 25424, type = "deequip", slot = "necklace", level = 100, client_version = 1090}, -- ferumbras' amulet
	{itemid = 25423, type = "equip", slot = "necklace", level = 100, client_version = 1090}, -- ferumbras' amulet
	{itemid = 25423, type = "deequip", slot = "necklace", level = 100, client_version = 1090}, -- ferumbras' amulet
	{itemid = 25422, type = "equip", slot = "hand", level = 100, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 1090}, -- ferumbras' staff (enchanted)
	{itemid = 25422, type = "deequip", slot = "hand", level = 100, client_version = 1090}, -- ferumbras' staff (enchanted)
	{itemid = 25421, type = "equip", slot = "hand", level = 65, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 1090}, -- ferumbras' staff (failed)
	{itemid = 25421, type = "deequip", slot = "hand", level = 65, client_version = 1090}, -- ferumbras' staff (failed)
	{itemid = 25420, type = "equip", slot = "hand", client_version = 1090}, -- Ferumbras' staff
	{itemid = 25420, type = "deequip", slot = "hand", client_version = 1090}, -- Ferumbras' staff
	{itemid = 25418, type = "equip", slot = "hand", client_version = 1090}, -- maimer
	{itemid = 25418, type = "deequip", slot = "hand", client_version = 1090}, -- maimer
	{itemid = 25416, type = "equip", slot = "hand", client_version = 1090}, -- Impaler of the igniter
	{itemid = 25416, type = "deequip", slot = "hand", client_version = 1090}, -- Impaler of the igniter
	{itemid = 25415, type = "equip", slot = "hand", client_version = 1090}, -- plague bite
	{itemid = 25415, type = "deequip", slot = "hand", client_version = 1090}, -- plague bite
	{itemid = 25414, type = "equip", slot = "shield", level = 200, client_version = 1090}, -- death gaze
	{itemid = 25414, type = "deequip", slot = "shield", level = 200, client_version = 1090}, -- death gaze
	{itemid = 25413, type = "equip", slot = "head", level = 150, client_version = 1090}, -- shroud of despair
	{itemid = 25413, type = "deequip", slot = "head", level = 150, client_version = 1090}, -- shroud of despair
	{itemid = 25412, type = "equip", slot = "feet", client_version = 1090}, -- treader of torment
	{itemid = 25412, type = "deequip", slot = "feet", client_version = 1090}, -- treader of torment
	{itemid = 25411, type = "equip", slot = "shield", level = 150, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1090}, -- book of lies
	{itemid = 25411, type = "deequip", slot = "shield", level = 150, client_version = 1090}, -- book of lies
	{itemid = 25410, type = "equip", slot = "head", client_version = 1090}, -- visage of the end days
	{itemid = 25410, type = "deequip", slot = "head", client_version = 1090}, -- visage of the end days
	{itemid = 25402, type = "equip", slot = "necklace", client_version = 1090}, -- ancient amulet
	{itemid = 25402, type = "deequip", slot = "necklace", client_version = 1090}, -- ancient amulet
	{itemid = 25383, type = "equip", slot = "hand", client_version = 1090}, -- rift lance
	{itemid = 25383, type = "deequip", slot = "hand", client_version = 1090}, -- rift lance
	{itemid = 25382, type = "equip", slot = "shield", client_version = 1090}, -- rift shield
	{itemid = 25382, type = "deequip", slot = "shield", client_version = 1090}, -- rift shield
	{itemid = 25307, type = "equip", slot = "shield", client_version = 1090}, -- rattling gourd
	{itemid = 25307, type = "deequip", slot = "shield", client_version = 1090}, -- rattling gourd
	{itemid = 25306, type = "equip", slot = "shield", client_version = 1090}, -- gourd
	{itemid = 25306, type = "deequip", slot = "shield", client_version = 1090}, -- gourd
	{itemid = 25193, type = "equip", slot = "armor", level = 200, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1090}, -- frostmind raiment
	{itemid = 25193, type = "deequip", slot = "armor", level = 200, client_version = 1090}, -- frostmind raiment
	{itemid = 25192, type = "equip", slot = "armor", level = 200, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1090}, -- thundermind raiment
	{itemid = 25192, type = "deequip", slot = "armor", level = 200, client_version = 1090}, -- thundermind raiment
	{itemid = 25191, type = "equip", slot = "armor", level = 200, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1090}, -- earthmind raiment
	{itemid = 25191, type = "deequip", slot = "armor", level = 200, client_version = 1090}, -- earthmind raiment
	{itemid = 25190, type = "equip", slot = "armor", level = 200, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1090}, -- firemind raiment
	{itemid = 25190, type = "deequip", slot = "armor", level = 200, client_version = 1090}, -- firemind raiment
	{itemid = 25189, type = "equip", slot = "armor", level = 200, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 1090}, -- frostsoul tabard
	{itemid = 25189, type = "deequip", slot = "armor", level = 200, client_version = 1090}, -- frostsoul tabard
	{itemid = 25188, type = "equip", slot = "armor", level = 200, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 1090}, -- thundersoul tabard
	{itemid = 25188, type = "deequip", slot = "armor", level = 200, client_version = 1090}, -- thundersoul tabard
	{itemid = 25187, type = "equip", slot = "armor", level = 200, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 1090}, -- earthsoul tabard
	{itemid = 25187, type = "deequip", slot = "armor", level = 200, client_version = 1090}, -- earthsoul tabard
	{itemid = 25186, type = "equip", slot = "armor", level = 200, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 1090}, -- firesoul tabard
	{itemid = 25186, type = "deequip", slot = "armor", level = 200, client_version = 1090}, -- firesoul tabard
	{itemid = 25185, type = "equip", slot = "armor", level = 200, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1090}, -- frostheart platemail
	{itemid = 25185, type = "deequip", slot = "armor", level = 200, client_version = 1090}, -- frostheart platemail
	{itemid = 25184, type = "equip", slot = "armor", level = 200, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1090}, -- frostheart hauberk
	{itemid = 25184, type = "deequip", slot = "armor", level = 200, client_version = 1090}, -- frostheart hauberk
	{itemid = 25183, type = "equip", slot = "armor", level = 200, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1090}, -- frostheart cuirass
	{itemid = 25183, type = "deequip", slot = "armor", level = 200, client_version = 1090}, -- frostheart cuirass
	{itemid = 25182, type = "equip", slot = "armor", level = 200, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1090}, -- thunderheart platemail
	{itemid = 25182, type = "deequip", slot = "armor", level = 200, client_version = 1090}, -- thunderheart platemail
	{itemid = 25181, type = "equip", slot = "armor", level = 200, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1090}, -- thunderheart hauberk
	{itemid = 25181, type = "deequip", slot = "armor", level = 200, client_version = 1090}, -- thunderheart hauberk
	{itemid = 25180, type = "equip", slot = "armor", level = 200, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1090}, -- thunderheart cuirass
	{itemid = 25180, type = "deequip", slot = "armor", level = 200, client_version = 1090}, -- thunderheart cuirass
	{itemid = 25179, type = "equip", slot = "armor", level = 200, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1090}, -- earthheart platemail
	{itemid = 25179, type = "deequip", slot = "armor", level = 200, client_version = 1090}, -- earthheart platemail
	{itemid = 25178, type = "equip", slot = "armor", level = 200, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1090}, -- earthheart hauberk
	{itemid = 25178, type = "deequip", slot = "armor", level = 200, client_version = 1090}, -- earthheart hauberk
	{itemid = 25177, type = "equip", slot = "armor", level = 200, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1090}, -- earthheart cuirass
	{itemid = 25177, type = "deequip", slot = "armor", level = 200, client_version = 1090}, -- earthheart cuirass
	{itemid = 25176, type = "equip", slot = "armor", level = 200, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1090}, -- fireheart platemail
	{itemid = 25176, type = "deequip", slot = "armor", level = 200, client_version = 1090}, -- fireheart platemail
	{itemid = 25175, type = "equip", slot = "armor", level = 200, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1090}, -- fireheart hauberk
	{itemid = 25175, type = "deequip", slot = "armor", level = 200, client_version = 1090}, -- fireheart hauberk
	{itemid = 25174, type = "equip", slot = "armor", level = 200, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1090}, -- fireheart cuirass
	{itemid = 25174, type = "deequip", slot = "armor", level = 200, client_version = 1090}, -- fireheart cuirass
	{itemid = 24851, type = "equip", slot = "necklace", level = 60, client_version = 1090}, -- onyx pendant
	{itemid = 24851, type = "deequip", slot = "necklace", level = 60, client_version = 1090}, -- onyx pendant
	{itemid = 24848, type = "equip", slot = "head", client_version = 1090}, -- shamanic mask
	{itemid = 24848, type = "deequip", slot = "head", client_version = 1090}, -- shamanic mask
	{itemid = 24846, type = "equip", slot = "shield", client_version = 1090}, -- painted gourd rattle
	{itemid = 24846, type = "deequip", slot = "shield", client_version = 1090}, -- painted gourd rattle
	{itemid = 24839, type = "equip", slot = "hand", level = 37, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 1090}, -- ogre sceptra
	{itemid = 24839, type = "deequip", slot = "hand", level = 37, client_version = 1090}, -- ogre sceptra
	{itemid = 24828, type = "equip", slot = "hand", client_version = 1090}, -- ogre choppa
	{itemid = 24828, type = "deequip", slot = "hand", client_version = 1090}, -- ogre choppa
	{itemid = 24827, type = "equip", slot = "hand", client_version = 1090}, -- ogre klubba
	{itemid = 24827, type = "deequip", slot = "hand", client_version = 1090}, -- ogre klubba
	{itemid = 24826, type = "equip", slot = "ring", client_version = 1090}, -- house silversun's signet ring
	{itemid = 24826, type = "deequip", slot = "ring", client_version = 1090}, -- house silversun's signet ring
	{itemid = 24810, type = "equip", slot = "head", client_version = 1082}, -- dark wizard's crown
	{itemid = 24810, type = "deequip", slot = "head", client_version = 1082}, -- dark wizard's crown
	{itemid = 24809, type = "equip", slot = "head", client_version = 1082}, -- dark wizard's crown
	{itemid = 24809, type = "deequip", slot = "head", client_version = 1082}, -- dark wizard's crown
	{itemid = 24790, type = "equip", slot = "necklace", client_version = 1080}, -- enchanted werewolf amulet
	{itemid = 24790, type = "deequip", slot = "necklace", client_version = 1080}, -- enchanted werewolf amulet
	{itemid = 24786, type = "equip", slot = "head", level = 100, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 1080}, -- enchanted werewolf helmet
	{itemid = 24786, type = "deequip", slot = "head", level = 100, client_version = 1080}, -- enchanted werewolf helmet
	{itemid = 24785, type = "equip", slot = "head", level = 100, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 1080}, -- enchanted werewolf helmet
	{itemid = 24785, type = "deequip", slot = "head", level = 100, client_version = 1080}, -- enchanted werewolf helmet
	{itemid = 24784, type = "equip", slot = "head", level = 100, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 1080}, -- enchanted werewolf helmet
	{itemid = 24784, type = "deequip", slot = "head", level = 100, client_version = 1080}, -- enchanted werewolf helmet
	{itemid = 24783, type = "equip", slot = "head", level = 100, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 1080}, -- enchanted werewolf helmet
	{itemid = 24783, type = "deequip", slot = "head", level = 100, client_version = 1080}, -- enchanted werewolf helmet
	{itemid = 24743, type = "equip", slot = "legs", client_version = 1080}, -- wereboar loincloth
	{itemid = 24743, type = "deequip", slot = "legs", client_version = 1080}, -- wereboar loincloth
	{itemid = 24742, type = "equip", slot = "feet", level = 60, client_version = 1080}, -- badger boots
	{itemid = 24742, type = "deequip", slot = "feet", level = 60, client_version = 1080}, -- badger boots
	{itemid = 24741, type = "equip", slot = "armor", level = 50, client_version = 1080}, -- fur armor
	{itemid = 24741, type = "deequip", slot = "armor", level = 50, client_version = 1080}, -- fur armor
	{itemid = 24740, type = "equip", slot = "backpack", client_version = 1080}, -- wolf backpack
	{itemid = 24740, type = "deequip", slot = "backpack", client_version = 1080}, -- wolf backpack
	{itemid = 24718, type = "equip", slot = "head", level = 100, client_version = 1080}, -- werewolf helmet
	{itemid = 24718, type = "deequip", slot = "head", level = 100, client_version = 1080}, -- werewolf helmet
	{itemid = 24716, type = "equip", slot = "necklace", client_version = 1080}, -- werewolf amulet
	{itemid = 24716, type = "deequip", slot = "necklace", client_version = 1080}, -- werewolf amulet
	{itemid = 24637, type = "equip", slot = "feet", level = 80, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1080}, -- oriental shoes
	{itemid = 24637, type = "deequip", slot = "feet", level = 80, client_version = 1080}, -- oriental shoes
	{itemid = 24324, type = "equip", slot = "ring", client_version = 1073}, -- sweetheart ring
	{itemid = 24324, type = "deequip", slot = "ring", client_version = 1073}, -- sweetheart ring
	{itemid = 24261, type = "equip", slot = "head", level = 80, client_version = 1070}, -- crest of the deep seas
	{itemid = 24261, type = "deequip", slot = "head", level = 80, client_version = 1070}, -- crest of the deep seas
	{itemid = 24114, type = "equip", slot = "ring", client_version = 1070}, -- brandon's wedding ring
	{itemid = 24114, type = "deequip", slot = "ring", client_version = 1070}, -- brandon's wedding ring
	{itemid = 23839, type = "equip", slot = "ammo", client_version = 1055}, -- simple arrow
	{itemid = 23839, type = "deequip", slot = "ammo", client_version = 1055}, -- simple arrow
	{itemid = 23816, type = "equip", slot = "backpack", client_version = 1050}, -- war backpack
	{itemid = 23816, type = "deequip", slot = "backpack", client_version = 1050}, -- war backpack
	{itemid = 23810, type = "equip", slot = "necklace", client_version = 1070}, -- the Lion's Heart
	{itemid = 23810, type = "deequip", slot = "necklace", client_version = 1070}, -- the Lion's Heart
	{itemid = 23782, type = "equip", slot = "backpack", client_version = 1055}, -- shopping bag
	{itemid = 23782, type = "deequip", slot = "backpack", client_version = 1055}, -- shopping bag
	{itemid = 23772, type = "equip", slot = "shield", client_version = 1055}, -- broken wooden shield
	{itemid = 23772, type = "deequip", slot = "shield", client_version = 1055}, -- broken wooden shield
	{itemid = 23771, type = "equip", slot = "shield", vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1055}, -- spellbook of the novice
	{itemid = 23771, type = "deequip", slot = "shield", client_version = 1055}, -- spellbook of the novice
	{itemid = 23721, type = "equip", slot = "hand", level = 1, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 1055}, -- the chiller
	{itemid = 23721, type = "deequip", slot = "hand", level = 1, client_version = 1055}, -- the chiller
	{itemid = 23719, type = "equip", slot = "hand", level = 1, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 1055}, -- the scorcher
	{itemid = 23719, type = "deequip", slot = "hand", level = 1, client_version = 1055}, -- the scorcher
	{itemid = 23666, type = "equip", slot = "backpack", client_version = 1050}, -- glooth backpack
	{itemid = 23666, type = "deequip", slot = "backpack", client_version = 1050}, -- glooth backpack
	{itemid = 23663, type = "equip", slot = "backpack", client_version = 1050}, -- feedbag
	{itemid = 23663, type = "deequip", slot = "backpack", client_version = 1050}, -- feedbag
	{itemid = 23590, type = "equip", slot = "hand", client_version = 1050}, -- one hit wonder
	{itemid = 23590, type = "deequip", slot = "hand", client_version = 1050}, -- one hit wonder
	{itemid = 23554, type = "equip", slot = "necklace", level = 75, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1050}, -- glooth amulet
	{itemid = 23554, type = "deequip", slot = "necklace", level = 75, client_version = 1050}, -- glooth amulet
	{itemid = 23551, type = "equip", slot = "hand", client_version = 1050}, -- glooth axe
	{itemid = 23551, type = "deequip", slot = "hand", client_version = 1050}, -- glooth axe
	{itemid = 23550, type = "equip", slot = "hand", client_version = 1050}, -- glooth blade
	{itemid = 23550, type = "deequip", slot = "hand", client_version = 1050}, -- glooth blade
	{itemid = 23549, type = "equip", slot = "hand", client_version = 1050}, -- glooth club
	{itemid = 23549, type = "deequip", slot = "hand", client_version = 1050}, -- glooth club
	{itemid = 23548, type = "equip", slot = "hand", client_version = 1050}, -- cowtana
	{itemid = 23548, type = "deequip", slot = "hand", client_version = 1050}, -- cowtana
	{itemid = 23547, type = "equip", slot = "hand", client_version = 1050}, -- execowtioner axe
	{itemid = 23547, type = "deequip", slot = "hand", client_version = 1050}, -- execowtioner axe
	{itemid = 23546, type = "equip", slot = "shield", client_version = 1050}, -- mino shield
	{itemid = 23546, type = "deequip", slot = "shield", client_version = 1050}, -- mino shield
	{itemid = 23545, type = "equip", slot = "hand", client_version = 1050}, -- mino lance
	{itemid = 23545, type = "deequip", slot = "hand", client_version = 1050}, -- mino lance
	{itemid = 23544, type = "equip", slot = "hand", client_version = 1050}, -- moohtant cudgel
	{itemid = 23544, type = "deequip", slot = "hand", client_version = 1050}, -- moohtant cudgel
	{itemid = 23543, type = "equip", slot = "hand", client_version = 1050}, -- glooth whip
	{itemid = 23543, type = "deequip", slot = "hand", client_version = 1050}, -- glooth whip
	{itemid = 23542, type = "equip", slot = "hand", client_version = 1050}, -- metal bat
	{itemid = 23542, type = "deequip", slot = "hand", client_version = 1050}, -- metal bat
	{itemid = 23541, type = "equip", slot = "necklace", level = 75, client_version = 1050}, -- gearwheel chain
	{itemid = 23541, type = "deequip", slot = "necklace", level = 75, client_version = 1050}, -- gearwheel chain
	{itemid = 23540, type = "equip", slot = "feet", level = 50, vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 1050}, -- metal spats
	{itemid = 23540, type = "deequip", slot = "feet", level = 50, client_version = 1050}, -- metal spats
	{itemid = 23539, type = "equip", slot = "legs", level = 60, client_version = 1050}, -- alloy legs
	{itemid = 23539, type = "deequip", slot = "legs", level = 60, client_version = 1050}, -- alloy legs
	{itemid = 23538, type = "equip", slot = "armor", client_version = 1050}, -- heat core
	{itemid = 23538, type = "deequip", slot = "armor", client_version = 1050}, -- heat core
	{itemid = 23537, type = "equip", slot = "armor", vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 1050}, -- mooh'tah plate
	{itemid = 23537, type = "deequip", slot = "armor", client_version = 1050}, -- mooh'tah plate
	{itemid = 23536, type = "equip", slot = "head", level = 70, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1050}, -- rubber cap
	{itemid = 23536, type = "deequip", slot = "head", level = 70, client_version = 1050}, -- rubber cap
	{itemid = 23535, type = "equip", slot = "armor", level = 40, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1050}, -- glooth cape
	{itemid = 23535, type = "deequip", slot = "armor", level = 40, client_version = 1050}, -- glooth cape
	{itemid = 23529, type = "equip", slot = "hand", client_version = 1050}, -- glooth spear
	{itemid = 23529, type = "deequip", slot = "hand", client_version = 1050}, -- glooth spear
	{itemid = 22696, type = "equip", slot = "backpack", client_version = 1035}, -- cake backpack
	{itemid = 22696, type = "deequip", slot = "backpack", client_version = 1035}, -- cake backpack
	{itemid = 22543, type = "equip", slot = "ring", client_version = 1030}, -- unstable ring of ending
	{itemid = 22543, type = "deequip", slot = "ring", client_version = 1030}, -- unstable ring of ending
	{itemid = 22518, type = "equip", slot = "head", client_version = 1030}, -- broken visor
	{itemid = 22518, type = "deequip", slot = "head", client_version = 1030}, -- broken visor
	{itemid = 22516, type = "equip", slot = "ring", level = 200, client_version = 1030}, -- ring of ending
	{itemid = 22516, type = "deequip", slot = "ring", level = 200, client_version = 1030}, -- ring of ending
	{itemid = 22474, type = "equip", slot = "shield", client_version = 1030}, -- eerie song book
	{itemid = 22474, type = "deequip", slot = "shield", client_version = 1030}, -- eerie song book
	{itemid = 22424, type = "equip", slot = "shield", level = 250, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1030}, -- umbral master spellbook
	{itemid = 22424, type = "deequip", slot = "shield", level = 250, client_version = 1030}, -- umbral master spellbook
	{itemid = 22423, type = "equip", slot = "shield", level = 150, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1030}, -- umbral spellbook
	{itemid = 22423, type = "deequip", slot = "shield", level = 150, client_version = 1030}, -- umbral spellbook
	{itemid = 22422, type = "equip", slot = "shield", level = 75, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1030}, -- crude umbral spellbook
	{itemid = 22422, type = "deequip", slot = "shield", level = 75, client_version = 1030}, -- crude umbral spellbook
	{itemid = 22421, type = "equip", slot = "hand", client_version = 1030}, -- umbral master crossbow
	{itemid = 22421, type = "deequip", slot = "hand", client_version = 1030}, -- umbral master crossbow
	{itemid = 22420, type = "equip", slot = "hand", client_version = 1030}, -- umbral crossbow
	{itemid = 22420, type = "deequip", slot = "hand", client_version = 1030}, -- umbral crossbow
	{itemid = 22419, type = "equip", slot = "hand", client_version = 1030}, -- crude umbral crossbow
	{itemid = 22419, type = "deequip", slot = "hand", client_version = 1030}, -- crude umbral crossbow
	{itemid = 22418, type = "equip", slot = "hand", client_version = 1030}, -- umbral master bow
	{itemid = 22418, type = "deequip", slot = "hand", client_version = 1030}, -- umbral master bow
	{itemid = 22417, type = "equip", slot = "hand", client_version = 1030}, -- umbral bow
	{itemid = 22417, type = "deequip", slot = "hand", client_version = 1030}, -- umbral bow
	{itemid = 22416, type = "equip", slot = "hand", client_version = 1030}, -- crude umbral bow
	{itemid = 22416, type = "deequip", slot = "hand", client_version = 1030}, -- crude umbral bow
	{itemid = 22415, type = "equip", slot = "hand", client_version = 1030}, -- umbral master hammer
	{itemid = 22415, type = "deequip", slot = "hand", client_version = 1030}, -- umbral master hammer
	{itemid = 22414, type = "equip", slot = "hand", client_version = 1030}, -- umbral hammer
	{itemid = 22414, type = "deequip", slot = "hand", client_version = 1030}, -- umbral hammer
	{itemid = 22413, type = "equip", slot = "hand", client_version = 1030}, -- crude umbral hammer
	{itemid = 22413, type = "deequip", slot = "hand", client_version = 1030}, -- crude umbral hammer
	{itemid = 22412, type = "equip", slot = "hand", client_version = 1030}, -- umbral master mace
	{itemid = 22412, type = "deequip", slot = "hand", client_version = 1030}, -- umbral master mace
	{itemid = 22411, type = "equip", slot = "hand", client_version = 1030}, -- umbral mace
	{itemid = 22411, type = "deequip", slot = "hand", client_version = 1030}, -- umbral mace
	{itemid = 22410, type = "equip", slot = "hand", client_version = 1030}, -- crude umbral mace
	{itemid = 22410, type = "deequip", slot = "hand", client_version = 1030}, -- crude umbral mace
	{itemid = 22409, type = "equip", slot = "hand", client_version = 1030}, -- umbral master chopper
	{itemid = 22409, type = "deequip", slot = "hand", client_version = 1030}, -- umbral master chopper
	{itemid = 22408, type = "equip", slot = "hand", client_version = 1030}, -- umbral chopper
	{itemid = 22408, type = "deequip", slot = "hand", client_version = 1030}, -- umbral chopper
	{itemid = 22407, type = "equip", slot = "hand", client_version = 1030}, -- guardian halberd
	{itemid = 22407, type = "deequip", slot = "hand", client_version = 1030}, -- guardian halberd
	{itemid = 22406, type = "equip", slot = "hand", client_version = 1030}, -- umbral master axe
	{itemid = 22406, type = "deequip", slot = "hand", client_version = 1030}, -- umbral master axe
	{itemid = 22405, type = "equip", slot = "hand", client_version = 1030}, -- umbral axe
	{itemid = 22405, type = "deequip", slot = "hand", client_version = 1030}, -- umbral axe
	{itemid = 22404, type = "equip", slot = "hand", client_version = 1030}, -- crude umbral axe
	{itemid = 22404, type = "deequip", slot = "hand", client_version = 1030}, -- crude umbral axe
	{itemid = 22403, type = "equip", slot = "hand", client_version = 1030}, -- umbral master slayer
	{itemid = 22403, type = "deequip", slot = "hand", client_version = 1030}, -- umbral master slayer
	{itemid = 22402, type = "equip", slot = "hand", client_version = 1030}, -- umbral slayer
	{itemid = 22402, type = "deequip", slot = "hand", client_version = 1030}, -- umbral slayer
	{itemid = 22401, type = "equip", slot = "hand", client_version = 1030}, -- crude umbral slayer
	{itemid = 22401, type = "deequip", slot = "hand", client_version = 1030}, -- crude umbral slayer
	{itemid = 22400, type = "equip", slot = "hand", client_version = 1030}, -- umbral masterblade
	{itemid = 22400, type = "deequip", slot = "hand", client_version = 1030}, -- umbral masterblade
	{itemid = 22399, type = "equip", slot = "hand", client_version = 1030}, -- umbral blade
	{itemid = 22399, type = "deequip", slot = "hand", client_version = 1030}, -- umbral blade
	{itemid = 22398, type = "equip", slot = "hand", client_version = 1030}, -- crude umbral blade
	{itemid = 22398, type = "deequip", slot = "hand", client_version = 1030}, -- crude umbral blade
	{itemid = 22384, type = "equip", slot = "shield", client_version = 1030}, -- strange good night songs
	{itemid = 22384, type = "deequip", slot = "shield", client_version = 1030}, -- strange good night songs
	{itemid = 21725, type = "equip", slot = "armor", level = 130, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1020}, -- furious frock
	{itemid = 21725, type = "deequip", slot = "armor", level = 130, client_version = 1020}, -- furious frock
	{itemid = 21708, type = "equip", slot = "feet", client_version = 1020}, -- vampire silk slippers
	{itemid = 21708, type = "deequip", slot = "feet", client_version = 1020}, -- vampire silk slippers
	{itemid = 21707, type = "equip", slot = "shield", client_version = 1020}, -- haunted mirror piece
	{itemid = 21707, type = "deequip", slot = "shield", client_version = 1020}, -- haunted mirror piece
	{itemid = 21706, type = "equip", slot = "armor", client_version = 1020}, -- goo shell
	{itemid = 21706, type = "deequip", slot = "armor", client_version = 1020}, -- goo shell
	{itemid = 21700, type = "equip", slot = "legs", vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 1020}, -- icy culottes
	{itemid = 21700, type = "deequip", slot = "legs", client_version = 1020}, -- icy culottes
	{itemid = 21697, type = "equip", slot = "shield", client_version = 1020}, -- runic ice shield
	{itemid = 21697, type = "deequip", slot = "shield", client_version = 1020}, -- runic ice shield
	{itemid = 21696, type = "equip", slot = "hand", client_version = 1020}, -- icicle bow
	{itemid = 21696, type = "deequip", slot = "hand", client_version = 1020}, -- icicle bow
	{itemid = 21693, type = "equip", slot = "ring", client_version = 1020}, -- horn
	{itemid = 21693, type = "deequip", slot = "ring", client_version = 1020}, -- horn
	{itemid = 21692, type = "equip", slot = "armor", client_version = 1020}, -- albino plate
	{itemid = 21692, type = "deequip", slot = "armor", client_version = 1020}, -- albino plate
	{itemid = 21691, type = "equip", slot = "necklace", level = 150, client_version = 1020}, -- shrunken head necklace
	{itemid = 21691, type = "deequip", slot = "necklace", level = 150, client_version = 1020}, -- shrunken head necklace
	{itemid = 21690, type = "equip", slot = "hand", client_version = 1020}, -- triple bolt crossbow
	{itemid = 21690, type = "deequip", slot = "hand", client_version = 1020}, -- triple bolt crossbow
	{itemid = 21475, type = "equip", slot = "backpack", client_version = 1010}, -- pannier backpack
	{itemid = 21475, type = "deequip", slot = "backpack", client_version = 1010}, -- pannier backpack
	{itemid = 21469, type = "equip", slot = "necklace", client_version = 853}, -- friendship amulet
	{itemid = 21469, type = "deequip", slot = "necklace", client_version = 853}, -- friendship amulet
	{itemid = 21252, type = "equip", slot = "ring", client_version = 1010}, -- vampire's signet ring
	{itemid = 21252, type = "deequip", slot = "ring", client_version = 1010}, -- vampire's signet ring
	{itemid = 20139, type = "equip", slot = "hand", client_version = 980}, -- spiky club
	{itemid = 20139, type = "deequip", slot = "hand", client_version = 980}, -- spiky club
	{itemid = 20132, type = "equip", slot = "head", client_version = 980}, -- helmet of the lost
	{itemid = 20132, type = "deequip", slot = "head", client_version = 980}, -- helmet of the lost
	{itemid = 20126, type = "equip", slot = "armor", client_version = 980}, -- leather harness
	{itemid = 20126, type = "deequip", slot = "armor", client_version = 980}, -- leather harness
	{itemid = 20109, type = "equip", slot = "armor", client_version = 980}, -- buckle
	{itemid = 20109, type = "deequip", slot = "armor", client_version = 980}, -- buckle
	{itemid = 20108, type = "equip", slot = "hand", client_version = 980}, -- pair of iron fists
	{itemid = 20108, type = "deequip", slot = "hand", client_version = 980}, -- pair of iron fists
	{itemid = 20104, type = "equip", slot = "hand", client_version = 980}, -- swampling club
	{itemid = 20104, type = "deequip", slot = "hand", client_version = 980}, -- swampling club
	{itemid = 20093, type = "equip", slot = "hand", client_version = 980}, -- life preserver
	{itemid = 20093, type = "deequip", slot = "hand", client_version = 980}, -- life preserver
	{itemid = 20092, type = "equip", slot = "hand", client_version = 980}, -- ratana
	{itemid = 20092, type = "deequip", slot = "hand", client_version = 980}, -- ratana
	{itemid = 20090, type = "equip", slot = "shield", client_version = 980}, -- spike shield
	{itemid = 20090, type = "deequip", slot = "shield", client_version = 980}, -- spike shield
	{itemid = 19391, type = "equip", slot = "hand", level = 1, vocation = {{"None", true}}, client_version = 980}, -- sorc and druid staff
	{itemid = 19391, type = "deequip", slot = "hand", level = 1, client_version = 980}, -- sorc and druid staff
	{itemid = 19390, type = "equip", slot = "hand", client_version = 980}, -- mean paladin spear
	{itemid = 19390, type = "deequip", slot = "hand", client_version = 980}, -- mean paladin spear
	{itemid = 19389, type = "equip", slot = "hand", client_version = 980}, -- mean knight sword
	{itemid = 19389, type = "deequip", slot = "hand", client_version = 980}, -- mean knight sword
	{itemid = 18528, type = "equip", slot = "ring", level = 120, client_version = 960}, -- prismatic ring
	{itemid = 18528, type = "deequip", slot = "ring", level = 120, client_version = 960}, -- prismatic ring
	{itemid = 18465, type = "equip", slot = "hand", client_version = 960}, -- shiny blade
	{itemid = 18465, type = "deequip", slot = "hand", client_version = 960}, -- shiny blade
	{itemid = 18454, type = "equip", slot = "hand", client_version = 960}, -- mycological bow
	{itemid = 18454, type = "deequip", slot = "hand", client_version = 960}, -- mycological bow
	{itemid = 18453, type = "equip", slot = "hand", client_version = 960}, -- crystal crossbow
	{itemid = 18453, type = "deequip", slot = "hand", client_version = 960}, -- crystal crossbow
	{itemid = 18452, type = "equip", slot = "hand", client_version = 960}, -- mycological mace
	{itemid = 18452, type = "deequip", slot = "hand", client_version = 960}, -- mycological mace
	{itemid = 18451, type = "equip", slot = "hand", client_version = 960}, -- crystalline axe
	{itemid = 18451, type = "deequip", slot = "hand", client_version = 960}, -- crystalline axe
	{itemid = 18450, type = "equip", slot = "hand", client_version = 960}, -- crystalline sword
	{itemid = 18450, type = "deequip", slot = "hand", client_version = 960}, -- crystalline sword
	{itemid = 18437, type = "equip", slot = "ammo", client_version = 960}, -- envenomed arrow
	{itemid = 18437, type = "deequip", slot = "ammo", client_version = 960}, -- envenomed arrow
	{itemid = 18436, type = "equip", slot = "ammo", client_version = 960}, -- drill bolt
	{itemid = 18436, type = "deequip", slot = "ammo", client_version = 960}, -- drill bolt
	{itemid = 18435, type = "equip", slot = "ammo", client_version = 960}, -- prismatic bolt
	{itemid = 18435, type = "deequip", slot = "ammo", client_version = 960}, -- prismatic bolt
	{itemid = 18412, type = "equip", slot = "hand", level = 65, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 960}, -- glacial rod
	{itemid = 18412, type = "deequip", slot = "hand", level = 65, client_version = 960}, -- glacial rod
	{itemid = 18411, type = "equip", slot = "hand", level = 65, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 960}, -- muck rod
	{itemid = 18411, type = "deequip", slot = "hand", level = 65, client_version = 960}, -- muck rod
	{itemid = 18410, type = "equip", slot = "shield", level = 150, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 960}, -- prismatic shield
	{itemid = 18410, type = "deequip", slot = "shield", level = 150, client_version = 960}, -- prismatic shield
	{itemid = 18409, type = "equip", slot = "hand", level = 65, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 960}, -- wand of everblazing
	{itemid = 18409, type = "deequip", slot = "hand", level = 65, client_version = 960}, -- wand of everblazing
	{itemid = 18408, type = "equip", slot = "ring", level = 120, client_version = 960}, -- prismatic ring
	{itemid = 18408, type = "deequip", slot = "ring", level = 120, client_version = 960}, -- prismatic ring
	{itemid = 18407, type = "equip", slot = "necklace", level = 150, client_version = 960}, -- prismatic necklace
	{itemid = 18407, type = "deequip", slot = "necklace", level = 150, client_version = 960}, -- prismatic necklace
	{itemid = 18406, type = "equip", slot = "feet", level = 150, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 960}, -- prismatic boots
	{itemid = 18406, type = "deequip", slot = "feet", level = 150, client_version = 960}, -- prismatic boots
	{itemid = 18405, type = "equip", slot = "legs", level = 150, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 960}, -- prismatic legs
	{itemid = 18405, type = "deequip", slot = "legs", level = 150, client_version = 960}, -- prismatic legs
	{itemid = 18404, type = "equip", slot = "armor", level = 120, vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 960}, -- prismatic armor
	{itemid = 18404, type = "deequip", slot = "armor", level = 120, client_version = 960}, -- prismatic armor
	{itemid = 18403, type = "equip", slot = "head", level = 150, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 960}, -- prismatic helmet
	{itemid = 18403, type = "deequip", slot = "head", level = 150, client_version = 960}, -- prismatic helmet
	{itemid = 18402, type = "equip", slot = "necklace", level = 150, client_version = 960}, -- gill necklace
	{itemid = 18402, type = "deequip", slot = "necklace", level = 150, client_version = 960}, -- gill necklace
	{itemid = 18401, type = "equip", slot = "shield", level = 130, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 960}, -- spellbook of vigilance
	{itemid = 18401, type = "deequip", slot = "shield", level = 130, client_version = 960}, -- spellbook of vigilance
	{itemid = 18400, type = "equip", slot = "legs", level = 150, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 960}, -- gill legs
	{itemid = 18400, type = "deequip", slot = "legs", level = 150, client_version = 960}, -- gill legs
	{itemid = 18399, type = "equip", slot = "armor", level = 150, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 960}, -- gill coat
	{itemid = 18399, type = "deequip", slot = "armor", level = 150, client_version = 960}, -- gill coat
	{itemid = 18398, type = "equip", slot = "head", level = 150, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 960}, -- gill gugel
	{itemid = 18398, type = "deequip", slot = "head", level = 150, client_version = 960}, -- gill gugel
	{itemid = 18394, type = "equip", slot = "backpack", client_version = 960}, -- crystal backpack
	{itemid = 18394, type = "deequip", slot = "backpack", client_version = 960}, -- crystal backpack
	{itemid = 18393, type = "equip", slot = "backpack", client_version = 960}, -- mushroom backpack
	{itemid = 18393, type = "deequip", slot = "backpack", client_version = 960}, -- mushroom backpack
	{itemid = 18390, type = "equip", slot = "hand", level = 65, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 960}, -- wand of defiance
	{itemid = 18390, type = "deequip", slot = "hand", level = 65, client_version = 960}, -- wand of defiance
	{itemid = 18304, type = "equip", slot = "ammo", client_version = 960}, -- crystalline arrow
	{itemid = 18304, type = "deequip", slot = "ammo", client_version = 960}, -- crystalline arrow
	{itemid = 18303, type = "equip", slot = "ammo", client_version = 960}, -- crystal bolt
	{itemid = 18303, type = "deequip", slot = "ammo", client_version = 960}, -- crystal bolt
	{itemid = 16112, type = "equip", slot = "shield", level = 150, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 960}, -- spellbook of ancient arcana
	{itemid = 16112, type = "deequip", slot = "shield", level = 150, client_version = 960}, -- spellbook of ancient arcana
	{itemid = 16111, type = "equip", slot = "hand", client_version = 950}, -- thorn spitter
	{itemid = 16111, type = "deequip", slot = "hand", client_version = 950}, -- thorn spitter
	{itemid = 16104, type = "equip", slot = "shield", client_version = 950}, -- mathmaster shield
	{itemid = 16104, type = "deequip", slot = "shield", client_version = 950}, -- mathmaster shield
	{itemid = 16103, type = "equip", slot = "shield", client_version = 950}, -- mathmaster shield
	{itemid = 16103, type = "deequip", slot = "shield", client_version = 950}, -- mathmaster shield
	{itemid = 16007, type = "equip", slot = "backpack", client_version = 944}, -- anniversary backpack
	{itemid = 16007, type = "deequip", slot = "backpack", client_version = 944}, -- anniversary backpack
	{itemid = 15649, type = "equip", slot = "ammo", client_version = 940}, -- vortex bolt
	{itemid = 15649, type = "deequip", slot = "ammo", client_version = 940}, -- vortex bolt
	{itemid = 15648, type = "equip", slot = "ammo", client_version = 940}, -- tarsal arrow
	{itemid = 15648, type = "deequip", slot = "ammo", client_version = 940}, -- tarsal arrow
	{itemid = 15647, type = "equip", slot = "hand", client_version = 940}, -- deepling squelcher
	{itemid = 15647, type = "deequip", slot = "hand", client_version = 940}, -- deepling squelcher
	{itemid = 15646, type = "equip", slot = "backpack", client_version = 940}, -- buggy backpack
	{itemid = 15646, type = "deequip", slot = "backpack", client_version = 940}, -- buggy backpack
	{itemid = 15645, type = "equip", slot = "backpack", client_version = 940}, -- deepling backpack
	{itemid = 15645, type = "deequip", slot = "backpack", client_version = 940}, -- deepling backpack
	{itemid = 15644, type = "equip", slot = "hand", client_version = 940}, -- ornate crossbow
	{itemid = 15644, type = "deequip", slot = "hand", client_version = 940}, -- ornate crossbow
	{itemid = 15643, type = "equip", slot = "hand", client_version = 940}, -- hive bow
	{itemid = 15643, type = "deequip", slot = "hand", client_version = 940}, -- hive bow
	{itemid = 15492, type = "equip", slot = "hand", client_version = 940}, -- hive scythe
	{itemid = 15492, type = "deequip", slot = "hand", client_version = 940}, -- hive scythe
	{itemid = 15491, type = "equip", slot = "shield", client_version = 940}, -- carapace shield
	{itemid = 15491, type = "deequip", slot = "shield", client_version = 940}, -- carapace shield
	{itemid = 15490, type = "equip", slot = "legs", level = 75, client_version = 940}, -- grasshopper legs
	{itemid = 15490, type = "deequip", slot = "legs", level = 75, client_version = 940}, -- grasshopper legs
	{itemid = 15489, type = "equip", slot = "armor", level = 80, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 940}, -- calopteryx cape
	{itemid = 15489, type = "deequip", slot = "armor", level = 80, client_version = 940}, -- calopteryx cape
	{itemid = 15454, type = "equip", slot = "hand", client_version = 940}, -- guardian axe
	{itemid = 15454, type = "deequip", slot = "hand", client_version = 940}, -- guardian axe
	{itemid = 15453, type = "equip", slot = "shield", client_version = 940}, -- warrior's shield
	{itemid = 15453, type = "deequip", slot = "shield", client_version = 940}, -- warrior's shield
	{itemid = 15451, type = "equip", slot = "hand", client_version = 940}, -- warrior's axe
	{itemid = 15451, type = "deequip", slot = "hand", client_version = 940}, -- warrior's axe
	{itemid = 15414, type = "equip", slot = "hand", client_version = 940}, -- ornate mace
	{itemid = 15414, type = "deequip", slot = "hand", client_version = 940}, -- ornate mace
	{itemid = 15413, type = "equip", slot = "shield", level = 130, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 940}, -- ornate shield
	{itemid = 15413, type = "deequip", slot = "shield", level = 130, client_version = 940}, -- ornate shield
	{itemid = 15412, type = "equip", slot = "legs", level = 185, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 940}, -- ornate legs
	{itemid = 15412, type = "deequip", slot = "legs", level = 185, client_version = 940}, -- ornate legs
	{itemid = 15411, type = "equip", slot = "shield", level = 120, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 940}, -- depth scutum
	{itemid = 15411, type = "deequip", slot = "shield", level = 120, client_version = 940}, -- depth scutum
	{itemid = 15410, type = "equip", slot = "feet", level = 150, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 940}, -- depth calcei
	{itemid = 15410, type = "deequip", slot = "feet", level = 150, client_version = 940}, -- depth calcei
	{itemid = 15409, type = "equip", slot = "legs", level = 130, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 940}, -- depth ocrea
	{itemid = 15409, type = "deequip", slot = "legs", level = 130, client_version = 940}, -- depth ocrea
	{itemid = 15408, type = "equip", slot = "head", level = 150, client_version = 940}, -- depth galea
	{itemid = 15408, type = "deequip", slot = "head", level = 150, client_version = 940}, -- depth galea
	{itemid = 15407, type = "equip", slot = "armor", level = 150, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 940}, -- depth lorica
	{itemid = 15407, type = "deequip", slot = "armor", level = 150, client_version = 940}, -- depth lorica
	{itemid = 15406, type = "equip", slot = "armor", level = 200, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 940}, -- ornate chestplate
	{itemid = 15406, type = "deequip", slot = "armor", level = 200, client_version = 940}, -- ornate chestplate
	{itemid = 15404, type = "equip", slot = "hand", client_version = 940}, -- deepling axe
	{itemid = 15404, type = "deequip", slot = "hand", client_version = 940}, -- deepling axe
	{itemid = 15403, type = "equip", slot = "necklace", level = 120, client_version = 940}, -- necklace of the deep
	{itemid = 15403, type = "deequip", slot = "necklace", level = 120, client_version = 940}, -- necklace of the deep
	{itemid = 15400, type = "equip", slot = "hand", client_version = 940}, -- deepling staff
	{itemid = 15400, type = "deequip", slot = "hand", client_version = 940}, -- deepling staff
	{itemid = 13947, type = "equip", slot = "head", client_version = 910}, -- the Epic Wisdom
	{itemid = 13947, type = "deequip", slot = "head", client_version = 910}, -- the Epic Wisdom
	{itemid = 13946, type = "equip", slot = "head", client_version = 910}, -- the Epic Wisdom
	{itemid = 13946, type = "deequip", slot = "head", client_version = 910}, -- the Epic Wisdom
	{itemid = 13880, type = "equip", slot = "hand", level = 40, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 910}, -- shimmer wand
	{itemid = 13880, type = "deequip", slot = "hand", level = 40, client_version = 910}, -- shimmer wand
	{itemid = 13877, type = "equip", slot = "ring", client_version = 910}, -- broken ring of ending
	{itemid = 13877, type = "deequip", slot = "ring", client_version = 910}, -- broken ring of ending
	{itemid = 13873, type = "equip", slot = "hand", client_version = 910}, -- shimmer bow
	{itemid = 13873, type = "deequip", slot = "hand", client_version = 910}, -- shimmer bow
	{itemid = 13872, type = "equip", slot = "hand", level = 40, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 910}, -- shimmer rod
	{itemid = 13872, type = "deequip", slot = "hand", level = 40, client_version = 910}, -- shimmer rod
	{itemid = 13871, type = "equip", slot = "hand", client_version = 910}, -- shimmer sword
	{itemid = 13871, type = "deequip", slot = "hand", client_version = 910}, -- shimmer sword
	{itemid = 13838, type = "equip", slot = "hand", client_version = 910}, -- heavy trident
	{itemid = 13838, type = "deequip", slot = "hand", client_version = 910}, -- heavy trident
	{itemid = 13829, type = "equip", slot = "hand", client_version = 910}, -- wooden sword
	{itemid = 13829, type = "deequip", slot = "hand", client_version = 910}, -- wooden sword
	{itemid = 13826, type = "equip", slot = "ring", vocation = {{"None", true}}, client_version = 910}, -- star ring
	{itemid = 13826, type = "deequip", slot = "ring", vocation = {{"None", true}}, client_version = 910}, -- star ring
	{itemid = 13825, type = "equip", slot = "ring", vocation = {{"None", true}}, client_version = 910}, -- star ring
	{itemid = 13825, type = "deequip", slot = "ring", vocation = {{"None", true}}, client_version = 910}, -- star ring
	{itemid = 13760, type = "equip", slot = "hand", level = 37, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 910}, -- wand of dimensions
	{itemid = 13760, type = "deequip", slot = "hand", level = 37, client_version = 910}, -- wand of dimensions
	{itemid = 13756, type = "equip", slot = "head", vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 910}, -- mage's cap
	{itemid = 13756, type = "deequip", slot = "head", client_version = 910}, -- mage's cap
	{itemid = 13580, type = "equip", slot = "feet", client_version = 860}, -- fish tail (equipped)
	{itemid = 13580, type = "deequip", slot = "feet", client_version = 860}, -- fish tail (equipped)
	{itemid = 13532, type = "equip", slot = "necklace", client_version = 910}, -- golden hyena pendant
	{itemid = 13532, type = "deequip", slot = "necklace", client_version = 910}, -- golden hyena pendant
	{itemid = 13531, type = "equip", slot = "necklace", client_version = 910}, -- golden scorpion pendant
	{itemid = 13531, type = "deequip", slot = "necklace", client_version = 910}, -- golden scorpion pendant
	{itemid = 12657, type = "equip", slot = "armor", client_version = 860}, -- old cape
	{itemid = 12657, type = "deequip", slot = "armor", client_version = 860}, -- old cape
	{itemid = 12656, type = "equip", slot = "head", client_version = 860}, -- sedge hat
	{itemid = 12656, type = "deequip", slot = "head", client_version = 860}, -- sedge hat
	{itemid = 12654, type = "equip", slot = "backpack", client_version = 860}, -- loot bag
	{itemid = 12654, type = "deequip", slot = "backpack", client_version = 860}, -- loot bag
	{itemid = 12649, type = "equip", slot = "hand", client_version = 860}, -- blade of corruption
	{itemid = 12649, type = "deequip", slot = "hand", client_version = 860}, -- blade of corruption
	{itemid = 12648, type = "equip", slot = "hand", client_version = 860}, -- snake god's sceptre
	{itemid = 12648, type = "deequip", slot = "hand", client_version = 860}, -- snake god's sceptre
	{itemid = 12647, type = "equip", slot = "shield", level = 100, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 860}, -- snake god's wristguard
	{itemid = 12647, type = "deequip", slot = "shield", level = 100, client_version = 860}, -- snake god's wristguard
	{itemid = 12646, type = "equip", slot = "feet", level = 80, vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 860}, -- draken boots
	{itemid = 12646, type = "deequip", slot = "feet", level = 80, client_version = 860}, -- draken boots
	{itemid = 12645, type = "equip", slot = "head", level = 100, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 860}, -- elite draken helmet
	{itemid = 12645, type = "deequip", slot = "head", level = 100, client_version = 860}, -- elite draken helmet
	{itemid = 12644, type = "equip", slot = "shield", level = 80, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 860}, -- shield of corruption
	{itemid = 12644, type = "deequip", slot = "shield", level = 80, client_version = 860}, -- shield of corruption
	{itemid = 12643, type = "equip", slot = "armor", level = 100, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 860}, -- royal scale robe
	{itemid = 12643, type = "deequip", slot = "armor", level = 100, client_version = 860}, -- royal scale robe
	{itemid = 12642, type = "equip", slot = "armor", level = 100, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 860}, -- royal draken mail
	{itemid = 12642, type = "deequip", slot = "armor", level = 100, client_version = 860}, -- royal draken mail
	{itemid = 12630, type = "equip", slot = "head", vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 860}, -- cobra crown
	{itemid = 12630, type = "deequip", slot = "head", client_version = 860}, -- cobra crown
	{itemid = 12613, type = "equip", slot = "hand", client_version = 860}, -- twiceslicer
	{itemid = 12613, type = "deequip", slot = "hand", client_version = 860}, -- twiceslicer
	{itemid = 12607, type = "equip", slot = "armor", level = 100, vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 860}, -- elite draken mail
	{itemid = 12607, type = "deequip", slot = "armor", level = 100, client_version = 860}, -- elite draken mail
	{itemid = 12498, type = "equip", slot = "feet", client_version = 860}, -- fish tail (unequipped)
	{itemid = 12498, type = "deequip", slot = "feet", client_version = 860}, -- fish tail (unequipped)
	{itemid = 12424, type = "equip", slot = "necklace", client_version = 920}, -- ornamented brooch
	{itemid = 12424, type = "deequip", slot = "necklace", client_version = 920}, -- ornamented brooch
	{itemid = 11393, type = "equip", slot = "necklace", client_version = 854}, -- lucky clover amulet
	{itemid = 11393, type = "deequip", slot = "necklace", client_version = 854}, -- lucky clover amulet
	{itemid = 11374, type = "equip", slot = "necklace", client_version = 854}, -- beetle necklace
	{itemid = 11374, type = "deequip", slot = "necklace", client_version = 854}, -- beetle necklace
	{itemid = 11368, type = "equip", slot = "head", level = 60, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 854}, -- jade hat
	{itemid = 11368, type = "deequip", slot = "head", level = 60, client_version = 854}, -- jade hat
	{itemid = 11356, type = "equip", slot = "armor", level = 60, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 854}, -- Zaoan robe
	{itemid = 11356, type = "deequip", slot = "armor", level = 60, client_version = 854}, -- Zaoan robe
	{itemid = 11355, type = "equip", slot = "armor", level = 60, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 854}, -- spellweaver's robe
	{itemid = 11355, type = "deequip", slot = "armor", level = 60, client_version = 854}, -- spellweaver's robe
	{itemid = 11329, type = "equip", slot = "necklace", client_version = 854}, -- wailing widow's necklace
	{itemid = 11329, type = "deequip", slot = "necklace", client_version = 854}, -- wailing widow's necklace
	{itemid = 11323, type = "equip", slot = "hand", client_version = 854}, -- Zaoan halberd
	{itemid = 11323, type = "deequip", slot = "hand", client_version = 854}, -- Zaoan halberd
	{itemid = 11309, type = "equip", slot = "hand", client_version = 854}, -- twin hooks
	{itemid = 11309, type = "deequip", slot = "hand", client_version = 854}, -- twin hooks
	{itemid = 11308, type = "equip", slot = "hand", client_version = 854}, -- drachaku
	{itemid = 11308, type = "deequip", slot = "hand", client_version = 854}, -- drachaku
	{itemid = 11307, type = "equip", slot = "hand", client_version = 854}, -- Zaoan sword
	{itemid = 11307, type = "deequip", slot = "hand", client_version = 854}, -- Zaoan sword
	{itemid = 11306, type = "equip", slot = "hand", client_version = 854}, -- sai
	{itemid = 11306, type = "deequip", slot = "hand", client_version = 854}, -- sai
	{itemid = 11305, type = "equip", slot = "hand", client_version = 854}, -- drakinata
	{itemid = 11305, type = "deequip", slot = "hand", client_version = 854}, -- drakinata
	{itemid = 11304, type = "equip", slot = "legs", client_version = 854}, -- Zaoan legs
	{itemid = 11304, type = "deequip", slot = "legs", client_version = 854}, -- Zaoan legs
	{itemid = 11303, type = "equip", slot = "feet", client_version = 854}, -- zaoan shoes
	{itemid = 11303, type = "deequip", slot = "feet", client_version = 854}, -- zaoan shoes
	{itemid = 11302, type = "equip", slot = "head", vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 854}, -- Zaoan helmet
	{itemid = 11302, type = "deequip", slot = "head", client_version = 854}, -- Zaoan helmet
	{itemid = 11301, type = "equip", slot = "armor", level = 50, vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 854}, -- Zaoan armor
	{itemid = 11301, type = "deequip", slot = "armor", level = 50, client_version = 854}, -- Zaoan armor
	{itemid = 11263, type = "equip", slot = "backpack", client_version = 854}, -- santa backpack
	{itemid = 11263, type = "deequip", slot = "backpack", client_version = 854}, -- santa backpack
	{itemid = 11244, type = "equip", slot = "backpack", client_version = 854}, -- minotaur backpack
	{itemid = 11244, type = "deequip", slot = "backpack", client_version = 854}, -- minotaur backpack
	{itemid = 11243, type = "equip", slot = "backpack", client_version = 854}, -- dragon backpack
	{itemid = 11243, type = "deequip", slot = "backpack", client_version = 854}, -- dragon backpack
	{itemid = 11242, type = "equip", slot = "backpack", client_version = 854}, -- expedition bag
	{itemid = 11242, type = "deequip", slot = "backpack", client_version = 854}, -- expedition bag
	{itemid = 11241, type = "equip", slot = "backpack", client_version = 854}, -- expedition backpack
	{itemid = 11241, type = "deequip", slot = "backpack", client_version = 854}, -- expedition backpack
	{itemid = 11240, type = "equip", slot = "feet", level = 70, vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 854}, -- guardian boots
	{itemid = 11240, type = "deequip", slot = "feet", level = 70, client_version = 854}, -- guardian boots
	{itemid = 11119, type = "equip", slot = "backpack", client_version = 854}, -- heart backpack
	{itemid = 11119, type = "deequip", slot = "backpack", client_version = 854}, -- heart backpack
	{itemid = 11118, type = "equip", slot = "feet", level = 70, vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 854}, -- dragon scale boots
	{itemid = 11118, type = "deequip", slot = "feet", level = 70, client_version = 854}, -- dragon scale boots
	{itemid = 11117, type = "equip", slot = "feet", level = 70, vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 854}, -- crystal boots
	{itemid = 11117, type = "deequip", slot = "feet", level = 70, client_version = 854}, -- crystal boots
	{itemid = 10570, type = "equip", slot = "head", vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 854}, -- witch hat
	{itemid = 10570, type = "deequip", slot = "head", client_version = 854}, -- witch hat
	{itemid = 10522, type = "equip", slot = "backpack", client_version = 850}, -- crown backpack
	{itemid = 10522, type = "deequip", slot = "backpack", client_version = 850}, -- crown backpack
	{itemid = 10521, type = "equip", slot = "backpack", client_version = 850}, -- moon backpack
	{itemid = 10521, type = "deequip", slot = "backpack", client_version = 850}, -- moon backpack
	{itemid = 10520, type = "equip", slot = "backpack", client_version = 850}, -- orange bag
	{itemid = 10520, type = "deequip", slot = "backpack", client_version = 850}, -- orange bag
	{itemid = 10519, type = "equip", slot = "backpack", client_version = 850}, -- orange backpack
	{itemid = 10519, type = "deequip", slot = "backpack", client_version = 850}, -- orange backpack
	{itemid = 10518, type = "equip", slot = "backpack", client_version = 850}, -- demon backpack
	{itemid = 10518, type = "deequip", slot = "backpack", client_version = 850}, -- demon backpack
	{itemid = 10510, type = "equip", slot = "ring", client_version = 850}, -- broken wedding ring
	{itemid = 10510, type = "deequip", slot = "ring", client_version = 850}, -- broken wedding ring
	{itemid = 10502, type = "equip", slot = "ring", client_version = 850}, -- engraved wedding ring
	{itemid = 10502, type = "deequip", slot = "ring", client_version = 850}, -- engraved wedding ring
	{itemid = 10364, type = "equip", slot = "shield", client_version = 850}, -- the shield Nevermourn
	{itemid = 10364, type = "deequip", slot = "shield", client_version = 850}, -- the shield Nevermourn
	{itemid = 10363, type = "equip", slot = "armor", client_version = 850}, -- the rain coat
	{itemid = 10363, type = "deequip", slot = "armor", client_version = 850}, -- the rain coat
	{itemid = 10318, type = "equip", slot = "shield", client_version = 850}, -- the shield Nevermourn
	{itemid = 10318, type = "deequip", slot = "shield", client_version = 850}, -- the shield Nevermourn
	{itemid = 10317, type = "equip", slot = "armor", client_version = 850}, -- the rain coat
	{itemid = 10317, type = "deequip", slot = "armor", client_version = 850}, -- the rain coat
	{itemid = 10316, type = "equip", slot = "head", client_version = 850}, -- mighty helm of green sparks
	{itemid = 10316, type = "deequip", slot = "head", client_version = 850}, -- mighty helm of green sparks
	{itemid = 10313, type = "equip", slot = "hand", client_version = 850}, -- incredible mumpiz slayer
	{itemid = 10313, type = "deequip", slot = "hand", client_version = 850}, -- incredible mumpiz slayer
	{itemid = 10311, type = "equip", slot = "ring", level = 100, client_version = 850}, -- claw of 'The Noxious Spawn'
	{itemid = 10311, type = "deequip", slot = "ring", level = 100, client_version = 850}, -- claw of 'The Noxious Spawn'
	{itemid = 10309, type = "equip", slot = "ring", level = 100, client_version = 850}, -- claw of 'The Noxious Spawn'
	{itemid = 10309, type = "deequip", slot = "ring", level = 100, client_version = 850}, -- claw of 'The Noxious Spawn'
	{itemid = 10304, type = "equip", slot = "hand", client_version = 850}, -- poet's fencing quill
	{itemid = 10304, type = "deequip", slot = "hand", client_version = 850}, -- poet's fencing quill
	{itemid = 10303, type = "equip", slot = "hand", client_version = 850}, -- farmer's avenger
	{itemid = 10303, type = "deequip", slot = "hand", client_version = 850}, -- farmer's avenger
	{itemid = 10302, type = "equip", slot = "hand", client_version = 850}, -- club of the fury
	{itemid = 10302, type = "deequip", slot = "hand", client_version = 850}, -- club of the fury
	{itemid = 10301, type = "equip", slot = "hand", client_version = 850}, -- scythe of the reaper
	{itemid = 10301, type = "deequip", slot = "hand", client_version = 850}, -- scythe of the reaper
	{itemid = 10300, type = "equip", slot = "legs", client_version = 850}, -- trousers of the ancients
	{itemid = 10300, type = "deequip", slot = "legs", client_version = 850}, -- trousers of the ancients
	{itemid = 10299, type = "equip", slot = "head", client_version = 850}, -- helmet of nature
	{itemid = 10299, type = "deequip", slot = "head", client_version = 850}, -- helmet of nature
	{itemid = 10298, type = "equip", slot = "head", client_version = 850}, -- helmet of ultimate terror
	{itemid = 10298, type = "deequip", slot = "head", client_version = 850}, -- helmet of ultimate terror
	{itemid = 10297, type = "equip", slot = "shield", client_version = 850}, -- shield of care
	{itemid = 10297, type = "deequip", slot = "shield", client_version = 850}, -- shield of care
	{itemid = 10296, type = "equip", slot = "armor", client_version = 850}, -- heavy metal t-shirt
	{itemid = 10296, type = "deequip", slot = "armor", client_version = 850}, -- heavy metal t-shirt
	{itemid = 10295, type = "equip", slot = "hand", client_version = 850}, -- musician's bow
	{itemid = 10295, type = "deequip", slot = "hand", client_version = 850}, -- musician's bow
	{itemid = 10294, type = "equip", slot = "shield", client_version = 850}, -- shield of the white knight
	{itemid = 10294, type = "deequip", slot = "shield", client_version = 850}, -- shield of the white knight
	{itemid = 10293, type = "equip", slot = "hand", client_version = 850}, -- stale bread of ancientness
	{itemid = 10293, type = "deequip", slot = "hand", client_version = 850}, -- stale bread of ancientness
	{itemid = 10292, type = "equip", slot = "hand", client_version = 850}, -- pointed rabbitslayer
	{itemid = 10292, type = "deequip", slot = "hand", client_version = 850}, -- pointed rabbitslayer
	{itemid = 10291, type = "equip", slot = "head", client_version = 850}, -- odd hat
	{itemid = 10291, type = "deequip", slot = "head", client_version = 850}, -- odd hat
	{itemid = 10290, type = "equip", slot = "hand", client_version = 850}, -- glutton's mace
	{itemid = 10290, type = "deequip", slot = "hand", client_version = 850}, -- glutton's mace
	{itemid = 10289, type = "equip", slot = "shield", client_version = 850}, -- meat shield
	{itemid = 10289, type = "deequip", slot = "shield", client_version = 850}, -- meat shield
	{itemid = 10221, type = "equip", slot = "necklace", level = 80, client_version = 850}, -- shockwave amulet
	{itemid = 10221, type = "deequip", slot = "necklace", level = 80, client_version = 850}, -- shockwave amulet
	{itemid = 10220, type = "equip", slot = "necklace", level = 80, client_version = 850}, -- leviathan's amulet
	{itemid = 10220, type = "deequip", slot = "necklace", level = 80, client_version = 850}, -- leviathan's amulet
	{itemid = 10219, type = "equip", slot = "necklace", level = 80, client_version = 850}, -- sacred tree amulet
	{itemid = 10219, type = "deequip", slot = "necklace", level = 80, client_version = 850}, -- sacred tree amulet
	{itemid = 10218, type = "equip", slot = "necklace", level = 80, client_version = 850}, -- bonfire amulet
	{itemid = 10218, type = "deequip", slot = "necklace", level = 80, client_version = 850}, -- bonfire amulet
	{itemid = 10139, type = "equip", slot = "head", client_version = 840}, -- laurel wreath
	{itemid = 10139, type = "deequip", slot = "head", client_version = 840}, -- laurel wreath
	{itemid = 10135, type = "equip", slot = "necklace", client_version = 840}, -- bronze medal
	{itemid = 10135, type = "deequip", slot = "necklace", client_version = 840}, -- bronze medal
	{itemid = 10134, type = "equip", slot = "necklace", client_version = 840}, -- silver medal
	{itemid = 10134, type = "deequip", slot = "necklace", client_version = 840}, -- silver medal
	{itemid = 10133, type = "equip", slot = "necklace", client_version = 840}, -- gold medal
	{itemid = 10133, type = "deequip", slot = "necklace", client_version = 840}, -- gold medal
	{itemid = 10070, type = "equip", slot = "backpack", client_version = 840}, -- grey bag
	{itemid = 10070, type = "deequip", slot = "backpack", client_version = 840}, -- grey bag
	{itemid = 10016, type = "equip", slot = "head", level = 50, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 840}, -- batwing hat
	{itemid = 10016, type = "deequip", slot = "head", level = 50, client_version = 840}, -- batwing hat
	{itemid = 9933, type = "equip", slot = "feet", level = 130, client_version = 840}, -- pair firewalker boots
	{itemid = 9933, type = "deequip", slot = "feet", level = 130, client_version = 840}, -- pair firewalker boots
	{itemid = 9932, type = "equip", slot = "feet", level = 130, client_version = 840}, -- firewalker boots
	{itemid = 9932, type = "deequip", slot = "feet", level = 130, client_version = 840}, -- firewalker boots
	{itemid = 9931, type = "equip", slot = "feet", client_version = 840}, -- coconut shoes
	{itemid = 9931, type = "deequip", slot = "feet", client_version = 840}, -- coconut shoes
	{itemid = 9929, type = "equip", slot = "armor", client_version = 840}, -- flower dress
	{itemid = 9929, type = "deequip", slot = "armor", client_version = 840}, -- flower dress
	{itemid = 9928, type = "equip", slot = "legs", client_version = 840}, -- leaf legs
	{itemid = 9928, type = "deequip", slot = "legs", client_version = 840}, -- leaf legs
	{itemid = 9927, type = "equip", slot = "head", client_version = 840}, -- flower wreath
	{itemid = 9927, type = "deequip", slot = "head", client_version = 840}, -- flower wreath
	{itemid = 9778, type = "equip", slot = "head", level = 80, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 840}, -- yalahari mask
	{itemid = 9778, type = "deequip", slot = "head", level = 80, client_version = 840}, -- yalahari mask
	{itemid = 9777, type = "equip", slot = "legs", level = 80, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 840}, -- yalahari leg piece
	{itemid = 9777, type = "deequip", slot = "legs", level = 80, client_version = 840}, -- yalahari leg piece
	{itemid = 9776, type = "equip", slot = "armor", level = 80, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 840}, -- yalahari armor
	{itemid = 9776, type = "deequip", slot = "armor", level = 80, client_version = 840}, -- yalahari armor
	{itemid = 9775, type = "equip", slot = "backpack", client_version = 840}, -- brocade bag
	{itemid = 9775, type = "deequip", slot = "backpack", client_version = 840}, -- brocade bag
	{itemid = 9774, type = "equip", slot = "backpack", client_version = 840}, -- brocade backpack
	{itemid = 9774, type = "deequip", slot = "backpack", client_version = 840}, -- brocade backpack
	{itemid = 9077, type = "equip", slot = "backpack", client_version = 820}, -- golden bag
	{itemid = 9077, type = "deequip", slot = "backpack", client_version = 820}, -- golden bag
	{itemid = 9075, type = "equip", slot = "backpack", client_version = 820}, -- purple bag
	{itemid = 9075, type = "deequip", slot = "backpack", client_version = 820}, -- purple bag
	{itemid = 8932, type = "equip", slot = "hand", client_version = 820}, -- the calamity
	{itemid = 8932, type = "deequip", slot = "hand", client_version = 820}, -- the calamity
	{itemid = 8931, type = "equip", slot = "hand", client_version = 820}, -- the epiphany
	{itemid = 8931, type = "deequip", slot = "hand", client_version = 820}, -- the epiphany
	{itemid = 8930, type = "equip", slot = "hand", client_version = 820}, -- emerald sword
	{itemid = 8930, type = "deequip", slot = "hand", client_version = 820}, -- emerald sword
	{itemid = 8929, type = "equip", slot = "hand", client_version = 820}, -- the stomper
	{itemid = 8929, type = "deequip", slot = "hand", client_version = 820}, -- the stomper
	{itemid = 8928, type = "equip", slot = "hand", client_version = 820}, -- obsidian truncheon
	{itemid = 8928, type = "deequip", slot = "hand", client_version = 820}, -- obsidian truncheon
	{itemid = 8927, type = "equip", slot = "hand", client_version = 820}, -- dark trinity mace
	{itemid = 8927, type = "deequip", slot = "hand", client_version = 820}, -- dark trinity mace
	{itemid = 8926, type = "equip", slot = "hand", client_version = 820}, -- demonwing axe
	{itemid = 8926, type = "deequip", slot = "hand", client_version = 820}, -- demonwing axe
	{itemid = 8925, type = "equip", slot = "hand", client_version = 820}, -- solar axe
	{itemid = 8925, type = "deequip", slot = "hand", client_version = 820}, -- solar axe
	{itemid = 8924, type = "equip", slot = "hand", client_version = 820}, -- hellforged axe
	{itemid = 8924, type = "deequip", slot = "hand", client_version = 820}, -- hellforged axe
	{itemid = 8923, type = "equip", slot = "legs", vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 820}, -- ranger legs
	{itemid = 8923, type = "deequip", slot = "legs", client_version = 820}, -- ranger legs
	{itemid = 8922, type = "equip", slot = "hand", level = 42, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 820}, -- wand of voodoo
	{itemid = 8922, type = "deequip", slot = "hand", level = 42, client_version = 820}, -- wand of voodoo
	{itemid = 8921, type = "equip", slot = "hand", level = 22, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 810}, -- wand of draconia
	{itemid = 8921, type = "deequip", slot = "hand", level = 22, client_version = 810}, -- wand of draconia
	{itemid = 8920, type = "equip", slot = "hand", level = 37, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 820}, -- wand of starmstorm
	{itemid = 8920, type = "deequip", slot = "hand", level = 37, client_version = 820}, -- wand of starmstorm
	{itemid = 8918, type = "equip", slot = "shield", level = 80, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 820}, -- spellbook of dark mysteries
	{itemid = 8918, type = "deequip", slot = "shield", level = 80, client_version = 820}, -- spellbook of dark mysteries
	{itemid = 8912, type = "equip", slot = "hand", level = 37, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 820}, -- springsprout rod
	{itemid = 8912, type = "deequip", slot = "hand", level = 37, client_version = 820}, -- springsprout rod
	{itemid = 8911, type = "equip", slot = "hand", level = 22, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 820}, -- northwind rod
	{itemid = 8911, type = "deequip", slot = "hand", level = 22, client_version = 820}, -- northwind rod
	{itemid = 8910, type = "equip", slot = "hand", level = 42, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 820}, -- underworld rod
	{itemid = 8910, type = "deequip", slot = "hand", level = 42, client_version = 820}, -- underworld rod
	{itemid = 8909, type = "equip", slot = "shield", level = 100, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 820}, -- terran rainbow shield
	{itemid = 8909, type = "deequip", slot = "shield", level = 100, client_version = 820}, -- terran rainbow shield
	{itemid = 8908, type = "equip", slot = "shield", level = 100, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 0}, -- sparking rainbow shield
	{itemid = 8908, type = "deequip", slot = "shield", level = 100, client_version = 0}, -- sparking rainbow shield
	{itemid = 8907, type = "equip", slot = "shield", level = 100, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 820}, -- icy rainbow shield
	{itemid = 8907, type = "deequip", slot = "shield", level = 100, client_version = 820}, -- icy rainbow shield
	{itemid = 8906, type = "equip", slot = "shield", level = 100, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 820}, -- fiery rainbow shield
	{itemid = 8906, type = "deequip", slot = "shield", level = 100, client_version = 820}, -- fiery rainbow shield
	{itemid = 8905, type = "equip", slot = "shield", level = 100, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 820}, -- rainbow shield
	{itemid = 8905, type = "deequip", slot = "shield", level = 100, client_version = 820}, -- rainbow shield
	{itemid = 8904, type = "equip", slot = "shield", level = 70, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 820}, -- spellscroll of prophecies
	{itemid = 8904, type = "deequip", slot = "shield", level = 70, client_version = 820}, -- spellscroll of prophecies
	{itemid = 8903, type = "equip", slot = "shield", level = 60, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 820}, -- spellbook of lost souls
	{itemid = 8903, type = "deequip", slot = "shield", level = 60, client_version = 820}, -- spellbook of lost souls
	{itemid = 8902, type = "equip", slot = "shield", level = 50, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 820}, -- spellbook of mind control
	{itemid = 8902, type = "deequip", slot = "shield", level = 50, client_version = 820}, -- spellbook of mind control
	{itemid = 8901, type = "equip", slot = "shield", level = 40, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 820}, -- spellbook of warding
	{itemid = 8901, type = "deequip", slot = "shield", level = 40, client_version = 820}, -- spellbook of warding
	{itemid = 8900, type = "equip", slot = "shield", level = 30, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 820}, -- spellbook of enlightenment
	{itemid = 8900, type = "deequip", slot = "shield", level = 30, client_version = 820}, -- spellbook of enlightenment
	{itemid = 8892, type = "equip", slot = "armor", vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 820}, -- ethno coat
	{itemid = 8892, type = "deequip", slot = "armor", client_version = 820}, -- ethno coat
	{itemid = 8891, type = "equip", slot = "armor", vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 820}, -- paladin armor
	{itemid = 8891, type = "deequip", slot = "armor", client_version = 820}, -- paladin armor
	{itemid = 8890, type = "equip", slot = "armor", level = 100, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 820}, -- robe of the underworld
	{itemid = 8890, type = "deequip", slot = "armor", level = 100, client_version = 820}, -- robe of the underworld
	{itemid = 8889, type = "equip", slot = "armor", level = 85, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 820}, -- skullcracker armor
	{itemid = 8889, type = "deequip", slot = "armor", level = 85, client_version = 820}, -- skullcracker armor
	{itemid = 8888, type = "equip", slot = "armor", level = 100, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 820}, -- master archer's armor
	{itemid = 8888, type = "deequip", slot = "armor", level = 100, client_version = 820}, -- master archer's armor
	{itemid = 8887, type = "equip", slot = "armor", level = 75, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 820}, -- frozen plate
	{itemid = 8887, type = "deequip", slot = "armor", level = 75, client_version = 820}, -- frozen plate
	{itemid = 8886, type = "equip", slot = "armor", level = 75, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 820}, -- molten plate
	{itemid = 8886, type = "deequip", slot = "armor", level = 75, client_version = 820}, -- molten plate
	{itemid = 8885, type = "equip", slot = "armor", level = 75, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 820}, -- divine plate
	{itemid = 8885, type = "deequip", slot = "armor", level = 75, client_version = 820}, -- divine plate
	{itemid = 8884, type = "equip", slot = "armor", level = 100, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 820}, -- oceanborn leviathan armor
	{itemid = 8884, type = "deequip", slot = "armor", level = 100, client_version = 820}, -- oceanborn leviathan armor
	{itemid = 8883, type = "equip", slot = "armor", level = 100, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 820}, -- windborn colossus armor
	{itemid = 8883, type = "deequip", slot = "armor", level = 100, client_version = 820}, -- windborn colossus armor
	{itemid = 8882, type = "equip", slot = "armor", level = 100, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 820}, -- earthborn titan armor
	{itemid = 8882, type = "deequip", slot = "armor", level = 100, client_version = 820}, -- earthborn titan armor
	{itemid = 8881, type = "equip", slot = "armor", level = 100, vocation = {{"Knight", true}, {"Elite Knight"}}, client_version = 820}, -- fireborn giant armor
	{itemid = 8881, type = "deequip", slot = "armor", level = 100, client_version = 820}, -- fireborn giant armor
	{itemid = 8880, type = "equip", slot = "armor", level = 60, vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 820}, -- swamplair armor
	{itemid = 8880, type = "deequip", slot = "armor", level = 60, client_version = 820}, -- swamplair armor
	{itemid = 8879, type = "equip", slot = "armor", level = 60, vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 820}, -- voltage armor
	{itemid = 8879, type = "deequip", slot = "armor", level = 60, client_version = 820}, -- voltage armor
	{itemid = 8878, type = "equip", slot = "armor", level = 60, vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 820}, -- crystalline armor
	{itemid = 8878, type = "deequip", slot = "armor", level = 60, client_version = 820}, -- crystalline armor
	{itemid = 8877, type = "equip", slot = "armor", level = 60, vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 820}, -- lavos armor
	{itemid = 8877, type = "deequip", slot = "armor", level = 60, client_version = 820}, -- lavos armor
	{itemid = 8876, type = "equip", slot = "armor", client_version = 820}, -- girl's dress
	{itemid = 8876, type = "deequip", slot = "armor", client_version = 820}, -- girl's dress
	{itemid = 8875, type = "equip", slot = "armor", client_version = 820}, -- tunic
	{itemid = 8875, type = "deequip", slot = "armor", client_version = 820}, -- tunic
	{itemid = 8874, type = "equip", slot = "armor", client_version = 820}, -- summer dress
	{itemid = 8874, type = "deequip", slot = "armor", client_version = 820}, -- summer dress
	{itemid = 8873, type = "equip", slot = "armor", client_version = 820}, -- hibiscus dress
	{itemid = 8873, type = "deequip", slot = "armor", client_version = 820}, -- hibiscus dress
	{itemid = 8872, type = "equip", slot = "armor", vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 820}, -- belted cape
	{itemid = 8872, type = "deequip", slot = "armor", client_version = 820}, -- belted cape
	{itemid = 8871, type = "equip", slot = "armor", vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 820}, -- focus cape
	{itemid = 8871, type = "deequip", slot = "armor", client_version = 820}, -- focus cape
	{itemid = 8870, type = "equip", slot = "armor", vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 820}, -- spirit cloak
	{itemid = 8870, type = "deequip", slot = "armor", client_version = 820}, -- spirit cloak
	{itemid = 8869, type = "equip", slot = "armor", level = 75, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 820}, -- greenwood coat
	{itemid = 8869, type = "deequip", slot = "armor", level = 75, client_version = 820}, -- greenwood coat
	{itemid = 8868, type = "equip", slot = "armor", level = 75, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 820}, -- velvet mantle
	{itemid = 8868, type = "deequip", slot = "armor", level = 75, client_version = 820}, -- velvet mantle
	{itemid = 8867, type = "equip", slot = "armor", level = 75, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 820}, -- dragon robe
	{itemid = 8867, type = "deequip", slot = "armor", level = 75, client_version = 820}, -- dragon robe
	{itemid = 8866, type = "equip", slot = "armor", level = 75, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 820}, -- robe of the ice queen
	{itemid = 8866, type = "deequip", slot = "armor", level = 75, client_version = 820}, -- robe of the ice queen
	{itemid = 8865, type = "equip", slot = "armor", level = 65, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 820}, -- dark lord's cape
	{itemid = 8865, type = "deequip", slot = "armor", level = 65, client_version = 820}, -- dark lord's cape
	{itemid = 8858, type = "equip", slot = "hand", client_version = 820}, -- elethriel's elemental bow
	{itemid = 8858, type = "deequip", slot = "hand", client_version = 820}, -- elethriel's elemental bow
	{itemid = 8857, type = "equip", slot = "hand", client_version = 820}, -- silkweaver bow
	{itemid = 8857, type = "deequip", slot = "hand", client_version = 820}, -- silkweaver bow
	{itemid = 8856, type = "equip", slot = "hand", client_version = 820}, -- yol's bow
	{itemid = 8856, type = "deequip", slot = "hand", client_version = 820}, -- yol's bow
	{itemid = 8855, type = "equip", slot = "hand", client_version = 820}, -- composite hornbow
	{itemid = 8855, type = "deequip", slot = "hand", client_version = 820}, -- composite hornbow
	{itemid = 8854, type = "equip", slot = "hand", client_version = 820}, -- warsinger bow
	{itemid = 8854, type = "deequip", slot = "hand", client_version = 820}, -- warsinger bow
	{itemid = 8853, type = "equip", slot = "hand", client_version = 820}, -- ironworker
	{itemid = 8853, type = "deequip", slot = "hand", client_version = 820}, -- ironworker
	{itemid = 8852, type = "equip", slot = "hand", client_version = 820}, -- devileye
	{itemid = 8852, type = "deequip", slot = "hand", client_version = 820}, -- devileye
	{itemid = 8851, type = "equip", slot = "hand", client_version = 820}, -- royal crossbow
	{itemid = 8851, type = "deequip", slot = "hand", client_version = 820}, -- royal crossbow
	{itemid = 8850, type = "equip", slot = "hand", client_version = 820}, -- chain bolter
	{itemid = 8850, type = "deequip", slot = "hand", client_version = 820}, -- chain bolter
	{itemid = 8849, type = "equip", slot = "hand", client_version = 820}, -- modified crossbow
	{itemid = 8849, type = "deequip", slot = "hand", client_version = 820}, -- modified crossbow
	{itemid = 8821, type = "equip", slot = "armor", level = 50, client_version = 820}, -- witchhunter's coat
	{itemid = 8821, type = "deequip", slot = "armor", level = 50, client_version = 820}, -- witchhunter's coat
	{itemid = 8820, type = "equip", slot = "head", vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 820}, -- mage hat
	{itemid = 8820, type = "deequip", slot = "head", client_version = 820}, -- mage hat
	{itemid = 8819, type = "equip", slot = "armor", vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 820}, -- magician's robe
	{itemid = 8819, type = "deequip", slot = "armor", client_version = 820}, -- magician's robe
	{itemid = 8602, type = "equip", slot = "hand", client_version = 820}, -- jagged sword
	{itemid = 8602, type = "deequip", slot = "hand", client_version = 820}, -- jagged sword
	{itemid = 8601, type = "equip", slot = "hand", client_version = 820}, -- steel axe
	{itemid = 8601, type = "deequip", slot = "hand", client_version = 820}, -- steel axe
	{itemid = 8584, type = "equip", slot = "necklace", client_version = 820}, -- Jerom's family necklace
	{itemid = 8584, type = "deequip", slot = "necklace", client_version = 820}, -- Jerom's family necklace
	{itemid = 8266, type = "equip", slot = "necklace", client_version = 810}, -- Koshei's ancient amulet
	{itemid = 8266, type = "deequip", slot = "necklace", client_version = 810}, -- Koshei's ancient amulet
	{itemid = 8209, type = "equip", slot = "hand", client_version = 810}, -- crimson sword
	{itemid = 8209, type = "deequip", slot = "hand", client_version = 810}, -- crimson sword
	{itemid = 7968, type = "equip", slot = "ring", client_version = 870}, -- shapeshifter ring
	{itemid = 7968, type = "deequip", slot = "ring", client_version = 870}, -- shapeshifter ring
	{itemid = 7967, type = "equip", slot = "ring", client_version = 870}, -- shapeshifter ring
	{itemid = 7967, type = "deequip", slot = "ring", client_version = 870}, -- shapeshifter ring
	{itemid = 7957, type = "equip", slot = "head", client_version = 810}, -- jester hat
	{itemid = 7957, type = "deequip", slot = "head", client_version = 810}, -- jester hat
	{itemid = 7903, type = "equip", slot = "head", vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 810}, -- terra hood
	{itemid = 7903, type = "deequip", slot = "head", client_version = 810}, -- terra hood
	{itemid = 7902, type = "equip", slot = "head", vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 810}, -- glacier mask
	{itemid = 7902, type = "deequip", slot = "head", client_version = 810}, -- glacier mask
	{itemid = 7901, type = "equip", slot = "head", vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 810}, -- lightning headband
	{itemid = 7901, type = "deequip", slot = "head", client_version = 810}, -- lightning headband
	{itemid = 7900, type = "equip", slot = "head", vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 810}, -- magma monocle
	{itemid = 7900, type = "deequip", slot = "head", client_version = 810}, -- magma monocle
	{itemid = 7899, type = "equip", slot = "armor", level = 50, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 810}, -- magma coat
	{itemid = 7899, type = "deequip", slot = "armor", level = 50, client_version = 810}, -- magma coat
	{itemid = 7898, type = "equip", slot = "armor", level = 50, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 810}, -- lightning robe
	{itemid = 7898, type = "deequip", slot = "armor", level = 50, client_version = 810}, -- lightning robe
	{itemid = 7897, type = "equip", slot = "armor", level = 50, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 810}, -- glacier robe
	{itemid = 7897, type = "deequip", slot = "armor", level = 50, client_version = 810}, -- glacier robe
	{itemid = 7896, type = "equip", slot = "legs", level = 40, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 810}, -- glacier kilt
	{itemid = 7896, type = "deequip", slot = "legs", level = 40, client_version = 810}, -- glacier kilt
	{itemid = 7895, type = "equip", slot = "legs", level = 40, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 810}, -- lightning legs
	{itemid = 7895, type = "deequip", slot = "legs", level = 40, client_version = 810}, -- lightning legs
	{itemid = 7894, type = "equip", slot = "legs", level = 40, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 810}, -- magma legs
	{itemid = 7894, type = "deequip", slot = "legs", level = 40, client_version = 810}, -- magma legs
	{itemid = 7893, type = "equip", slot = "feet", level = 35, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 810}, -- lightning boots
	{itemid = 7893, type = "deequip", slot = "feet", level = 35, client_version = 810}, -- lightning boots
	{itemid = 7892, type = "equip", slot = "feet", level = 35, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 810}, -- glacier shoes
	{itemid = 7892, type = "deequip", slot = "feet", level = 35, client_version = 810}, -- glacier shoes
	{itemid = 7891, type = "equip", slot = "feet", level = 35, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 810}, -- magma boots
	{itemid = 7891, type = "deequip", slot = "feet", level = 35, client_version = 810}, -- magma boots
	{itemid = 7890, type = "equip", slot = "necklace", level = 60, client_version = 810}, -- magma amulet
	{itemid = 7890, type = "deequip", slot = "necklace", level = 60, client_version = 810}, -- magma amulet
	{itemid = 7889, type = "equip", slot = "necklace", level = 60, client_version = 810}, -- lightning pendant
	{itemid = 7889, type = "deequip", slot = "necklace", level = 60, client_version = 810}, -- lightning pendant
	{itemid = 7888, type = "equip", slot = "necklace", level = 60, client_version = 810}, -- glacier amulet
	{itemid = 7888, type = "deequip", slot = "necklace", level = 60, client_version = 810}, -- glacier amulet
	{itemid = 7887, type = "equip", slot = "necklace", level = 60, client_version = 810}, -- terra amulet
	{itemid = 7887, type = "deequip", slot = "necklace", level = 60, client_version = 810}, -- terra amulet
	{itemid = 7886, type = "equip", slot = "feet", level = 35, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 810}, -- terra boots
	{itemid = 7886, type = "deequip", slot = "feet", level = 35, client_version = 810}, -- terra boots
	{itemid = 7885, type = "equip", slot = "legs", level = 40, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 810}, -- terra legs
	{itemid = 7885, type = "deequip", slot = "legs", level = 40, client_version = 810}, -- terra legs
	{itemid = 7884, type = "equip", slot = "armor", level = 50, vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 810}, -- terra mantle
	{itemid = 7884, type = "deequip", slot = "armor", level = 50, client_version = 810}, -- terra mantle
	{itemid = 7883, type = "equip", slot = "hand", client_version = 810}, -- energy war hammer
	{itemid = 7883, type = "deequip", slot = "hand", client_version = 810}, -- energy war hammer
	{itemid = 7882, type = "equip", slot = "hand", client_version = 810}, -- energy orcish maul
	{itemid = 7882, type = "deequip", slot = "hand", client_version = 810}, -- energy orcish maul
	{itemid = 7881, type = "equip", slot = "hand", client_version = 810}, -- energy cranial basher
	{itemid = 7881, type = "deequip", slot = "hand", client_version = 810}, -- energy cranial basher
	{itemid = 7880, type = "equip", slot = "hand", client_version = 810}, -- energy crystal mace
	{itemid = 7880, type = "deequip", slot = "hand", client_version = 810}, -- energy crystal mace
	{itemid = 7879, type = "equip", slot = "hand", client_version = 810}, -- energy clerical mace
	{itemid = 7879, type = "deequip", slot = "hand", client_version = 810}, -- energy clerical mace
	{itemid = 7878, type = "equip", slot = "hand", client_version = 810}, -- energy war axe
	{itemid = 7878, type = "deequip", slot = "hand", client_version = 810}, -- energy war axe
	{itemid = 7877, type = "equip", slot = "hand", client_version = 810}, -- energy headchopper
	{itemid = 7877, type = "deequip", slot = "hand", client_version = 810}, -- energy headchopper
	{itemid = 7876, type = "equip", slot = "hand", client_version = 810}, -- energy heroic axe
	{itemid = 7876, type = "deequip", slot = "hand", client_version = 810}, -- energy heroic axe
	{itemid = 7875, type = "equip", slot = "hand", client_version = 810}, -- energy knight axe
	{itemid = 7875, type = "deequip", slot = "hand", client_version = 810}, -- energy knight axe
	{itemid = 7874, type = "equip", slot = "hand", client_version = 810}, -- energy barbarian axe
	{itemid = 7874, type = "deequip", slot = "hand", client_version = 810}, -- energy barbarian axe
	{itemid = 7873, type = "equip", slot = "hand", client_version = 810}, -- energy dragon slayer
	{itemid = 7873, type = "deequip", slot = "hand", client_version = 810}, -- energy dragon slayer
	{itemid = 7872, type = "equip", slot = "hand", client_version = 810}, -- energy blacksteel sword
	{itemid = 7872, type = "deequip", slot = "hand", client_version = 810}, -- energy blacksteel sword
	{itemid = 7871, type = "equip", slot = "hand", client_version = 810}, -- energy mystic blade
	{itemid = 7871, type = "deequip", slot = "hand", client_version = 810}, -- energy mystic blade
	{itemid = 7870, type = "equip", slot = "hand", client_version = 810}, -- energy relic sword
	{itemid = 7870, type = "deequip", slot = "hand", client_version = 810}, -- energy relic sword
	{itemid = 7869, type = "equip", slot = "hand", client_version = 810}, -- energy spike sword
	{itemid = 7869, type = "deequip", slot = "hand", client_version = 810}, -- energy spike sword
	{itemid = 7868, type = "equip", slot = "hand", client_version = 810}, -- earth war hammer
	{itemid = 7868, type = "deequip", slot = "hand", client_version = 810}, -- earth war hammer
	{itemid = 7867, type = "equip", slot = "hand", client_version = 810}, -- earth orcish maul
	{itemid = 7867, type = "deequip", slot = "hand", client_version = 810}, -- earth orcish maul
	{itemid = 7866, type = "equip", slot = "hand", client_version = 810}, -- earth cranial basher
	{itemid = 7866, type = "deequip", slot = "hand", client_version = 810}, -- earth cranial basher
	{itemid = 7865, type = "equip", slot = "hand", client_version = 810}, -- earth crystal mace
	{itemid = 7865, type = "deequip", slot = "hand", client_version = 810}, -- earth crystal mace
	{itemid = 7864, type = "equip", slot = "hand", client_version = 810}, -- earth clerical mace
	{itemid = 7864, type = "deequip", slot = "hand", client_version = 810}, -- earth clerical mace
	{itemid = 7863, type = "equip", slot = "hand", client_version = 810}, -- earth war axe
	{itemid = 7863, type = "deequip", slot = "hand", client_version = 810}, -- earth war axe
	{itemid = 7862, type = "equip", slot = "hand", client_version = 810}, -- earth headchopper
	{itemid = 7862, type = "deequip", slot = "hand", client_version = 810}, -- earth headchopper
	{itemid = 7861, type = "equip", slot = "hand", client_version = 810}, -- earth heroic axe
	{itemid = 7861, type = "deequip", slot = "hand", client_version = 810}, -- earth heroic axe
	{itemid = 7860, type = "equip", slot = "hand", client_version = 810}, -- earth knight axe
	{itemid = 7860, type = "deequip", slot = "hand", client_version = 810}, -- earth knight axe
	{itemid = 7859, type = "equip", slot = "hand", client_version = 810}, -- earth barbarian axe
	{itemid = 7859, type = "deequip", slot = "hand", client_version = 810}, -- earth barbarian axe
	{itemid = 7858, type = "equip", slot = "hand", client_version = 810}, -- earth dragon slayer
	{itemid = 7858, type = "deequip", slot = "hand", client_version = 810}, -- earth dragon slayer
	{itemid = 7857, type = "equip", slot = "hand", client_version = 810}, -- earth blacksteel sword
	{itemid = 7857, type = "deequip", slot = "hand", client_version = 810}, -- earth blacksteel sword
	{itemid = 7856, type = "equip", slot = "hand", client_version = 810}, -- earth mystic blade
	{itemid = 7856, type = "deequip", slot = "hand", client_version = 810}, -- earth mystic blade
	{itemid = 7855, type = "equip", slot = "hand", client_version = 810}, -- earth relic sword
	{itemid = 7855, type = "deequip", slot = "hand", client_version = 810}, -- earth relic sword
	{itemid = 7854, type = "equip", slot = "hand", client_version = 810}, -- earth spike sword
	{itemid = 7854, type = "deequip", slot = "hand", client_version = 810}, -- earth spike sword
	{itemid = 7850, type = "equip", slot = "ammo", client_version = 810}, -- earth arrow
	{itemid = 7850, type = "deequip", slot = "ammo", client_version = 810}, -- earth arrow
	{itemid = 7840, type = "equip", slot = "ammo", client_version = 810}, -- flaming arrow
	{itemid = 7840, type = "deequip", slot = "ammo", client_version = 810}, -- flaming arrow
	{itemid = 7839, type = "equip", slot = "ammo", client_version = 810}, -- shiver arrow
	{itemid = 7839, type = "deequip", slot = "ammo", client_version = 810}, -- shiver arrow
	{itemid = 7838, type = "equip", slot = "ammo", client_version = 810}, -- flash arrow
	{itemid = 7838, type = "deequip", slot = "ammo", client_version = 810}, -- flash arrow
	{itemid = 7777, type = "equip", slot = "hand", client_version = 810}, -- icy war hammer
	{itemid = 7777, type = "deequip", slot = "hand", client_version = 810}, -- icy war hammer
	{itemid = 7776, type = "equip", slot = "hand", client_version = 810}, -- icy orcish maul
	{itemid = 7776, type = "deequip", slot = "hand", client_version = 810}, -- icy orcish maul
	{itemid = 7775, type = "equip", slot = "hand", client_version = 810}, -- icy cranial basher
	{itemid = 7775, type = "deequip", slot = "hand", client_version = 810}, -- icy cranial basher
	{itemid = 7774, type = "equip", slot = "hand", client_version = 810}, -- icy crystal mace
	{itemid = 7774, type = "deequip", slot = "hand", client_version = 810}, -- icy crystal mace
	{itemid = 7773, type = "equip", slot = "hand", client_version = 810}, -- icy clerical mace
	{itemid = 7773, type = "deequip", slot = "hand", client_version = 810}, -- icy clerical mace
	{itemid = 7772, type = "equip", slot = "hand", client_version = 810}, -- icy war axe
	{itemid = 7772, type = "deequip", slot = "hand", client_version = 810}, -- icy war axe
	{itemid = 7771, type = "equip", slot = "hand", client_version = 810}, -- icy headchopper
	{itemid = 7771, type = "deequip", slot = "hand", client_version = 810}, -- icy headchopper
	{itemid = 7770, type = "equip", slot = "hand", client_version = 810}, -- icy heroic axe
	{itemid = 7770, type = "deequip", slot = "hand", client_version = 810}, -- icy heroic axe
	{itemid = 7769, type = "equip", slot = "hand", client_version = 810}, -- icy knight axe
	{itemid = 7769, type = "deequip", slot = "hand", client_version = 810}, -- icy knight axe
	{itemid = 7768, type = "equip", slot = "hand", client_version = 810}, -- icy barbarian axe
	{itemid = 7768, type = "deequip", slot = "hand", client_version = 810}, -- icy barbarian axe
	{itemid = 7767, type = "equip", slot = "hand", client_version = 810}, -- icy dragon slayer
	{itemid = 7767, type = "deequip", slot = "hand", client_version = 810}, -- icy dragon slayer
	{itemid = 7766, type = "equip", slot = "hand", client_version = 810}, -- icy blacksteel sword
	{itemid = 7766, type = "deequip", slot = "hand", client_version = 810}, -- icy blacksteel sword
	{itemid = 7765, type = "equip", slot = "hand", client_version = 810}, -- icy mystic blade
	{itemid = 7765, type = "deequip", slot = "hand", client_version = 810}, -- icy mystic blade
	{itemid = 7764, type = "equip", slot = "hand", client_version = 810}, -- icy relic sword
	{itemid = 7764, type = "deequip", slot = "hand", client_version = 810}, -- icy relic sword
	{itemid = 7763, type = "equip", slot = "hand", client_version = 810}, -- icy spike sword
	{itemid = 7763, type = "deequip", slot = "hand", client_version = 810}, -- icy spike sword
	{itemid = 7758, type = "equip", slot = "hand", client_version = 810}, -- fiery war hammer
	{itemid = 7758, type = "deequip", slot = "hand", client_version = 810}, -- fiery war hammer
	{itemid = 7757, type = "equip", slot = "hand", client_version = 810}, -- fiery orcish maul
	{itemid = 7757, type = "deequip", slot = "hand", client_version = 810}, -- fiery orcish maul
	{itemid = 7756, type = "equip", slot = "hand", client_version = 810}, -- fiery cranial basher
	{itemid = 7756, type = "deequip", slot = "hand", client_version = 810}, -- fiery cranial basher
	{itemid = 7755, type = "equip", slot = "hand", client_version = 810}, -- fiery crystal mace
	{itemid = 7755, type = "deequip", slot = "hand", client_version = 810}, -- fiery crystal mace
	{itemid = 7754, type = "equip", slot = "hand", client_version = 810}, -- fiery clerical mace
	{itemid = 7754, type = "deequip", slot = "hand", client_version = 810}, -- fiery clerical mace
	{itemid = 7753, type = "equip", slot = "hand", client_version = 810}, -- fiery war axe
	{itemid = 7753, type = "deequip", slot = "hand", client_version = 810}, -- fiery war axe
	{itemid = 7752, type = "equip", slot = "hand", client_version = 810}, -- fiery headchopper
	{itemid = 7752, type = "deequip", slot = "hand", client_version = 810}, -- fiery headchopper
	{itemid = 7751, type = "equip", slot = "hand", client_version = 810}, -- fiery heroic axe
	{itemid = 7751, type = "deequip", slot = "hand", client_version = 810}, -- fiery heroic axe
	{itemid = 7750, type = "equip", slot = "hand", client_version = 810}, -- fiery knight axe
	{itemid = 7750, type = "deequip", slot = "hand", client_version = 810}, -- fiery knight axe
	{itemid = 7749, type = "equip", slot = "hand", client_version = 810}, -- fiery barbarian axe
	{itemid = 7749, type = "deequip", slot = "hand", client_version = 810}, -- fiery barbarian axe
	{itemid = 7748, type = "equip", slot = "hand", client_version = 810}, -- fiery dragon slayer
	{itemid = 7748, type = "deequip", slot = "hand", client_version = 810}, -- fiery dragon slayer
	{itemid = 7747, type = "equip", slot = "hand", client_version = 810}, -- fiery blacksteel sword
	{itemid = 7747, type = "deequip", slot = "hand", client_version = 810}, -- fiery blacksteel sword
	{itemid = 7746, type = "equip", slot = "hand", client_version = 810}, -- fiery mystic blade
	{itemid = 7746, type = "deequip", slot = "hand", client_version = 810}, -- fiery mystic blade
	{itemid = 7745, type = "equip", slot = "hand", client_version = 810}, -- fiery relic sword
	{itemid = 7745, type = "deequip", slot = "hand", client_version = 810}, -- fiery relic sword
	{itemid = 7744, type = "equip", slot = "hand", client_version = 810}, -- fiery spike sword
	{itemid = 7744, type = "deequip", slot = "hand", client_version = 810}, -- fiery spike sword
	{itemid = 7730, type = "equip", slot = "legs", client_version = 810}, -- blue legs
	{itemid = 7730, type = "deequip", slot = "legs", client_version = 810}, -- blue legs
	{itemid = 7708, type = "equip", slot = "ring", client_version = 810}, -- suspicious signet ring
	{itemid = 7708, type = "deequip", slot = "ring", client_version = 810}, -- suspicious signet ring
	{itemid = 7697, type = "equip", slot = "ring", client_version = 810}, -- family signet ring
	{itemid = 7697, type = "deequip", slot = "ring", client_version = 810}, -- family signet ring
	{itemid = 7497, type = "equip", slot = "head", client_version = 810}, -- mining helmet
	{itemid = 7497, type = "deequip", slot = "head", client_version = 810}, -- mining helmet
	{itemid = 7464, type = "equip", slot = "legs", client_version = 800}, -- mammoth fur shorts
	{itemid = 7464, type = "deequip", slot = "legs", client_version = 800}, -- mammoth fur shorts
	{itemid = 7463, type = "equip", slot = "armor", client_version = 800}, -- mammoth fur cape
	{itemid = 7463, type = "deequip", slot = "armor", client_version = 800}, -- mammoth fur cape
	{itemid = 7462, type = "equip", slot = "head", client_version = 800}, -- ragnir helmet
	{itemid = 7462, type = "deequip", slot = "head", client_version = 800}, -- ragnir helmet
	{itemid = 7461, type = "equip", slot = "head", client_version = 800}, -- krimhorn helmet
	{itemid = 7461, type = "deequip", slot = "head", client_version = 800}, -- krimhorn helmet
	{itemid = 7460, type = "equip", slot = "shield", client_version = 800}, -- norse shield
	{itemid = 7460, type = "deequip", slot = "shield", client_version = 800}, -- norse shield
	{itemid = 7459, type = "equip", slot = "head", client_version = 800}, -- pair of earmuffs
	{itemid = 7459, type = "deequip", slot = "head", client_version = 800}, -- pair of earmuffs
	{itemid = 7458, type = "equip", slot = "head", client_version = 800}, -- fur cap
	{itemid = 7458, type = "deequip", slot = "head", client_version = 800}, -- fur cap
	{itemid = 7457, type = "equip", slot = "feet", client_version = 800}, -- fur boots
	{itemid = 7457, type = "deequip", slot = "feet", client_version = 800}, -- fur boots
	{itemid = 7456, type = "equip", slot = "hand", client_version = 800}, -- noble axe
	{itemid = 7456, type = "deequip", slot = "hand", client_version = 800}, -- noble axe
	{itemid = 7455, type = "equip", slot = "hand", client_version = 800}, -- mythril axe
	{itemid = 7455, type = "deequip", slot = "hand", client_version = 800}, -- mythril axe
	{itemid = 7454, type = "equip", slot = "hand", client_version = 800}, -- glorious axe
	{itemid = 7454, type = "deequip", slot = "hand", client_version = 800}, -- glorious axe
	{itemid = 7453, type = "equip", slot = "hand", client_version = 800}, -- executioner
	{itemid = 7453, type = "deequip", slot = "hand", client_version = 800}, -- executioner
	{itemid = 7452, type = "equip", slot = "hand", client_version = 800}, -- spiked squelcher
	{itemid = 7452, type = "deequip", slot = "hand", client_version = 800}, -- spiked squelcher
	{itemid = 7451, type = "equip", slot = "hand", client_version = 800}, -- shadow sceptre
	{itemid = 7451, type = "deequip", slot = "hand", client_version = 800}, -- shadow sceptre
	{itemid = 7450, type = "equip", slot = "hand", client_version = 800}, -- hammer of prophecy
	{itemid = 7450, type = "deequip", slot = "hand", client_version = 800}, -- hammer of prophecy
	{itemid = 7449, type = "equip", slot = "hand", client_version = 800}, -- crystal sword
	{itemid = 7449, type = "deequip", slot = "hand", client_version = 800}, -- crystal sword
	{itemid = 7438, type = "equip", slot = "hand", client_version = 800}, -- elvish bow
	{itemid = 7438, type = "deequip", slot = "hand", client_version = 800}, -- elvish bow
	{itemid = 7437, type = "equip", slot = "hand", client_version = 800}, -- sapphire hammer
	{itemid = 7437, type = "deequip", slot = "hand", client_version = 800}, -- sapphire hammer
	{itemid = 7436, type = "equip", slot = "hand", client_version = 800}, -- angelic axe
	{itemid = 7436, type = "deequip", slot = "hand", client_version = 800}, -- angelic axe
	{itemid = 7435, type = "equip", slot = "hand", client_version = 800}, -- impaler
	{itemid = 7435, type = "deequip", slot = "hand", client_version = 800}, -- impaler
	{itemid = 7434, type = "equip", slot = "hand", client_version = 800}, -- royal axe
	{itemid = 7434, type = "deequip", slot = "hand", client_version = 800}, -- royal axe
	{itemid = 7433, type = "equip", slot = "hand", client_version = 800}, -- ravenwing
	{itemid = 7433, type = "deequip", slot = "hand", client_version = 800}, -- ravenwing
	{itemid = 7432, type = "equip", slot = "hand", client_version = 800}, -- furry club
	{itemid = 7432, type = "deequip", slot = "hand", client_version = 800}, -- furry club
	{itemid = 7431, type = "equip", slot = "hand", client_version = 800}, -- demonbone
	{itemid = 7431, type = "deequip", slot = "hand", client_version = 800}, -- demonbone
	{itemid = 7430, type = "equip", slot = "hand", client_version = 800}, -- dragonbone staff
	{itemid = 7430, type = "deequip", slot = "hand", client_version = 800}, -- dragonbone staff
	{itemid = 7429, type = "equip", slot = "hand", client_version = 800}, -- blessed sceptre
	{itemid = 7429, type = "deequip", slot = "hand", client_version = 800}, -- blessed sceptre
	{itemid = 7428, type = "equip", slot = "hand", client_version = 800}, -- bonebreaker
	{itemid = 7428, type = "deequip", slot = "hand", client_version = 800}, -- bonebreaker
	{itemid = 7427, type = "equip", slot = "hand", client_version = 800}, -- chaos mace
	{itemid = 7427, type = "deequip", slot = "hand", client_version = 800}, -- chaos mace
	{itemid = 7426, type = "equip", slot = "hand", client_version = 800}, -- amber staff
	{itemid = 7426, type = "deequip", slot = "hand", client_version = 800}, -- amber staff
	{itemid = 7425, type = "equip", slot = "hand", client_version = 800}, -- taurus mace
	{itemid = 7425, type = "deequip", slot = "hand", client_version = 800}, -- taurus mace
	{itemid = 7424, type = "equip", slot = "hand", client_version = 800}, -- lunar staff
	{itemid = 7424, type = "deequip", slot = "hand", client_version = 800}, -- lunar staff
	{itemid = 7423, type = "equip", slot = "hand", client_version = 800}, -- skullcrusher
	{itemid = 7423, type = "deequip", slot = "hand", client_version = 800}, -- skullcrusher
	{itemid = 7422, type = "equip", slot = "hand", client_version = 800}, -- jade hammer
	{itemid = 7422, type = "deequip", slot = "hand", client_version = 800}, -- jade hammer
	{itemid = 7421, type = "equip", slot = "hand", client_version = 800}, -- onyx flail
	{itemid = 7421, type = "deequip", slot = "hand", client_version = 800}, -- onyx flail
	{itemid = 7420, type = "equip", slot = "hand", client_version = 800}, -- reaper's axe
	{itemid = 7420, type = "deequip", slot = "hand", client_version = 800}, -- reaper's axe
	{itemid = 7419, type = "equip", slot = "hand", client_version = 800}, -- dreaded cleaver
	{itemid = 7419, type = "deequip", slot = "hand", client_version = 800}, -- dreaded cleaver
	{itemid = 7418, type = "equip", slot = "hand", client_version = 800}, -- nightmare blade
	{itemid = 7418, type = "deequip", slot = "hand", client_version = 800}, -- nightmare blade
	{itemid = 7417, type = "equip", slot = "hand", client_version = 800}, -- runed sword
	{itemid = 7417, type = "deequip", slot = "hand", client_version = 800}, -- runed sword
	{itemid = 7416, type = "equip", slot = "hand", client_version = 800}, -- bloody edge
	{itemid = 7416, type = "deequip", slot = "hand", client_version = 800}, -- bloody edge
	{itemid = 7415, type = "equip", slot = "hand", client_version = 800}, -- cranial basher
	{itemid = 7415, type = "deequip", slot = "hand", client_version = 800}, -- cranial basher
	{itemid = 7414, type = "equip", slot = "hand", client_version = 800}, -- abyss hammer
	{itemid = 7414, type = "deequip", slot = "hand", client_version = 800}, -- abyss hammer
	{itemid = 7413, type = "equip", slot = "hand", client_version = 800}, -- titan axe
	{itemid = 7413, type = "deequip", slot = "hand", client_version = 800}, -- titan axe
	{itemid = 7412, type = "equip", slot = "hand", client_version = 800}, -- butcher's axe
	{itemid = 7412, type = "deequip", slot = "hand", client_version = 800}, -- butcher's axe
	{itemid = 7411, type = "equip", slot = "hand", client_version = 800}, -- ornamented axe
	{itemid = 7411, type = "deequip", slot = "hand", client_version = 800}, -- ornamented axe
	{itemid = 7410, type = "equip", slot = "hand", client_version = 800}, -- queen's sceptre
	{itemid = 7410, type = "deequip", slot = "hand", client_version = 800}, -- queen's sceptre
	{itemid = 7409, type = "equip", slot = "hand", client_version = 800}, -- northern star
	{itemid = 7409, type = "deequip", slot = "hand", client_version = 800}, -- northern star
	{itemid = 7408, type = "equip", slot = "hand", client_version = 800}, -- wyvern fang
	{itemid = 7408, type = "deequip", slot = "hand", client_version = 800}, -- wyvern fang
	{itemid = 7407, type = "equip", slot = "hand", client_version = 800}, -- haunted blade
	{itemid = 7407, type = "deequip", slot = "hand", client_version = 800}, -- haunted blade
	{itemid = 7406, type = "equip", slot = "hand", client_version = 800}, -- blacksteel sword
	{itemid = 7406, type = "deequip", slot = "hand", client_version = 800}, -- blacksteel sword
	{itemid = 7405, type = "equip", slot = "hand", client_version = 800}, -- havoc blade
	{itemid = 7405, type = "deequip", slot = "hand", client_version = 800}, -- havoc blade
	{itemid = 7404, type = "equip", slot = "hand", client_version = 800}, -- assassin dagger
	{itemid = 7404, type = "deequip", slot = "hand", client_version = 800}, -- assassin dagger
	{itemid = 7403, type = "equip", slot = "hand", client_version = 800}, -- berserker
	{itemid = 7403, type = "deequip", slot = "hand", client_version = 800}, -- berserker
	{itemid = 7402, type = "equip", slot = "hand", client_version = 800}, -- dragon slayer
	{itemid = 7402, type = "deequip", slot = "hand", client_version = 800}, -- dragon slayer
	{itemid = 7392, type = "equip", slot = "hand", client_version = 800}, -- orcish maul
	{itemid = 7392, type = "deequip", slot = "hand", client_version = 800}, -- orcish maul
	{itemid = 7391, type = "equip", slot = "hand", client_version = 800}, -- thaian sword
	{itemid = 7391, type = "deequip", slot = "hand", client_version = 800}, -- thaian sword
	{itemid = 7390, type = "equip", slot = "hand", client_version = 800}, -- the justice seeker
	{itemid = 7390, type = "deequip", slot = "hand", client_version = 800}, -- the justice seeker
	{itemid = 7389, type = "equip", slot = "hand", client_version = 800}, -- heroic axe
	{itemid = 7389, type = "deequip", slot = "hand", client_version = 800}, -- heroic axe
	{itemid = 7388, type = "equip", slot = "hand", client_version = 800}, -- vile axe
	{itemid = 7388, type = "deequip", slot = "hand", client_version = 800}, -- vile axe
	{itemid = 7387, type = "equip", slot = "hand", client_version = 800}, -- diamond sceptre
	{itemid = 7387, type = "deequip", slot = "hand", client_version = 800}, -- diamond sceptre
	{itemid = 7386, type = "equip", slot = "hand", client_version = 800}, -- mercenary sword
	{itemid = 7386, type = "deequip", slot = "hand", client_version = 800}, -- mercenary sword
	{itemid = 7385, type = "equip", slot = "hand", client_version = 800}, -- crimson sword
	{itemid = 7385, type = "deequip", slot = "hand", client_version = 800}, -- crimson sword
	{itemid = 7384, type = "equip", slot = "hand", client_version = 800}, -- mystic blade
	{itemid = 7384, type = "deequip", slot = "hand", client_version = 800}, -- mystic blade
	{itemid = 7383, type = "equip", slot = "hand", client_version = 800}, -- relic sword
	{itemid = 7383, type = "deequip", slot = "hand", client_version = 800}, -- relic sword
	{itemid = 7382, type = "equip", slot = "hand", client_version = 800}, -- demonrage sword
	{itemid = 7382, type = "deequip", slot = "hand", client_version = 800}, -- demonrage sword
	{itemid = 7381, type = "equip", slot = "hand", client_version = 800}, -- mammoth whopper
	{itemid = 7381, type = "deequip", slot = "hand", client_version = 800}, -- mammoth whopper
	{itemid = 7380, type = "equip", slot = "hand", client_version = 800}, -- headchopper
	{itemid = 7380, type = "deequip", slot = "hand", client_version = 800}, -- headchopper
	{itemid = 7379, type = "equip", slot = "hand", client_version = 800}, -- brutetamer's staff
	{itemid = 7379, type = "deequip", slot = "hand", client_version = 800}, -- brutetamer's staff
	{itemid = 7378, type = "equip", slot = "hand", client_version = 800}, -- royal spear
	{itemid = 7378, type = "deequip", slot = "hand", client_version = 800}, -- royal spear
	{itemid = 7368, type = "equip", slot = "hand", client_version = 800}, -- assassin star
	{itemid = 7368, type = "deequip", slot = "hand", client_version = 800}, -- assassin star
	{itemid = 7367, type = "equip", slot = "hand", client_version = 800}, -- enchanted spear
	{itemid = 7367, type = "deequip", slot = "hand", client_version = 800}, -- enchanted spear
	{itemid = 7365, type = "equip", slot = "ammo", client_version = 800}, -- onyx arrow
	{itemid = 7365, type = "deequip", slot = "ammo", client_version = 800}, -- onyx arrow
	{itemid = 7364, type = "equip", slot = "ammo", client_version = 800}, -- sniper arrow
	{itemid = 7364, type = "deequip", slot = "ammo", client_version = 800}, -- sniper arrow
	{itemid = 7363, type = "equip", slot = "ammo", client_version = 800}, -- piercing bolt
	{itemid = 7363, type = "deequip", slot = "ammo", client_version = 800}, -- piercing bolt
	{itemid = 7360, type = "additem", client_version = 0}, -- flame of life
	{itemid = 7359, type = "stepin", client_version = 0}, -- flame of life
	{itemid = 7343, type = "equip", slot = "backpack", client_version = 800}, -- fur bag
	{itemid = 7343, type = "deequip", slot = "backpack", client_version = 800}, -- fur bag
	{itemid = 7342, type = "equip", slot = "backpack", client_version = 800}, -- fur backpack
	{itemid = 7342, type = "deequip", slot = "backpack", client_version = 800}, -- fur backpack
	{itemid = 6578, type = "equip", slot = "head", client_version = 792}, -- party hat
	{itemid = 6578, type = "deequip", slot = "head", client_version = 792}, -- party hat
	{itemid = 6553, type = "equip", slot = "hand", client_version = 790}, -- ruthless axe
	{itemid = 6553, type = "deequip", slot = "hand", client_version = 790}, -- ruthless axe
	{itemid = 6531, type = "equip", slot = "head", client_version = 790}, -- santa hat
	{itemid = 6531, type = "deequip", slot = "head", client_version = 790}, -- santa hat
	{itemid = 6529, type = "equip", slot = "ammo", client_version = 790}, -- infernal bolt
	{itemid = 6529, type = "deequip", slot = "ammo", client_version = 790}, -- infernal bolt
	{itemid = 6528, type = "equip", slot = "hand", client_version = 790}, -- the avenger
	{itemid = 6528, type = "deequip", slot = "hand", client_version = 790}, -- the avenger
	{itemid = 6433, type = "equip", slot = "shield", client_version = 790}, -- necromancer shield
	{itemid = 6433, type = "deequip", slot = "shield", client_version = 790}, -- necromancer shield
	{itemid = 6391, type = "equip", slot = "shield", client_version = 790}, -- nightmare shield
	{itemid = 6391, type = "deequip", slot = "shield", client_version = 790}, -- nightmare shield
	{itemid = 6301, type = "equip", slot = "ring", client_version = 790}, -- death ring
	{itemid = 6301, type = "deequip", slot = "ring", client_version = 790}, -- death ring
	{itemid = 6300, type = "equip", slot = "ring", client_version = 790}, -- death ring
	{itemid = 6300, type = "deequip", slot = "ring", client_version = 790}, -- death ring
	{itemid = 6132, type = "equip", slot = "feet", level = 180, client_version = 710}, -- pair of soft boots
	{itemid = 6132, type = "deequip", slot = "feet", level = 180, client_version = 710}, -- pair of soft boots
	{itemid = 6131, type = "equip", slot = "shield", client_version = 780}, -- tortoise shield
	{itemid = 6131, type = "deequip", slot = "shield", client_version = 780}, -- tortoise shield
	{itemid = 6120, type = "equip", slot = "shield", client_version = 780}, -- Dragha's spellbook
	{itemid = 6120, type = "deequip", slot = "shield", client_version = 780}, -- Dragha's spellbook
	{itemid = 6101, type = "equip", slot = "hand", client_version = 780}, -- Ron the Ripper's sabre
	{itemid = 6101, type = "deequip", slot = "hand", client_version = 780}, -- Ron the Ripper's sabre
	{itemid = 6096, type = "equip", slot = "head", client_version = 780}, -- pirate hat
	{itemid = 6096, type = "deequip", slot = "head", client_version = 780}, -- pirate hat
	{itemid = 6095, type = "equip", slot = "armor", client_version = 780}, -- pirate shirt
	{itemid = 6095, type = "deequip", slot = "armor", client_version = 780}, -- pirate shirt
	{itemid = 5950, type = "equip", slot = "backpack", client_version = 780}, -- beach bag
	{itemid = 5950, type = "deequip", slot = "backpack", client_version = 780}, -- beach bag
	{itemid = 5949, type = "equip", slot = "backpack", client_version = 780}, -- beach backpack
	{itemid = 5949, type = "deequip", slot = "backpack", client_version = 780}, -- beach backpack
	{itemid = 5927, type = "equip", slot = "backpack", client_version = 780}, -- pirate bag
	{itemid = 5927, type = "deequip", slot = "backpack", client_version = 780}, -- pirate bag
	{itemid = 5926, type = "equip", slot = "backpack", client_version = 780}, -- pirate backpack
	{itemid = 5926, type = "deequip", slot = "backpack", client_version = 780}, -- pirate backpack
	{itemid = 5918, type = "equip", slot = "legs", client_version = 780}, -- pirate knee breeches
	{itemid = 5918, type = "deequip", slot = "legs", client_version = 780}, -- pirate knee breeches
	{itemid = 5917, type = "equip", slot = "head", client_version = 780}, -- bandana
	{itemid = 5917, type = "deequip", slot = "head", client_version = 780}, -- bandana
	{itemid = 5903, type = "equip", slot = "head", client_version = 780}, -- Ferumbras' hat
	{itemid = 5903, type = "deequip", slot = "head", client_version = 780}, -- Ferumbras' hat
	{itemid = 5803, type = "equip", slot = "hand", client_version = 780}, -- arbalest
	{itemid = 5803, type = "deequip", slot = "hand", client_version = 780}, -- arbalest
	{itemid = 5801, type = "equip", slot = "backpack", client_version = 860}, -- jewelled backpack
	{itemid = 5801, type = "deequip", slot = "backpack", client_version = 860}, -- jewelled backpack
	{itemid = 5741, type = "equip", slot = "head", client_version = 780}, -- skull helmet
	{itemid = 5741, type = "deequip", slot = "head", client_version = 780}, -- skull helmet
	{itemid = 5462, type = "equip", slot = "feet", client_version = 780}, -- pirate boots
	{itemid = 5462, type = "deequip", slot = "feet", client_version = 780}, -- pirate boots
	{itemid = 5461, type = "equip", slot = "head", client_version = 780}, -- helmet of the deep
	{itemid = 5461, type = "deequip", slot = "head", client_version = 780}, -- helmet of the deep
	{itemid = 4847, type = "equip", slot = "armor", client_version = 760}, -- spectral dress
	{itemid = 4847, type = "deequip", slot = "armor", client_version = 760}, -- spectral dress
	{itemid = 3983, type = "equip", slot = "legs", client_version = 750}, -- bast skirt
	{itemid = 3983, type = "deequip", slot = "legs", client_version = 750}, -- bast skirt
	{itemid = 3982, type = "equip", slot = "feet", client_version = 750}, -- crocodile boots
	{itemid = 3982, type = "deequip", slot = "feet", client_version = 750}, -- crocodile boots
	{itemid = 3975, type = "equip", slot = "shield", client_version = 750}, -- salamander shield
	{itemid = 3975, type = "deequip", slot = "shield", client_version = 750}, -- salamander shield
	{itemid = 3974, type = "equip", slot = "shield", client_version = 750}, -- sentinel shield
	{itemid = 3974, type = "deequip", slot = "shield", client_version = 750}, -- sentinel shield
	{itemid = 3973, type = "equip", slot = "shield", client_version = 750}, -- tusk shield
	{itemid = 3973, type = "deequip", slot = "shield", client_version = 750}, -- tusk shield
	{itemid = 3972, type = "equip", slot = "head", client_version = 750}, -- bonelord helmet
	{itemid = 3972, type = "deequip", slot = "head", client_version = 750}, -- bonelord helmet
	{itemid = 3971, type = "equip", slot = "head", client_version = 750}, -- charmer's tiara
	{itemid = 3971, type = "deequip", slot = "head", client_version = 750}, -- charmer's tiara
	{itemid = 3970, type = "equip", slot = "head", client_version = 750}, -- feather headdress
	{itemid = 3970, type = "deequip", slot = "head", client_version = 750}, -- feather headdress
	{itemid = 3969, type = "equip", slot = "head", client_version = 750}, -- horseman helmet
	{itemid = 3969, type = "deequip", slot = "head", client_version = 750}, -- horseman helmet
	{itemid = 3968, type = "equip", slot = "armor", client_version = 750}, -- leopard armor
	{itemid = 3968, type = "deequip", slot = "armor", client_version = 750}, -- leopard armor
	{itemid = 3967, type = "equip", slot = "head", client_version = 750}, -- tribal mask
	{itemid = 3967, type = "deequip", slot = "head", client_version = 750}, -- tribal mask
	{itemid = 3966, type = "equip", slot = "hand", client_version = 750}, -- banana staff
	{itemid = 3966, type = "deequip", slot = "hand", client_version = 750}, -- banana staff
	{itemid = 3965, type = "equip", slot = "hand", client_version = 750}, -- hunting spear
	{itemid = 3965, type = "deequip", slot = "hand", client_version = 750}, -- hunting spear
	{itemid = 3964, type = "equip", slot = "hand", client_version = 750}, -- ripper lance
	{itemid = 3964, type = "deequip", slot = "hand", client_version = 750}, -- ripper lance
	{itemid = 3963, type = "equip", slot = "hand", client_version = 750}, -- templar scytheblade
	{itemid = 3963, type = "deequip", slot = "hand", client_version = 750}, -- templar scytheblade
	{itemid = 3962, type = "equip", slot = "hand", client_version = 750}, -- beastslayer axe
	{itemid = 3962, type = "deequip", slot = "hand", client_version = 750}, -- beastslayer axe
	{itemid = 3961, type = "equip", slot = "hand", client_version = 750}, -- lich staff
	{itemid = 3961, type = "deequip", slot = "hand", client_version = 750}, -- lich staff
	{itemid = 3960, type = "equip", slot = "backpack", client_version = 750}, -- old and used backpack
	{itemid = 3960, type = "deequip", slot = "backpack", client_version = 750}, -- old and used backpack
	{itemid = 3940, type = "equip", slot = "backpack", client_version = 750}, -- camouflage backpack
	{itemid = 3940, type = "deequip", slot = "backpack", client_version = 750}, -- camouflage backpack
	{itemid = 3939, type = "equip", slot = "backpack", client_version = 750}, -- camouflage bag
	{itemid = 3939, type = "deequip", slot = "backpack", client_version = 750}, -- camouflage bag
	{itemid = 2665, type = "equip", slot = "head", client_version = 0}, -- post officer's hat
	{itemid = 2665, type = "deequip", slot = "head", client_version = 0}, -- post officer's hat
	{itemid = 2664, type = "equip", slot = "head", vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 0}, -- wood cape
	{itemid = 2664, type = "deequip", slot = "head", client_version = 0}, -- wood cape
	{itemid = 2663, type = "equip", slot = "head", client_version = 0}, -- mystic turban
	{itemid = 2663, type = "deequip", slot = "head", client_version = 0}, -- mystic turban
	{itemid = 2662, type = "equip", slot = "head", client_version = 0}, -- magician hat
	{itemid = 2662, type = "deequip", slot = "head", client_version = 0}, -- magician hat
	{itemid = 2661, type = "equip", slot = "necklace", client_version = 0}, -- scarf
	{itemid = 2661, type = "deequip", slot = "necklace", client_version = 0}, -- scarf
	{itemid = 2660, type = "equip", slot = "armor", vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 0}, -- ranger's cloak
	{itemid = 2660, type = "deequip", slot = "armor", client_version = 0}, -- ranger's cloak
	{itemid = 2659, type = "equip", slot = "armor", client_version = 0}, -- ball gown
	{itemid = 2659, type = "deequip", slot = "armor", client_version = 0}, -- ball gown
	{itemid = 2658, type = "equip", slot = "armor", client_version = 0}, -- white dress
	{itemid = 2658, type = "deequip", slot = "armor", client_version = 0}, -- white dress
	{itemid = 2657, type = "equip", slot = "armor", client_version = 0}, -- simple dress
	{itemid = 2657, type = "deequip", slot = "armor", client_version = 0}, -- simple dress
	{itemid = 2656, type = "equip", slot = "armor", client_version = 0}, -- blue robe
	{itemid = 2656, type = "deequip", slot = "armor", client_version = 0}, -- blue robe
	{itemid = 2655, type = "equip", slot = "armor", client_version = 0}, -- red robe
	{itemid = 2655, type = "deequip", slot = "armor", client_version = 0}, -- red robe
	{itemid = 2654, type = "equip", slot = "armor", client_version = 0}, -- cape
	{itemid = 2654, type = "deequip", slot = "armor", client_version = 0}, -- cape
	{itemid = 2653, type = "equip", slot = "armor", client_version = 0}, -- red tunic
	{itemid = 2653, type = "deequip", slot = "armor", client_version = 0}, -- red tunic
	{itemid = 2652, type = "equip", slot = "armor", client_version = 0}, -- green tunic
	{itemid = 2652, type = "deequip", slot = "armor", client_version = 0}, -- green tunic
	{itemid = 2651, type = "equip", slot = "armor", client_version = 0}, -- coat
	{itemid = 2651, type = "deequip", slot = "armor", client_version = 0}, -- coat
	{itemid = 2650, type = "equip", slot = "armor", client_version = 0}, -- jacket
	{itemid = 2650, type = "deequip", slot = "armor", client_version = 0}, -- jacket
	{itemid = 2649, type = "equip", slot = "legs", client_version = 0}, -- leather legs
	{itemid = 2649, type = "deequip", slot = "legs", client_version = 0}, -- leather legs
	{itemid = 2648, type = "equip", slot = "legs", client_version = 0}, -- chain legs
	{itemid = 2648, type = "deequip", slot = "legs", client_version = 0}, -- chain legs
	{itemid = 2647, type = "equip", slot = "legs", client_version = 0}, -- plate legs
	{itemid = 2647, type = "deequip", slot = "legs", client_version = 0}, -- plate legs
	{itemid = 2646, type = "equip", slot = "feet", client_version = 0}, -- golden boots
	{itemid = 2646, type = "deequip", slot = "feet", client_version = 0}, -- golden boots
	{itemid = 2645, type = "equip", slot = "feet", client_version = 0}, -- steel boots
	{itemid = 2645, type = "deequip", slot = "feet", client_version = 0}, -- steel boots
	{itemid = 2644, type = "equip", slot = "feet", client_version = 730}, -- bunnyslippers
	{itemid = 2644, type = "deequip", slot = "feet", client_version = 730}, -- bunnyslippers
	{itemid = 2643, type = "equip", slot = "feet", client_version = 854}, -- leather boots
	{itemid = 2643, type = "deequip", slot = "feet", client_version = 854}, -- leather boots
	{itemid = 2642, type = "equip", slot = "feet", client_version = 0}, -- sandals
	{itemid = 2642, type = "deequip", slot = "feet", client_version = 0}, -- sandals
	{itemid = 2641, type = "equip", slot = "feet", client_version = 0}, -- patched boots
	{itemid = 2641, type = "deequip", slot = "feet", client_version = 0}, -- patched boots
	{itemid = 2640, type = "equip", slot = "feet", level = 180, client_version = 0}, -- pair of soft boots
	{itemid = 2640, type = "deequip", slot = "feet", level = 180, client_version = 0}, -- pair of soft boots
	{itemid = 2550, type = "equip", slot = "hand", client_version = 0}, -- scythe
	{itemid = 2550, type = "deequip", slot = "hand", client_version = 0}, -- scythe
	{itemid = 2547, type = "equip", slot = "ammo", client_version = 0}, -- power bolt
	{itemid = 2547, type = "deequip", slot = "ammo", client_version = 0}, -- power bolt
	{itemid = 2544, type = "equip", slot = "ammo", client_version = 0}, -- arrow
	{itemid = 2544, type = "deequip", slot = "ammo", client_version = 0}, -- arrow
	{itemid = 2543, type = "equip", slot = "ammo", client_version = 0}, -- bolt
	{itemid = 2543, type = "deequip", slot = "ammo", client_version = 0}, -- bolt
	{itemid = 2542, type = "equip", slot = "shield", client_version = 0}, -- tempest shield
	{itemid = 2542, type = "deequip", slot = "shield", client_version = 0}, -- tempest shield
	{itemid = 2541, type = "equip", slot = "shield", client_version = 0}, -- bone shield
	{itemid = 2541, type = "deequip", slot = "shield", client_version = 0}, -- bone shield
	{itemid = 2540, type = "equip", slot = "shield", client_version = 0}, -- scarab shield
	{itemid = 2540, type = "deequip", slot = "shield", client_version = 0}, -- scarab shield
	{itemid = 2539, type = "equip", slot = "shield", client_version = 0}, -- phoenix shield
	{itemid = 2539, type = "deequip", slot = "shield", client_version = 0}, -- phoenix shield
	{itemid = 2538, type = "equip", slot = "shield", client_version = 0}, -- eagle shield
	{itemid = 2538, type = "deequip", slot = "shield", client_version = 0}, -- eagle shield
	{itemid = 2537, type = "equip", slot = "shield", client_version = 0}, -- amazon shield
	{itemid = 2537, type = "deequip", slot = "shield", client_version = 0}, -- amazon shield
	{itemid = 2536, type = "equip", slot = "shield", client_version = 0}, -- medusa shield
	{itemid = 2536, type = "deequip", slot = "shield", client_version = 0}, -- medusa shield
	{itemid = 2535, type = "equip", slot = "shield", client_version = 0}, -- castle shield
	{itemid = 2535, type = "deequip", slot = "shield", client_version = 0}, -- castle shield
	{itemid = 2534, type = "equip", slot = "shield", client_version = 0}, -- vampire shield
	{itemid = 2534, type = "deequip", slot = "shield", client_version = 0}, -- vampire shield
	{itemid = 2533, type = "equip", slot = "shield", client_version = 0}, -- griffin shield
	{itemid = 2533, type = "deequip", slot = "shield", client_version = 0}, -- griffin shield
	{itemid = 2532, type = "equip", slot = "shield", client_version = 0}, -- ancient shield
	{itemid = 2532, type = "deequip", slot = "shield", client_version = 0}, -- ancient shield
	{itemid = 2531, type = "equip", slot = "shield", client_version = 0}, -- viking shield
	{itemid = 2531, type = "deequip", slot = "shield", client_version = 0}, -- viking shield
	{itemid = 2530, type = "equip", slot = "shield", client_version = 0}, -- copper shield
	{itemid = 2530, type = "deequip", slot = "shield", client_version = 0}, -- copper shield
	{itemid = 2529, type = "equip", slot = "shield", client_version = 0}, -- black shield
	{itemid = 2529, type = "deequip", slot = "shield", client_version = 0}, -- black shield
	{itemid = 2528, type = "equip", slot = "shield", client_version = 0}, -- tower shield
	{itemid = 2528, type = "deequip", slot = "shield", client_version = 0}, -- tower shield
	{itemid = 2527, type = "equip", slot = "shield", client_version = 0}, -- rose shield
	{itemid = 2527, type = "deequip", slot = "shield", client_version = 0}, -- rose shield
	{itemid = 2526, type = "equip", slot = "shield", client_version = 0}, -- studded shield
	{itemid = 2526, type = "deequip", slot = "shield", client_version = 0}, -- studded shield
	{itemid = 2525, type = "equip", slot = "shield", client_version = 0}, -- dwarven shield
	{itemid = 2525, type = "deequip", slot = "shield", client_version = 0}, -- dwarven shield
	{itemid = 2524, type = "equip", slot = "shield", client_version = 0}, -- ornamented shield
	{itemid = 2524, type = "deequip", slot = "shield", client_version = 0}, -- ornamented shield
	{itemid = 2523, type = "equip", slot = "shield", client_version = 0}, -- blessed shield
	{itemid = 2523, type = "deequip", slot = "shield", client_version = 0}, -- blessed shield
	{itemid = 2522, type = "equip", slot = "shield", client_version = 0}, -- great shield
	{itemid = 2522, type = "deequip", slot = "shield", client_version = 0}, -- great shield
	{itemid = 2521, type = "equip", slot = "shield", client_version = 0}, -- dark shield
	{itemid = 2521, type = "deequip", slot = "shield", client_version = 0}, -- dark shield
	{itemid = 2520, type = "equip", slot = "shield", client_version = 0}, -- demon shield
	{itemid = 2520, type = "deequip", slot = "shield", client_version = 0}, -- demon shield
	{itemid = 2519, type = "equip", slot = "shield", client_version = 0}, -- crown shield
	{itemid = 2519, type = "deequip", slot = "shield", client_version = 0}, -- crown shield
	{itemid = 2518, type = "equip", slot = "shield", client_version = 0}, -- bonelord shield
	{itemid = 2518, type = "deequip", slot = "shield", client_version = 0}, -- bonelord shield
	{itemid = 2517, type = "equip", slot = "shield", client_version = 0}, -- shield of honour
	{itemid = 2517, type = "deequip", slot = "shield", client_version = 0}, -- shield of honour
	{itemid = 2516, type = "equip", slot = "shield", client_version = 0}, -- dragon shield
	{itemid = 2516, type = "deequip", slot = "shield", client_version = 0}, -- dragon shield
	{itemid = 2515, type = "equip", slot = "shield", client_version = 0}, -- guardian shield
	{itemid = 2515, type = "deequip", slot = "shield", client_version = 0}, -- guardian shield
	{itemid = 2514, type = "equip", slot = "shield", client_version = 0}, -- mastermind shield
	{itemid = 2514, type = "deequip", slot = "shield", client_version = 0}, -- mastermind shield
	{itemid = 2513, type = "equip", slot = "shield", client_version = 0}, -- battle shield
	{itemid = 2513, type = "deequip", slot = "shield", client_version = 0}, -- battle shield
	{itemid = 2512, type = "equip", slot = "shield", client_version = 0}, -- wooden shield
	{itemid = 2512, type = "deequip", slot = "shield", client_version = 0}, -- wooden shield
	{itemid = 2511, type = "equip", slot = "shield", client_version = 0}, -- brass shield
	{itemid = 2511, type = "deequip", slot = "shield", client_version = 0}, -- brass shield
	{itemid = 2510, type = "equip", slot = "shield", client_version = 0}, -- plate shield
	{itemid = 2510, type = "deequip", slot = "shield", client_version = 0}, -- plate shield
	{itemid = 2509, type = "equip", slot = "shield", client_version = 0}, -- steel shield
	{itemid = 2509, type = "deequip", slot = "shield", client_version = 0}, -- steel shield
	{itemid = 2508, type = "equip", slot = "armor", client_version = 0}, -- native armor
	{itemid = 2508, type = "deequip", slot = "armor", client_version = 0}, -- native armor
	{itemid = 2507, type = "equip", slot = "legs", client_version = 0}, -- elven legs
	{itemid = 2507, type = "deequip", slot = "legs", client_version = 0}, -- elven legs
	{itemid = 2506, type = "equip", slot = "head", client_version = 0}, -- dragon scale helmet
	{itemid = 2506, type = "deequip", slot = "head", client_version = 0}, -- dragon scale helmet
	{itemid = 2505, type = "equip", slot = "armor", client_version = 0}, -- elven mail
	{itemid = 2505, type = "deequip", slot = "armor", client_version = 0}, -- elven mail
	{itemid = 2504, type = "equip", slot = "legs", client_version = 0}, -- dwarven legs
	{itemid = 2504, type = "deequip", slot = "legs", client_version = 0}, -- dwarven legs
	{itemid = 2503, type = "equip", slot = "armor", client_version = 0}, -- dwarven armor
	{itemid = 2503, type = "deequip", slot = "armor", client_version = 0}, -- dwarven armor
	{itemid = 2502, type = "equip", slot = "head", client_version = 0}, -- dwarven helmet
	{itemid = 2502, type = "deequip", slot = "head", client_version = 0}, -- dwarven helmet
	{itemid = 2501, type = "equip", slot = "head", client_version = 0}, -- ceremonial mask
	{itemid = 2501, type = "deequip", slot = "head", client_version = 0}, -- ceremonial mask
	{itemid = 2500, type = "equip", slot = "armor", level = 60, vocation = {{"Paladin", true}, {"Royal Paladin"}}, client_version = 0}, -- amazon armor
	{itemid = 2500, type = "deequip", slot = "armor", level = 60, client_version = 1094}, -- amazon armor
	{itemid = 2499, type = "equip", slot = "head", client_version = 730}, -- amazon helmet
	{itemid = 2499, type = "deequip", slot = "head", client_version = 730}, -- amazon helmet
	{itemid = 2498, type = "equip", slot = "head", client_version = 0}, -- royal helmet
	{itemid = 2498, type = "deequip", slot = "head", client_version = 0}, -- royal helmet
	{itemid = 2497, type = "equip", slot = "head", client_version = 0}, -- crusader helmet
	{itemid = 2497, type = "deequip", slot = "head", client_version = 0}, -- crusader helmet
	{itemid = 2496, type = "equip", slot = "head", client_version = 0}, -- horned helmet
	{itemid = 2496, type = "deequip", slot = "head", client_version = 0}, -- horned helmet
	{itemid = 2495, type = "equip", slot = "legs", client_version = 0}, -- demon legs
	{itemid = 2495, type = "deequip", slot = "legs", client_version = 0}, -- demon legs
	{itemid = 2494, type = "equip", slot = "armor", client_version = 0}, -- demon armor
	{itemid = 2494, type = "deequip", slot = "armor", client_version = 0}, -- demon armor
	{itemid = 2493, type = "equip", slot = "head", client_version = 0}, -- demon helmet
	{itemid = 2493, type = "deequip", slot = "head", client_version = 0}, -- demon helmet
	{itemid = 2492, type = "equip", slot = "armor", vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 0}, -- dragon scale mail
	{itemid = 2492, type = "deequip", slot = "armor", client_version = 0}, -- dragon scale mail
	{itemid = 2491, type = "equip", slot = "head", client_version = 0}, -- crown helmet
	{itemid = 2491, type = "deequip", slot = "head", client_version = 0}, -- crown helmet
	{itemid = 2490, type = "equip", slot = "head", client_version = 0}, -- dark helmet
	{itemid = 2490, type = "deequip", slot = "head", client_version = 0}, -- dark helmet
	{itemid = 2489, type = "equip", slot = "armor", client_version = 0}, -- dark armor
	{itemid = 2489, type = "deequip", slot = "armor", client_version = 0}, -- dark armor
	{itemid = 2488, type = "equip", slot = "legs", vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 0}, -- crown legs
	{itemid = 2488, type = "deequip", slot = "legs", client_version = 0}, -- crown legs
	{itemid = 2487, type = "equip", slot = "armor", vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 0}, -- crown armor
	{itemid = 2487, type = "deequip", slot = "armor", client_version = 0}, -- crown armor
	{itemid = 2486, type = "equip", slot = "armor", client_version = 0}, -- noble armor
	{itemid = 2486, type = "deequip", slot = "armor", client_version = 0}, -- noble armor
	{itemid = 2485, type = "equip", slot = "armor", client_version = 0}, -- doublet
	{itemid = 2485, type = "deequip", slot = "armor", client_version = 0}, -- doublet
	{itemid = 2484, type = "equip", slot = "armor", client_version = 0}, -- studded armor
	{itemid = 2484, type = "deequip", slot = "armor", client_version = 0}, -- studded armor
	{itemid = 2483, type = "equip", slot = "armor", client_version = 0}, -- scale armor
	{itemid = 2483, type = "deequip", slot = "armor", client_version = 0}, -- scale armor
	{itemid = 2482, type = "equip", slot = "head", client_version = 0}, -- studded helmet
	{itemid = 2482, type = "deequip", slot = "head", client_version = 0}, -- studded helmet
	{itemid = 2481, type = "equip", slot = "head", client_version = 0}, -- soldier helmet
	{itemid = 2481, type = "deequip", slot = "head", client_version = 0}, -- soldier helmet
	{itemid = 2480, type = "equip", slot = "head", client_version = 0}, -- legion helmet
	{itemid = 2480, type = "deequip", slot = "head", client_version = 0}, -- legion helmet
	{itemid = 2479, type = "equip", slot = "head", client_version = 0}, -- strange helmet
	{itemid = 2479, type = "deequip", slot = "head", client_version = 0}, -- strange helmet
	{itemid = 2478, type = "equip", slot = "legs", client_version = 0}, -- brass legs
	{itemid = 2478, type = "deequip", slot = "legs", client_version = 0}, -- brass legs
	{itemid = 2477, type = "equip", slot = "legs", vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 0}, -- knight legs
	{itemid = 2477, type = "deequip", slot = "legs", client_version = 0}, -- knight legs
	{itemid = 2476, type = "equip", slot = "armor", vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 0}, -- knight armor
	{itemid = 2476, type = "deequip", slot = "armor", client_version = 0}, -- knight armor
	{itemid = 2475, type = "equip", slot = "head", client_version = 0}, -- warrior helmet
	{itemid = 2475, type = "deequip", slot = "head", client_version = 0}, -- warrior helmet
	{itemid = 2474, type = "equip", slot = "head", client_version = 0}, -- winged helmet
	{itemid = 2474, type = "deequip", slot = "head", client_version = 0}, -- winged helmet
	{itemid = 2473, type = "equip", slot = "head", client_version = 0}, -- viking helmet
	{itemid = 2473, type = "deequip", slot = "head", client_version = 0}, -- viking helmet
	{itemid = 2472, type = "equip", slot = "armor", vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 0}, -- magic plate armor
	{itemid = 2472, type = "deequip", slot = "armor", client_version = 0}, -- magic plate armor
	{itemid = 2471, type = "equip", slot = "head", client_version = 0}, -- golden helmet
	{itemid = 2471, type = "deequip", slot = "head", client_version = 0}, -- golden helmet
	{itemid = 2470, type = "equip", slot = "legs", vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 0}, -- golden legs
	{itemid = 2470, type = "deequip", slot = "legs", client_version = 0}, -- golden legs
	{itemid = 2469, type = "equip", slot = "legs", client_version = 0}, -- dragon scale legs
	{itemid = 2469, type = "deequip", slot = "legs", client_version = 0}, -- dragon scale legs
	{itemid = 2468, type = "equip", slot = "legs", client_version = 0}, -- studded legs
	{itemid = 2468, type = "deequip", slot = "legs", client_version = 0}, -- studded legs
	{itemid = 2467, type = "equip", slot = "armor", client_version = 0}, -- leather armor
	{itemid = 2467, type = "deequip", slot = "armor", client_version = 0}, -- leather armor
	{itemid = 2466, type = "equip", slot = "armor", vocation = {{"Knight", true}, {"Paladin", true, true}, {"Elite Knight"}, {"Royal Paladin"}}, client_version = 0}, -- golden armor
	{itemid = 2466, type = "deequip", slot = "armor", client_version = 0}, -- golden armor
	{itemid = 2465, type = "equip", slot = "armor", client_version = 0}, -- brass armor
	{itemid = 2465, type = "deequip", slot = "armor", client_version = 0}, -- brass armor
	{itemid = 2464, type = "equip", slot = "armor", client_version = 0}, -- chain armor
	{itemid = 2464, type = "deequip", slot = "armor", client_version = 0}, -- chain armor
	{itemid = 2463, type = "equip", slot = "armor", client_version = 0}, -- plate armor
	{itemid = 2463, type = "deequip", slot = "armor", client_version = 0}, -- plate armor
	{itemid = 2462, type = "equip", slot = "head", client_version = 0}, -- devil helmet
	{itemid = 2462, type = "deequip", slot = "head", client_version = 0}, -- devil helmet
	{itemid = 2461, type = "equip", slot = "head", client_version = 0}, -- leather helmet
	{itemid = 2461, type = "deequip", slot = "head", client_version = 0}, -- leather helmet
	{itemid = 2460, type = "equip", slot = "head", client_version = 0}, -- brass helmet
	{itemid = 2460, type = "deequip", slot = "head", client_version = 0}, -- brass helmet
	{itemid = 2459, type = "equip", slot = "head", client_version = 0}, -- iron helmet
	{itemid = 2459, type = "deequip", slot = "head", client_version = 0}, -- iron helmet
	{itemid = 2458, type = "equip", slot = "head", client_version = 0}, -- chain helmet
	{itemid = 2458, type = "deequip", slot = "head", client_version = 0}, -- chain helmet
	{itemid = 2457, type = "equip", slot = "head", client_version = 0}, -- steel helmet
	{itemid = 2457, type = "deequip", slot = "head", client_version = 0}, -- steel helmet
	{itemid = 2456, type = "equip", slot = "hand", client_version = 0}, -- bow
	{itemid = 2456, type = "deequip", slot = "hand", client_version = 0}, -- bow
	{itemid = 2455, type = "equip", slot = "hand", client_version = 0}, -- crossbow
	{itemid = 2455, type = "deequip", slot = "hand", client_version = 0}, -- crossbow
	{itemid = 2454, type = "equip", slot = "hand", client_version = 0}, -- war axe
	{itemid = 2454, type = "deequip", slot = "hand", client_version = 0}, -- war axe
	{itemid = 2453, type = "equip", slot = "hand", client_version = 0}, -- arcane staff
	{itemid = 2453, type = "deequip", slot = "hand", client_version = 0}, -- arcane staff
	{itemid = 2452, type = "equip", slot = "hand", client_version = 0}, -- heavy mace
	{itemid = 2452, type = "deequip", slot = "hand", client_version = 0}, -- heavy mace
	{itemid = 2451, type = "equip", slot = "hand", client_version = 0}, -- djinn blade
	{itemid = 2451, type = "deequip", slot = "hand", client_version = 0}, -- djinn blade
	{itemid = 2450, type = "equip", slot = "hand", client_version = 0}, -- bone sword
	{itemid = 2450, type = "deequip", slot = "hand", client_version = 0}, -- bone sword
	{itemid = 2449, type = "equip", slot = "hand", client_version = 0}, -- bone club
	{itemid = 2449, type = "deequip", slot = "hand", client_version = 0}, -- bone club
	{itemid = 2448, type = "equip", slot = "hand", client_version = 0}, -- studded club
	{itemid = 2448, type = "deequip", slot = "hand", client_version = 0}, -- studded club
	{itemid = 2447, type = "equip", slot = "hand", client_version = 0}, -- twin axe
	{itemid = 2447, type = "deequip", slot = "hand", client_version = 0}, -- twin axe
	{itemid = 2446, type = "equip", slot = "hand", client_version = 0}, -- pharaoh sword
	{itemid = 2446, type = "deequip", slot = "hand", client_version = 0}, -- pharaoh sword
	{itemid = 2445, type = "equip", slot = "hand", client_version = 0}, -- crystal mace
	{itemid = 2445, type = "deequip", slot = "hand", client_version = 0}, -- crystal mace
	{itemid = 2444, type = "equip", slot = "hand", client_version = 0}, -- hammer of wrath
	{itemid = 2444, type = "deequip", slot = "hand", client_version = 0}, -- hammer of wrath
	{itemid = 2443, type = "equip", slot = "hand", client_version = 0}, -- ravager's axe
	{itemid = 2443, type = "deequip", slot = "hand", client_version = 0}, -- ravager's axe
	{itemid = 2442, type = "equip", slot = "hand", client_version = 0}, -- heavy machete
	{itemid = 2442, type = "deequip", slot = "hand", client_version = 0}, -- heavy machete
	{itemid = 2441, type = "equip", slot = "hand", client_version = 0}, -- daramian axe
	{itemid = 2441, type = "deequip", slot = "hand", client_version = 0}, -- daramian axe
	{itemid = 2440, type = "equip", slot = "hand", client_version = 0}, -- daramian waraxe
	{itemid = 2440, type = "deequip", slot = "hand", client_version = 0}, -- daramian waraxe
	{itemid = 2439, type = "equip", slot = "hand", client_version = 0}, -- daramian mace
	{itemid = 2439, type = "deequip", slot = "hand", client_version = 0}, -- daramian mace
	{itemid = 2438, type = "equip", slot = "hand", client_version = 0}, -- epee
	{itemid = 2438, type = "deequip", slot = "hand", client_version = 0}, -- epee
	{itemid = 2437, type = "equip", slot = "hand", client_version = 0}, -- light mace
	{itemid = 2437, type = "deequip", slot = "hand", client_version = 0}, -- light mace
	{itemid = 2436, type = "equip", slot = "hand", client_version = 0}, -- skull staff
	{itemid = 2436, type = "deequip", slot = "hand", client_version = 0}, -- skull staff
	{itemid = 2435, type = "equip", slot = "hand", client_version = 0}, -- dwarven axe
	{itemid = 2435, type = "deequip", slot = "hand", client_version = 0}, -- dwarven axe
	{itemid = 2434, type = "equip", slot = "hand", client_version = 0}, -- dragon hammer
	{itemid = 2434, type = "deequip", slot = "hand", client_version = 0}, -- dragon hammer
	{itemid = 2433, type = "equip", slot = "hand", client_version = 0}, -- enchanted staff
	{itemid = 2433, type = "deequip", slot = "hand", client_version = 0}, -- enchanted staff
	{itemid = 2432, type = "equip", slot = "hand", client_version = 0}, -- fire axe
	{itemid = 2432, type = "deequip", slot = "hand", client_version = 0}, -- fire axe
	{itemid = 2431, type = "equip", slot = "hand", client_version = 0}, -- stonecutter axe
	{itemid = 2431, type = "deequip", slot = "hand", client_version = 0}, -- stonecutter axe
	{itemid = 2430, type = "equip", slot = "hand", client_version = 0}, -- knight axe
	{itemid = 2430, type = "deequip", slot = "hand", client_version = 0}, -- knight axe
	{itemid = 2429, type = "equip", slot = "hand", client_version = 0}, -- barbarian axe
	{itemid = 2429, type = "deequip", slot = "hand", client_version = 0}, -- barbarian axe
	{itemid = 2428, type = "equip", slot = "hand", client_version = 0}, -- orcish axe
	{itemid = 2428, type = "deequip", slot = "hand", client_version = 0}, -- orcish axe
	{itemid = 2427, type = "equip", slot = "hand", client_version = 0}, -- guardian halberd
	{itemid = 2427, type = "deequip", slot = "hand", client_version = 0}, -- guardian halberd
	{itemid = 2426, type = "equip", slot = "hand", client_version = 0}, -- naginata
	{itemid = 2426, type = "deequip", slot = "hand", client_version = 0}, -- naginata
	{itemid = 2425, type = "equip", slot = "hand", client_version = 0}, -- obsidian lance
	{itemid = 2425, type = "deequip", slot = "hand", client_version = 0}, -- obsidian lance
	{itemid = 2424, type = "equip", slot = "hand", client_version = 0}, -- silver mace
	{itemid = 2424, type = "deequip", slot = "hand", client_version = 0}, -- silver mace
	{itemid = 2423, type = "equip", slot = "hand", client_version = 0}, -- clerical mace
	{itemid = 2423, type = "deequip", slot = "hand", client_version = 0}, -- clerical mace
	{itemid = 2422, type = "equip", slot = "hand", client_version = 0}, -- iron hammer
	{itemid = 2422, type = "deequip", slot = "hand", client_version = 0}, -- iron hammer
	{itemid = 2421, type = "equip", slot = "hand", client_version = 0}, -- thunder hammer
	{itemid = 2421, type = "deequip", slot = "hand", client_version = 0}, -- thunder hammer
	{itemid = 2420, type = "equip", slot = "hand", client_version = 0}, -- machete
	{itemid = 2420, type = "deequip", slot = "hand", client_version = 0}, -- machete
	{itemid = 2419, type = "equip", slot = "hand", client_version = 0}, -- scimitar
	{itemid = 2419, type = "deequip", slot = "hand", client_version = 0}, -- scimitar
	{itemid = 2418, type = "equip", slot = "hand", client_version = 0}, -- golden sickle
	{itemid = 2418, type = "deequip", slot = "hand", client_version = 0}, -- golden sickle
	{itemid = 2417, type = "equip", slot = "hand", client_version = 0}, -- battle hammer
	{itemid = 2417, type = "deequip", slot = "hand", client_version = 0}, -- battle hammer
	{itemid = 2416, type = "equip", slot = "hand", client_version = 0}, -- crowbar
	{itemid = 2416, type = "deequip", slot = "hand", client_version = 0}, -- crowbar
	{itemid = 2415, type = "equip", slot = "hand", client_version = 0}, -- great axe
	{itemid = 2415, type = "deequip", slot = "hand", client_version = 0}, -- great axe
	{itemid = 2414, type = "equip", slot = "hand", client_version = 0}, -- dragon lance
	{itemid = 2414, type = "deequip", slot = "hand", client_version = 0}, -- dragon lance
	{itemid = 2413, type = "equip", slot = "hand", client_version = 0}, -- broadsword
	{itemid = 2413, type = "deequip", slot = "hand", client_version = 0}, -- broadsword
	{itemid = 2412, type = "equip", slot = "hand", client_version = 0}, -- katana
	{itemid = 2412, type = "deequip", slot = "hand", client_version = 0}, -- katana
	{itemid = 2411, type = "equip", slot = "hand", client_version = 0}, -- poison dagger
	{itemid = 2411, type = "deequip", slot = "hand", client_version = 0}, -- poison dagger
	{itemid = 2410, type = "equip", slot = "hand", client_version = 0}, -- throwing knife
	{itemid = 2410, type = "deequip", slot = "hand", client_version = 0}, -- throwing knife
	{itemid = 2409, type = "equip", slot = "hand", client_version = 0}, -- serpent sword
	{itemid = 2409, type = "deequip", slot = "hand", client_version = 0}, -- serpent sword
	{itemid = 2408, type = "equip", slot = "hand", client_version = 0}, -- warlord sword
	{itemid = 2408, type = "deequip", slot = "hand", client_version = 0}, -- warlord sword
	{itemid = 2407, type = "equip", slot = "hand", client_version = 0}, -- bright sword
	{itemid = 2407, type = "deequip", slot = "hand", client_version = 0}, -- bright sword
	{itemid = 2406, type = "equip", slot = "hand", client_version = 0}, -- short sword
	{itemid = 2406, type = "deequip", slot = "hand", client_version = 0}, -- short sword
	{itemid = 2405, type = "equip", slot = "hand", client_version = 0}, -- sickle
	{itemid = 2405, type = "deequip", slot = "hand", client_version = 0}, -- sickle
	{itemid = 2404, type = "equip", slot = "hand", client_version = 0}, -- combat knife
	{itemid = 2404, type = "deequip", slot = "hand", client_version = 0}, -- combat knife
	{itemid = 2403, type = "equip", slot = "hand", client_version = 0}, -- knife
	{itemid = 2403, type = "deequip", slot = "hand", client_version = 0}, -- knife
	{itemid = 2402, type = "equip", slot = "hand", client_version = 0}, -- silver dagger
	{itemid = 2402, type = "deequip", slot = "hand", client_version = 0}, -- silver dagger
	{itemid = 2401, type = "equip", slot = "hand", client_version = 0}, -- staff
	{itemid = 2401, type = "deequip", slot = "hand", client_version = 0}, -- staff
	{itemid = 2400, type = "equip", slot = "hand", client_version = 0}, -- magic sword
	{itemid = 2400, type = "deequip", slot = "hand", client_version = 0}, -- magic sword
	{itemid = 2399, type = "equip", slot = "hand", client_version = 0}, -- throwing star
	{itemid = 2399, type = "deequip", slot = "hand", client_version = 0}, -- throwing star
	{itemid = 2398, type = "equip", slot = "hand", client_version = 0}, -- mace
	{itemid = 2398, type = "deequip", slot = "hand", client_version = 0}, -- mace
	{itemid = 2397, type = "equip", slot = "hand", client_version = 0}, -- longsword
	{itemid = 2397, type = "deequip", slot = "hand", client_version = 0}, -- longsword
	{itemid = 2396, type = "equip", slot = "hand", client_version = 0}, -- ice rapier
	{itemid = 2396, type = "deequip", slot = "hand", client_version = 0}, -- ice rapier
	{itemid = 2395, type = "equip", slot = "hand", client_version = 0}, -- carlin sword
	{itemid = 2395, type = "deequip", slot = "hand", client_version = 0}, -- carlin sword
	{itemid = 2394, type = "equip", slot = "hand", client_version = 0}, -- morning star
	{itemid = 2394, type = "deequip", slot = "hand", client_version = 0}, -- morning star
	{itemid = 2393, type = "equip", slot = "hand", client_version = 0}, -- giant sword
	{itemid = 2393, type = "deequip", slot = "hand", client_version = 0}, -- giant sword
	{itemid = 2392, type = "equip", slot = "hand", client_version = 0}, -- fire sword
	{itemid = 2392, type = "deequip", slot = "hand", client_version = 0}, -- fire sword
	{itemid = 2391, type = "equip", slot = "hand", client_version = 0}, -- war hammer
	{itemid = 2391, type = "deequip", slot = "hand", client_version = 0}, -- war hammer
	{itemid = 2390, type = "equip", slot = "hand", client_version = 0}, -- magic longsword
	{itemid = 2390, type = "deequip", slot = "hand", client_version = 0}, -- magic longsword
	{itemid = 2389, type = "equip", slot = "hand", client_version = 0}, -- spear
	{itemid = 2389, type = "deequip", slot = "hand", client_version = 0}, -- spear
	{itemid = 2388, type = "equip", slot = "hand", client_version = 0}, -- hatchet
	{itemid = 2388, type = "deequip", slot = "hand", client_version = 0}, -- hatchet
	{itemid = 2387, type = "equip", slot = "hand", client_version = 0}, -- double axe
	{itemid = 2387, type = "deequip", slot = "hand", client_version = 0}, -- double axe
	{itemid = 2386, type = "equip", slot = "hand", client_version = 0}, -- axe
	{itemid = 2386, type = "deequip", slot = "hand", client_version = 0}, -- axe
	{itemid = 2385, type = "equip", slot = "hand", client_version = 0}, -- sabre
	{itemid = 2385, type = "deequip", slot = "hand", client_version = 0}, -- sabre
	{itemid = 2384, type = "equip", slot = "hand", client_version = 0}, -- rapier
	{itemid = 2384, type = "deequip", slot = "hand", client_version = 0}, -- rapier
	{itemid = 2383, type = "equip", slot = "hand", client_version = 0}, -- spike sword
	{itemid = 2383, type = "deequip", slot = "hand", client_version = 0}, -- spike sword
	{itemid = 2382, type = "equip", slot = "hand", client_version = 0}, -- club
	{itemid = 2382, type = "deequip", slot = "hand", client_version = 0}, -- club
	{itemid = 2381, type = "equip", slot = "hand", client_version = 0}, -- halberd
	{itemid = 2381, type = "deequip", slot = "hand", client_version = 0}, -- halberd
	{itemid = 2380, type = "equip", slot = "hand", client_version = 0}, -- hand axe
	{itemid = 2380, type = "deequip", slot = "hand", client_version = 0}, -- hand axe
	{itemid = 2379, type = "equip", slot = "hand", client_version = 0}, -- dagger
	{itemid = 2379, type = "deequip", slot = "hand", client_version = 0}, -- dagger
	{itemid = 2378, type = "equip", slot = "hand", client_version = 0}, -- battle axe
	{itemid = 2378, type = "deequip", slot = "hand", client_version = 0}, -- battle axe
	{itemid = 2377, type = "equip", slot = "hand", client_version = 0}, -- two handed sword
	{itemid = 2377, type = "deequip", slot = "hand", client_version = 0}, -- two handed sword
	{itemid = 2376, type = "equip", slot = "hand", client_version = 0}, -- sword
	{itemid = 2376, type = "deequip", slot = "hand", client_version = 0}, -- sword
	{itemid = 2365, type = "equip", slot = "backpack", client_version = 0}, -- backpack of holding
	{itemid = 2365, type = "deequip", slot = "backpack", client_version = 0}, -- backpack of holding
	{itemid = 2358, type = "equip", slot = "feet", client_version = 0}, -- boots of waterwalking
	{itemid = 2358, type = "deequip", slot = "feet", client_version = 0}, -- boots of waterwalking
	{itemid = 2357, type = "equip", slot = "ring", client_version = 0}, -- ring of wishes
	{itemid = 2357, type = "deequip", slot = "ring", client_version = 0}, -- ring of wishes
	{itemid = 2343, type = "equip", slot = "head", client_version = 0}, -- helmet of the ancients
	{itemid = 2343, type = "deequip", slot = "head", client_version = 0}, -- helmet of the ancients
	{itemid = 2342, type = "equip", slot = "head", client_version = 0}, -- helmet of the ancients
	{itemid = 2342, type = "deequip", slot = "head", client_version = 0}, -- helmet of the ancients
	{itemid = 2339, type = "equip", slot = "head", client_version = 0}, -- damaged helmet
	{itemid = 2339, type = "deequip", slot = "head", client_version = 0}, -- damaged helmet
	{itemid = 2323, type = "equip", slot = "head", vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 0}, -- hat of the mad
	{itemid = 2323, type = "deequip", slot = "head", client_version = 0}, -- hat of the mad
	{itemid = 2321, type = "equip", slot = "hand", client_version = 0}, -- giant smithhammer
	{itemid = 2321, type = "deequip", slot = "hand", client_version = 0}, -- giant smithhammer
	{itemid = 2218, type = "equip", slot = "necklace", client_version = 0}, -- paw amulet
	{itemid = 2218, type = "deequip", slot = "necklace", client_version = 0}, -- paw amulet
	{itemid = 2216, type = "equip", slot = "ring", client_version = 0}, -- ring of healing
	{itemid = 2216, type = "deequip", slot = "ring", client_version = 0}, -- ring of healing
	{itemid = 2215, type = "equip", slot = "ring", client_version = 0}, -- dwarven ring
	{itemid = 2215, type = "deequip", slot = "ring", client_version = 0}, -- dwarven ring
	{itemid = 2214, type = "equip", slot = "ring", client_version = 0}, -- ring of healing
	{itemid = 2214, type = "deequip", slot = "ring", client_version = 0}, -- ring of healing
	{itemid = 2213, type = "equip", slot = "ring", client_version = 0}, -- dwarven ring
	{itemid = 2213, type = "deequip", slot = "ring", client_version = 0}, -- dwarven ring
	{itemid = 2212, type = "equip", slot = "ring", client_version = 0}, -- club ring
	{itemid = 2212, type = "deequip", slot = "ring", client_version = 0}, -- club ring
	{itemid = 2211, type = "equip", slot = "ring", client_version = 0}, -- axe ring
	{itemid = 2211, type = "deequip", slot = "ring", client_version = 0}, -- axe ring
	{itemid = 2210, type = "equip", slot = "ring", client_version = 0}, -- sword ring
	{itemid = 2210, type = "deequip", slot = "ring", client_version = 0}, -- sword ring
	{itemid = 2209, type = "equip", slot = "ring", client_version = 0}, -- club ring
	{itemid = 2209, type = "deequip", slot = "ring", client_version = 0}, -- club ring
	{itemid = 2208, type = "equip", slot = "ring", client_version = 0}, -- axe ring
	{itemid = 2208, type = "deequip", slot = "ring", client_version = 0}, -- axe ring
	{itemid = 2207, type = "equip", slot = "ring", client_version = 0}, -- sword ring
	{itemid = 2207, type = "deequip", slot = "ring", client_version = 0}, -- sword ring
	{itemid = 2206, type = "equip", slot = "ring", client_version = 0}, -- time ring
	{itemid = 2206, type = "deequip", slot = "ring", client_version = 0}, -- time ring
	{itemid = 2205, type = "equip", slot = "ring", client_version = 0}, -- life ring
	{itemid = 2205, type = "deequip", slot = "ring", client_version = 0}, -- life ring
	{itemid = 2204, type = "equip", slot = "ring", client_version = 0}, -- energy ring
	{itemid = 2204, type = "deequip", slot = "ring", client_version = 0}, -- energy ring
	{itemid = 2203, type = "equip", slot = "ring", client_version = 0}, -- power ring
	{itemid = 2203, type = "deequip", slot = "ring", client_version = 0}, -- power ring
	{itemid = 2202, type = "equip", slot = "ring", client_version = 0}, -- stealth ring
	{itemid = 2202, type = "deequip", slot = "ring", client_version = 0}, -- stealth ring
	{itemid = 2201, type = "equip", slot = "necklace", client_version = 0}, -- dragon necklace
	{itemid = 2201, type = "deequip", slot = "necklace", client_version = 0}, -- dragon necklace
	{itemid = 2200, type = "equip", slot = "necklace", client_version = 0}, -- protection amulet
	{itemid = 2200, type = "deequip", slot = "necklace", client_version = 0}, -- protection amulet
	{itemid = 2199, type = "equip", slot = "necklace", client_version = 0}, -- garlic necklace
	{itemid = 2199, type = "deequip", slot = "necklace", client_version = 0}, -- garlic necklace
	{itemid = 2198, type = "equip", slot = "necklace", client_version = 0}, -- elven amulet
	{itemid = 2198, type = "deequip", slot = "necklace", client_version = 0}, -- elven amulet
	{itemid = 2197, type = "equip", slot = "necklace", client_version = 0}, -- stone skin amulet
	{itemid = 2197, type = "deequip", slot = "necklace", client_version = 0}, -- stone skin amulet
	{itemid = 2196, type = "equip", slot = "necklace", client_version = 0}, -- amulet of life
	{itemid = 2196, type = "deequip", slot = "necklace", client_version = 0}, -- amulet of life
	{itemid = 2195, type = "equip", slot = "feet", client_version = 0}, -- boots of haste
	{itemid = 2195, type = "deequip", slot = "feet", client_version = 0}, -- boots of haste
	{itemid = 2191, type = "equip", slot = "hand", level = 13, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 760}, -- wand of dragonbreath
	{itemid = 2191, type = "deequip", slot = "hand", level = 13, client_version = 760}, -- wand of dragonbreath
	{itemid = 2190, type = "equip", slot = "hand", level = 6, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 760}, -- wand of vortex
	{itemid = 2190, type = "deequip", slot = "hand", level = 6, client_version = 760}, -- wand of vortex
	{itemid = 2189, type = "equip", slot = "hand", level = 26, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 760}, -- wand of cosmic energy
	{itemid = 2189, type = "deequip", slot = "hand", level = 26, client_version = 760}, -- wand of cosmic energy
	{itemid = 2188, type = "equip", slot = "hand", level = 19, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 760}, -- wand of decay
	{itemid = 2188, type = "deequip", slot = "hand", level = 19, client_version = 760}, -- wand of decay
	{itemid = 2187, type = "equip", slot = "hand", level = 33, vocation = {{"Sorcerer", true}, {"Master Sorcerer"}}, client_version = 760}, -- wand of inferno
	{itemid = 2187, type = "deequip", slot = "hand", level = 33, client_version = 760}, -- wand of inferno
	{itemid = 2186, type = "equip", slot = "hand", level = 13, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 760}, -- moonlight rod
	{itemid = 2186, type = "deequip", slot = "hand", level = 13, client_version = 760}, -- moonlight rod
	{itemid = 2185, type = "equip", slot = "hand", level = 19, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 760}, -- necrotic rod
	{itemid = 2185, type = "deequip", slot = "hand", level = 19, client_version = 760}, -- necrotic rod
	{itemid = 2183, type = "equip", slot = "hand", level = 33, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 760}, -- hailstorm rod
	{itemid = 2183, type = "deequip", slot = "hand", level = 33, client_version = 760}, -- hailstorm rod
	{itemid = 2182, type = "equip", slot = "hand", level = 6, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 760}, -- snakebit rod
	{itemid = 2182, type = "deequip", slot = "hand", level = 6, client_version = 760}, -- snakebit rod
	{itemid = 2181, type = "equip", slot = "hand", level = 26, vocation = {{"Druid", true}, {"Elder Druid"}}, client_version = 760}, -- terra rod
	{itemid = 2181, type = "deequip", slot = "hand", level = 26, client_version = 760}, -- terra rod
	{itemid = 2179, type = "equip", slot = "ring", client_version = 0}, -- gold ring
	{itemid = 2179, type = "deequip", slot = "ring", client_version = 0}, -- gold ring
	{itemid = 2175, type = "equip", slot = "shield", vocation = {{"Sorcerer", true}, {"Druid", true, true}, {"Master Sorcerer"}, {"Elder Druid"}}, client_version = 0}, -- spellbook
	{itemid = 2175, type = "deequip", slot = "shield", client_version = 0}, -- spellbook
	{itemid = 2173, type = "equip", slot = "necklace", client_version = 0}, -- amulet of loss
	{itemid = 2173, type = "deequip", slot = "necklace", client_version = 0}, -- amulet of loss
	{itemid = 2172, type = "equip", slot = "necklace", client_version = 0}, -- bronze amulet
	{itemid = 2172, type = "deequip", slot = "necklace", client_version = 0}, -- bronze amulet
	{itemid = 2171, type = "equip", slot = "necklace", client_version = 0}, -- platinum amulet
	{itemid = 2171, type = "deequip", slot = "necklace", client_version = 0}, -- platinum amulet
	{itemid = 2170, type = "equip", slot = "necklace", client_version = 0}, -- silver amulet
	{itemid = 2170, type = "deequip", slot = "necklace", client_version = 0}, -- silver amulet
	{itemid = 2169, type = "equip", slot = "ring", client_version = 0}, -- time ring
	{itemid = 2169, type = "deequip", slot = "ring", client_version = 0}, -- time ring
	{itemid = 2168, type = "equip", slot = "ring", client_version = 0}, -- life ring
	{itemid = 2168, type = "deequip", slot = "ring", client_version = 0}, -- life ring
	{itemid = 2167, type = "equip", slot = "ring", client_version = 0}, -- energy ring
	{itemid = 2167, type = "deequip", slot = "ring", client_version = 0}, -- energy ring
	{itemid = 2166, type = "equip", slot = "ring", client_version = 0}, -- power ring
	{itemid = 2166, type = "deequip", slot = "ring", client_version = 0}, -- power ring
	{itemid = 2165, type = "equip", slot = "ring", client_version = 0}, -- stealth ring
	{itemid = 2165, type = "deequip", slot = "ring", client_version = 0}, -- stealth ring
	{itemid = 2164, type = "equip", slot = "ring", client_version = 0}, -- might ring
	{itemid = 2164, type = "deequip", slot = "ring", client_version = 0}, -- might ring
	{itemid = 2161, type = "equip", slot = "necklace", client_version = 0}, -- strange talisman
	{itemid = 2161, type = "deequip", slot = "necklace", client_version = 0}, -- strange talisman
	{itemid = 2142, type = "equip", slot = "necklace", client_version = 0}, -- ancient amulet
	{itemid = 2142, type = "deequip", slot = "necklace", client_version = 0}, -- ancient amulet
	{itemid = 2139, type = "equip", slot = "head", client_version = 0}, -- ancient tiara
	{itemid = 2139, type = "deequip", slot = "head", client_version = 0}, -- ancient tiara
	{itemid = 2138, type = "equip", slot = "necklace", client_version = 0}, -- sapphire amulet
	{itemid = 2138, type = "deequip", slot = "necklace", client_version = 0}, -- sapphire amulet
	{itemid = 2136, type = "equip", slot = "necklace", client_version = 0}, -- demonbone amulet
	{itemid = 2136, type = "deequip", slot = "necklace", client_version = 0}, -- demonbone amulet
	{itemid = 2135, type = "equip", slot = "necklace", client_version = 0}, -- scarab amulet
	{itemid = 2135, type = "deequip", slot = "necklace", client_version = 0}, -- scarab amulet
	{itemid = 2133, type = "equip", slot = "necklace", client_version = 0}, -- ruby necklace
	{itemid = 2133, type = "deequip", slot = "necklace", client_version = 0}, -- ruby necklace
	{itemid = 2132, type = "equip", slot = "necklace", client_version = 0}, -- silver necklace
	{itemid = 2132, type = "deequip", slot = "necklace", client_version = 0}, -- silver necklace
	{itemid = 2131, type = "equip", slot = "necklace", client_version = 0}, -- star amulet
	{itemid = 2131, type = "deequip", slot = "necklace", client_version = 0}, -- star amulet
	{itemid = 2130, type = "equip", slot = "necklace", client_version = 0}, -- golden amulet
	{itemid = 2130, type = "deequip", slot = "necklace", client_version = 0}, -- golden amulet
	{itemid = 2129, type = "equip", slot = "necklace", client_version = 0}, -- wolf tooth chain
	{itemid = 2129, type = "deequip", slot = "necklace", client_version = 0}, -- wolf tooth chain
	{itemid = 2128, type = "equip", slot = "head", client_version = 0}, -- crown
	{itemid = 2128, type = "deequip", slot = "head", client_version = 0}, -- crown
	{itemid = 2126, type = "equip", slot = "necklace", client_version = 0}, -- bronze necklace
	{itemid = 2126, type = "deequip", slot = "necklace", client_version = 0}, -- bronze necklace
	{itemid = 2125, type = "equip", slot = "necklace", client_version = 0}, -- crystal necklace
	{itemid = 2125, type = "deequip", slot = "necklace", client_version = 0}, -- crystal necklace
	{itemid = 2124, type = "equip", slot = "ring", client_version = 0}, -- crystal ring
	{itemid = 2124, type = "deequip", slot = "ring", client_version = 0}, -- crystal ring
	{itemid = 2123, type = "equip", slot = "ring", client_version = 0}, -- ring of the sky
	{itemid = 2123, type = "deequip", slot = "ring", client_version = 0}, -- ring of the sky
	{itemid = 2121, type = "equip", slot = "ring", client_version = 0}, -- wedding ring
	{itemid = 2121, type = "deequip", slot = "ring", client_version = 0}, -- wedding ring
	{itemid = 2111, type = "equip", slot = "hand", client_version = 0}, -- snowball
	{itemid = 2111, type = "deequip", slot = "hand", client_version = 0}, -- snowball
	{itemid = 2004, type = "equip", slot = "backpack", client_version = 0}, -- golden backpack
	{itemid = 2004, type = "deequip", slot = "backpack", client_version = 0}, -- golden backpack
	{itemid = 2003, type = "equip", slot = "backpack", client_version = 0}, -- grey backpack
	{itemid = 2003, type = "deequip", slot = "backpack", client_version = 0}, -- grey backpack
	{itemid = 2002, type = "equip", slot = "backpack", client_version = 0}, -- blue backpack
	{itemid = 2002, type = "deequip", slot = "backpack", client_version = 0}, -- blue backpack
	{itemid = 2001, type = "equip", slot = "backpack", client_version = 0}, -- purple backpack
	{itemid = 2001, type = "deequip", slot = "backpack", client_version = 0}, -- purple backpack
	{itemid = 2000, type = "equip", slot = "backpack", client_version = 0}, -- red backpack
	{itemid = 2000, type = "deequip", slot = "backpack", client_version = 0}, -- red backpack
	{itemid = 1999, type = "equip", slot = "backpack", client_version = 0}, -- yellow backpack
	{itemid = 1999, type = "deequip", slot = "backpack", client_version = 0}, -- yellow backpack
	{itemid = 1998, type = "equip", slot = "backpack", client_version = 0}, -- green backpack
	{itemid = 1998, type = "deequip", slot = "backpack", client_version = 0}, -- green backpack
	{itemid = 1997, type = "equip", slot = "backpack", client_version = 0}, -- golden bag
	{itemid = 1997, type = "deequip", slot = "backpack", client_version = 0}, -- golden bag
	{itemid = 1996, type = "equip", slot = "backpack", client_version = 0}, -- grey bag
	{itemid = 1996, type = "deequip", slot = "backpack", client_version = 0}, -- grey bag
	{itemid = 1995, type = "equip", slot = "backpack", client_version = 0}, -- blue bag
	{itemid = 1995, type = "deequip", slot = "backpack", client_version = 0}, -- blue bag
	{itemid = 1994, type = "equip", slot = "backpack", client_version = 0}, -- purple bag
	{itemid = 1994, type = "deequip", slot = "backpack", client_version = 0}, -- purple bag
	{itemid = 1993, type = "equip", slot = "backpack", client_version = 0}, -- red bag
	{itemid = 1993, type = "deequip", slot = "backpack", client_version = 0}, -- red bag
	{itemid = 1992, type = "equip", slot = "backpack", client_version = 0}, -- yellow bag
	{itemid = 1992, type = "deequip", slot = "backpack", client_version = 0}, -- yellow bag
	{itemid = 1991, type = "equip", slot = "backpack", client_version = 0}, -- green bag
	{itemid = 1991, type = "deequip", slot = "backpack", client_version = 0}, -- green bag
	{itemid = 1988, type = "equip", slot = "backpack", client_version = 0}, -- backpack
	{itemid = 1988, type = "deequip", slot = "backpack", client_version = 0}, -- backpack
	{itemid = 1987, type = "equip", slot = "backpack", client_version = 0}, -- bag
	{itemid = 1987, type = "deequip", slot = "backpack", client_version = 0}, -- bag
	{itemid = 1507, type = "stepin", client_version = 0}, -- searing fire
	{itemid = 1507, type = "additem", client_version = 0}, -- searing fire
	{itemid = 1506, type = "stepin", client_version = 0}, -- searing fire
	{itemid = 1506, type = "additem", client_version = 0}, -- searing fire
	{itemid = 1505, type = "stepin", client_version = 0}, -- smoke
	{itemid = 1505, type = "additem", client_version = 0}, -- smoke
	{itemid = 1504, type = "stepin", client_version = 0}, -- energy field
	{itemid = 1504, type = "additem", client_version = 0}, -- energy field
	{itemid = 1503, type = "stepin", client_version = 0}, -- poison gas
	{itemid = 1503, type = "additem", client_version = 0}, -- poison gas
	{itemid = 1502, type = "stepin", client_version = 0}, -- fire field
	{itemid = 1502, type = "additem", client_version = 0}, -- fire field
	{itemid = 1501, type = "stepin", client_version = 0}, -- fire field
	{itemid = 1501, type = "additem", client_version = 0}, -- fire field
	{itemid = 1500, type = "stepin", client_version = 0}, -- fire field
	{itemid = 1500, type = "additem", client_version = 0}, -- fire field
	{itemid = 1499, type = "stepin", client_version = 0}, -- rush wood
	{itemid = 1499, type = "additem", client_version = 0}, -- rush wood
	{itemid = 1498, type = "stepin", client_version = 0}, -- magic wall
	{itemid = 1498, type = "additem", client_version = 0}, -- magic wall
	{itemid = 1497, type = "stepin", client_version = 0}, -- magic wall
	{itemid = 1497, type = "additem", client_version = 0}, -- magic wall
	{itemid = 1496, type = "stepin", client_version = 0}, -- poison field
	{itemid = 1496, type = "additem", client_version = 0}, -- poison field
	{itemid = 1495, type = "stepin", client_version = 0}, -- energy field
	{itemid = 1495, type = "additem", client_version = 0}, -- energy field
	{itemid = 1494, type = "stepin", client_version = 0}, -- fire field
	{itemid = 1494, type = "additem", client_version = 0}, -- fire field
	{itemid = 1493, type = "stepin", client_version = 0}, -- fire field
	{itemid = 1493, type = "additem", client_version = 0}, -- fire field
	{itemid = 1492, type = "stepin", client_version = 0}, -- fire field
	{itemid = 1492, type = "additem", client_version = 0}, -- fire field
	{itemid = 1491, type = "stepin", client_version = 0}, -- energy field
	{itemid = 1491, type = "additem", client_version = 0}, -- energy field
	{itemid = 1490, type = "stepin", client_version = 0}, -- poison field
	{itemid = 1490, type = "additem", client_version = 0}, -- poison field
	{itemid = 1489, type = "stepin", client_version = 0}, -- fire field
	{itemid = 1489, type = "additem", client_version = 0}, -- fire field
	{itemid = 1488, type = "stepin", client_version = 0}, -- fire field
	{itemid = 1488, type = "additem", client_version = 0}, -- fire field
	{itemid = 1487, type = "stepin", client_version = 0}, -- fire field
	{itemid = 1487, type = "additem", client_version = 0}, -- fire field
	{itemid = 1425, type = "stepin", client_version = 0}, -- campfire
	{itemid = 1425, type = "additem", client_version = 0}, -- campfire
	{itemid = 1424, type = "stepin", client_version = 0}, -- campfire
	{itemid = 1424, type = "additem", client_version = 0}, -- campfire
	{itemid = 1423, type = "stepin", client_version = 0}, -- campfire
	{itemid = 1423, type = "additem", client_version = 0}, -- campfire
	{itemid = 1294, type = "equip", slot = "hand", client_version = 0}, -- small stone
	{itemid = 1294, type = "deequip", slot = "hand", client_version = 0} -- small stone
}

for _, i in ipairs(items) do
	if(CLIENT_VERSION >= i.client_version) then
		local movement = MoveEvent()
		movement:id(i.itemid)
		if(i.type) then
			movement:type(i.type)
		end
		if(i.slot) then
			movement:slot(i.slot)
		end
		if(i.level) then
			movement:level(i.level)
		end
		if(i.vocation) then
			for _, v in ipairs(i.vocation) do
				movement:vocation(v[1], v[2] or false, v[3] or false)
			end
		end
		movement:register()
	end
end
