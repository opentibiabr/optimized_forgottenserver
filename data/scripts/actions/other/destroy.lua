local destroyItems = {
	--{itemid, client_version}
	{37451, 1230}, -- phantasmal axe
	{36928, 1220}, -- meat hammer
	{36449, 1220}, -- tagralt blade
	{36415, 1220}, -- mortal mace
	{35233, 1220}, -- cobra sword
	{35231, 1220}, -- cobra axe
	{35230, 1220}, -- cobra club
	{35112, 1202}, -- ice hatchet
	{34060, 1200}, -- winterblade
	{34059, 1200}, -- summerblade
	{34057, 1200}, -- resizer
	{33925, 1200}, -- golden axe
	{33252, 1180}, -- test weapon for knights
	{32529, 1180}, -- sulphurous demonbone
	{32528, 1180}, -- unliving demonbone
	{32527, 1180}, -- energized demonbone
	{32526, 1180}, -- rotten demonbone
	{32425, 1180}, -- falcon mace
	{32424, 1180}, -- falcon battleaxe
	{32423, 1180}, -- falcon longsword
	{30886, 1150}, -- gnome sword
	{30760, 1150}, -- mallet handle
	{30758, 1150}, -- strange mallet
	{30689, 1150}, -- hammer of destruction
	{30688, 1150}, -- mace of destruction
	{30687, 1150}, -- chopper of destruction
	{30686, 1150}, -- axe of destruction
	{30685, 1150}, -- slayer of destruction
	{30684, 1150}, -- blade of destruction
	{29297, 1140}, -- ornate carving hammer
	{29296, 1140}, -- valuable carving hammer
	{29295, 1140}, -- plain carving hammer
	{29294, 1140}, -- ornate carving mace
	{29293, 1140}, -- valuable carving mace
	{29292, 1140}, -- plain carving mace
	{29291, 1140}, -- ornate carving chopper
	{29290, 1140}, -- valuable carving chopper
	{29289, 1140}, -- plain carving chopper
	{29288, 1140}, -- ornate carving axe
	{29287, 1140}, -- valuable carving axe
	{29286, 1140}, -- plain carving axe
	{29285, 1140}, -- ornate carving slayer
	{29284, 1140}, -- valuable carving slayer
	{29283, 1140}, -- plain carving slayer
	{29282, 1140}, -- ornate carving blade
	{29281, 1140}, -- valuable carving blade
	{29280, 1140}, -- plain carving blade
	{29267, 1140}, -- ornate remedy hammer
	{29266, 1140}, -- valuable remedy hammer
	{29265, 1140}, -- plain remedy hammer
	{29264, 1140}, -- ornate remedy mace
	{29263, 1140}, -- valuable remedy mace
	{29262, 1140}, -- plain remedy mace
	{29261, 1140}, -- ornate remedy chopper
	{29260, 1140}, -- valuable remedy chopper
	{29259, 1140}, -- plain remedy chopper
	{29258, 1140}, -- ornate remedy axe
	{29257, 1140}, -- valuable remedy axe
	{29256, 1140}, -- plain remedy axe
	{29255, 1140}, -- ornate remedy slayer
	{29254, 1140}, -- valuable remedy slayer
	{29253, 1140}, -- plain remedy slayer
	{29252, 1140}, -- ornate remedy blade
	{29251, 1140}, -- valuable remedy blade
	{29250, 1140}, -- plain remedy blade
	{29236, 1140}, -- ornate mayhem hammer
	{29235, 1140}, -- valuable mayhem hammer
	{29234, 1140}, -- plain mayhem hammer
	{29233, 1140}, -- ornate mayhem mace
	{29232, 1140}, -- valuable mayhem mace
	{29231, 1140}, -- plain mayhem mace
	{29230, 1140}, -- ornate mayhem chopper
	{29229, 1140}, -- valuable mayhem chopper
	{29228, 1140}, -- plain mayhem chopper
	{29227, 1140}, -- ornate mayhem axe
	{29226, 1140}, -- valuable mayhem axe
	{29225, 1140}, -- plain mayhem axe
	{29224, 1140}, -- ornate mayhem slayer
	{29223, 1140}, -- valuable mayhem slayer
	{29222, 1140}, -- plain mayhem slayer
	{29221, 1140}, -- ornate mayhem blade
	{29220, 1140}, -- valuable mayhem blade
	{29219, 1140}, -- plain mayhem blade
	{29210, 1140}, -- energy war hammer replica
	{29209, 1140}, -- energy orcish maul replica
	{29208, 1140}, -- energy basher replica
	{29207, 1140}, -- energy crystal mace replica
	{29206, 1140}, -- energy clerical mace replica
	{29205, 1140}, -- energy war axe replica
	{29204, 1140}, -- energy headchopper replica
	{29203, 1140}, -- energy heroic axe replica
	{29202, 1140}, -- energy knight axe replica
	{29201, 1140}, -- energy barbarian axe replica
	{29200, 1140}, -- energy dragon slayer replica
	{29199, 1140}, -- energy blacksteel replica
	{29198, 1140}, -- energy mystic blade replica
	{29197, 1140}, -- energy relic sword replica
	{29196, 1140}, -- energy spike sword replica
	{29195, 1140}, -- earth war hammer replica
	{29194, 1140}, -- earth orcish maul replica
	{29193, 1140}, -- earth basher replica
	{29192, 1140}, -- earth crystal mace replica
	{29191, 1140}, -- earth clerical mace replica
	{29190, 1140}, -- earth war axe replica
	{29189, 1140}, -- earth headchopper replica
	{29188, 1140}, -- earth heroic axe replica
	{29187, 1140}, -- earth knight axe replica
	{29186, 1140}, -- earth barbarian axe replica
	{29185, 1140}, -- earth dragon slayer replica
	{29184, 1140}, -- earth blacksteel replica
	{29183, 1140}, -- earth mystic blade replica
	{29182, 1140}, -- earth relic sword replica
	{29181, 1140}, -- earth spike sword replica
	{29180, 1140}, -- icy war hammer replica
	{29179, 1140}, -- icy orcish maul replica
	{29178, 1140}, -- icy basher replica
	{29177, 1140}, -- icy crystal mace replica
	{29176, 1140}, -- icy clerical mace replica
	{29175, 1140}, -- icy war axe replica
	{29174, 1140}, -- icy headchopper replica
	{29173, 1140}, -- icy heroic axe replica
	{29172, 1140}, -- icy knight axe replica
	{29171, 1140}, -- icy barbarian axe replica
	{29170, 1140}, -- icy dragon slayer replica
	{29169, 1140}, -- icy blacksteel replica
	{29168, 1140}, -- icy mystic blade replica
	{29167, 1140}, -- icy relic sword replica
	{29166, 1140}, -- icy spike sword replica
	{29165, 1140}, -- fiery war hammer replica
	{29164, 1140}, -- fiery orcish maul replica
	{29163, 1140}, -- fiery basher replica
	{29162, 1140}, -- fiery crystal mace replica
	{29161, 1140}, -- fiery clerical mace replica
	{29160, 1140}, -- fiery war axe replica
	{29159, 1140}, -- fiery headchopper replica
	{29158, 1140}, -- fiery heroic axe replica
	{29157, 1140}, -- fiery knight axe replica
	{29156, 1140}, -- fiery barbarian axe replica
	{29155, 1140}, -- fiery dragon slayer replica
	{29154, 1140}, -- fiery blacksteel replica
	{29153, 1140}, -- fiery mystic blade replica
	{29152, 1140}, -- fiery relic sword replica
	{29151, 1140}, -- fiery spike sword replica
	{25979, 1094}, -- hammer of carving
	{25975, 1094}, -- mace of carving
	{25971, 1094}, -- chopper of carving
	{25967, 1094}, -- axe of carving
	{25963, 1094}, -- slayer of carving
	{25959, 1094}, -- blade of carving
	{25939, 1094}, -- hammer of remedy
	{25935, 1094}, -- mace of remedy
	{25931, 1094}, -- chopper of remedy
	{25927, 1094}, -- axe of remedy
	{25923, 1094}, -- slayer of remedy
	{25919, 1094}, -- blade of remedy
	{25884, 1094}, -- hammer of mayhem
	{25883, 1094}, -- mace of mayhem
	{25882, 1094}, -- chopper of mayhem
	{25881, 1094}, -- axe of mayhem
	{25880, 1094}, -- slayer of mayhem
	{25879, 1094}, -- blade of mayhem
	{25420, 1090}, -- Ferumbras' staff
	{25418, 1090}, -- maimer
	{25416, 1090}, -- Impaler of the igniter
	{25415, 1090}, -- plague bite
	{25383, 1090}, -- rift lance
	{24828, 1090}, -- ogre choppa
	{24827, 1090}, -- ogre klubba
	{23590, 1050}, -- one hit wonder
	{23551, 1050}, -- glooth axe
	{23550, 1050}, -- glooth blade
	{23549, 1050}, -- glooth club
	{23548, 1050}, -- cowtana
	{23547, 1050}, -- execowtioner axe
	{23545, 1050}, -- mino lance
	{23544, 1050}, -- moohtant cudgel
	{23543, 1050}, -- glooth whip
	{23542, 1050}, -- metal bat
	{22415, 1030}, -- umbral master hammer
	{22414, 1030}, -- umbral hammer
	{22413, 1030}, -- crude umbral hammer
	{22412, 1030}, -- umbral master mace
	{22411, 1030}, -- umbral mace
	{22410, 1030}, -- crude umbral mace
	{22409, 1030}, -- umbral master chopper
	{22408, 1030}, -- umbral chopper
	{22407, 1030}, -- crude umbral chopper
	{22406, 1030}, -- umbral master axe
	{22405, 1030}, -- umbral axe
	{22404, 1030}, -- crude umbral axe
	{22403, 1030}, -- umbral master slayer
	{22402, 1030}, -- umbral slayer
	{22401, 1030}, -- crude umbral slayer
	{22400, 1030}, -- umbral masterblade
	{22399, 1030}, -- umbral blade
	{22398, 1030}, -- crude umbral blade
	{20139, 980}, -- spiky club
	{20108, 980}, -- pair of iron fists
	{20104, 980}, -- swampling club
	{20093, 980}, -- life preserver
	{20092, 980}, -- ratana
	{19389, 980}, -- mean knight sword
	{18465, 960}, -- shiny blade
	{18452, 960}, -- mycological mace
	{18451, 960}, -- crystalline axe
	{18450, 960}, -- crystalline sword
	{15647, 940}, -- deepling squelcher
	{15454, 940}, -- guardian axe
	{15451, 940}, -- warrior's axe
	{15414, 940}, -- ornate mace
	{15404, 940}, -- deepling axe
	{15400, 940}, -- deepling staff
	{13871, 910}, -- shimmer sword
	{13838, 910}, -- heavy trident
	{13829, 910}, -- wooden sword
	{12649, 860}, -- blade of corruption
	{12648, 860}, -- snake god's sceptre
	{12613, 860}, -- twiceslicer
	{11323, 854}, -- Zaoan halberd
	{11309, 854}, -- twin hooks
	{11308, 854}, -- drachaku
	{11307, 854}, -- Zaoan sword
	{11306, 854}, -- sai
	{11305, 854}, -- drakinata
	{10313, 850}, -- incredible mumpiz slayer
	{10304, 850}, -- poet's fencing quill
	{10303, 850}, -- farmer's avenger
	{10302, 850}, -- club of the fury
	{10293, 850}, -- stale bread of ancientness
	{10292, 850}, -- pointed rabbitslayer
	{10290, 850}, -- glutton's mace
	{8932, 820}, -- the calamity
	{8931, 820}, -- the epiphany
	{8930, 820}, -- emerald sword
	{8929, 820}, -- the stomper
	{8928, 820}, -- obsidian truncheon
	{8927, 820}, -- dark trinity mace
	{8926, 820}, -- demonwing axe
	{8925, 820}, -- solar axe
	{8924, 820}, -- hellforged axe
	{8602, 820}, -- jagged sword
	{8601, 820}, -- steel axe
	{8209, 810}, -- crimson sword
	{7883, 810}, -- energy war hammer
	{7882, 810}, -- energy orcish maul
	{7881, 810}, -- energy cranial basher
	{7880, 810}, -- energy crystal mace
	{7879, 810}, -- energy clerical mace
	{7878, 810}, -- energy war axe
	{7877, 810}, -- energy headchopper
	{7876, 810}, -- energy heroic axe
	{7875, 810}, -- energy knight axe
	{7874, 810}, -- energy barbarian axe
	{7873, 810}, -- energy dragon slayer
	{7872, 810}, -- energy blacksteel sword
	{7871, 810}, -- energy mystic blade
	{7870, 810}, -- energy relic sword
	{7869, 810}, -- energy spike sword
	{7868, 810}, -- earth war hammer
	{7867, 810}, -- earth orcish maul
	{7866, 810}, -- earth cranial basher
	{7865, 810}, -- earth crystal mace
	{7864, 810}, -- earth clerical mace
	{7863, 810}, -- earth war axe
	{7862, 810}, -- earth headchopper
	{7861, 810}, -- earth heroic axe
	{7860, 810}, -- earth knight axe
	{7859, 810}, -- earth barbarian axe
	{7858, 810}, -- earth dragon slayer
	{7857, 810}, -- earth blacksteel sword
	{7856, 810}, -- earth mystic blade
	{7855, 810}, -- earth relic sword
	{7854, 810}, -- earth spike sword
	{7777, 810}, -- icy war hammer
	{7776, 810}, -- icy orcish maul
	{7775, 810}, -- icy cranial basher
	{7774, 810}, -- icy crystal mace
	{7773, 810}, -- icy clerical mace
	{7772, 810}, -- icy war axe
	{7771, 810}, -- icy headchopper
	{7770, 810}, -- icy heroic axe
	{7769, 810}, -- icy knight axe
	{7768, 810}, -- icy barbarian axe
	{7767, 810}, -- icy dragon slayer
	{7766, 810}, -- icy blacksteel sword
	{7765, 810}, -- icy mystic blade
	{7764, 810}, -- icy relic sword
	{7763, 810}, -- icy spike sword
	{7758, 810}, -- fiery war hammer
	{7757, 810}, -- fiery orcish maul
	{7756, 810}, -- fiery cranial basher
	{7755, 810}, -- fiery crystal mace
	{7754, 810}, -- fiery clerical mace
	{7753, 810}, -- fiery war axe
	{7752, 810}, -- fiery headchopper
	{7751, 810}, -- fiery heroic axe
	{7750, 810}, -- fiery knight axe
	{7749, 810}, -- fiery barbarian axe
	{7748, 810}, -- fiery dragon slayer
	{7747, 810}, -- fiery blacksteel sword
	{7746, 810}, -- fiery mystic blade
	{7745, 810}, -- fiery relic sword
	{7744, 810}, -- fiery spike sword
	{7456, 800}, -- noble axe
	{7455, 800}, -- mythril axe
	{7454, 800}, -- glorious axe
	{7453, 800}, -- executioner
	{7452, 800}, -- spiked squelcher
	{7451, 800}, -- shadow sceptre
	{7450, 800}, -- hammer of prophecy
	{7449, 800}, -- crystal sword
	{7437, 800}, -- sapphire hammer
	{7436, 800}, -- angelic axe
	{7435, 800}, -- impaler
	{7434, 800}, -- royal axe
	{7433, 800}, -- ravenwing
	{7432, 800}, -- furry club
	{7431, 800}, -- demonbone
	{7430, 800}, -- dragonbone staff
	{7429, 800}, -- blessed sceptre
	{7428, 800}, -- bonebreaker
	{7427, 800}, -- chaos mace
	{7426, 800}, -- amber staff
	{7425, 800}, -- taurus mace
	{7424, 800}, -- lunar staff
	{7423, 800}, -- skullcrusher
	{7422, 800}, -- jade hammer
	{7421, 800}, -- onyx flail
	{7420, 800}, -- reaper's axe
	{7419, 800}, -- dreaded cleaver
	{7418, 800}, -- nightmare blade
	{7417, 800}, -- runed sword
	{7416, 800}, -- bloody edge
	{7415, 800}, -- cranial basher
	{7414, 800}, -- abyss hammer
	{7413, 800}, -- titan axe
	{7412, 800}, -- butcher's axe
	{7411, 800}, -- ornamented axe
	{7410, 800}, -- queen's sceptre
	{7409, 800}, -- northern star
	{7408, 800}, -- wyvern fang
	{7407, 800}, -- haunted blade
	{7406, 800}, -- blacksteel sword
	{7405, 800}, -- havoc blade
	{7404, 800}, -- assassin dagger
	{7403, 800}, -- berserker
	{7402, 800}, -- dragon slayer
	{7392, 800}, -- orcish maul
	{7391, 800}, -- thaian sword
	{7390, 800}, -- the justice seeker
	{7389, 800}, -- heroic axe
	{7388, 800}, -- vile axe
	{7387, 800}, -- diamond sceptre
	{7386, 800}, -- mercenary sword
	{7385, 800}, -- crimson sword
	{7384, 800}, -- mystic blade
	{7383, 800}, -- relic sword
	{7382, 800}, -- demonrage sword
	{7381, 800}, -- mammoth whopper
	{7380, 800}, -- headchopper
	{7379, 800}, -- brutetamer's staff
	{6553, 790}, -- ruthless axe
	{6528, 790}, -- the avenger
	{6101, 780}, -- Ron the Ripper's sabre
	{3966, 750}, -- banana staff
	{3964, 750}, -- ripper lance
	{3962, 750}, -- beastslayer axe
	{3961, 750}, -- lich staff
	{2454, 0}, -- war axe
	{2453, 0}, -- arcane staff
	{2452, 0}, -- heavy mace
	{2451, 0}, -- djinn blade
	{2450, 0}, -- bone sword
	{2449, 0}, -- bone club
	{2448, 0}, -- studded club
	{2447, 0}, -- twin axe
	{2446, 0}, -- pharaoh sword
	{2445, 0}, -- crystal mace
	{2444, 0}, -- hammer of wrath
	{2443, 0}, -- ravager's axe
	{2441, 0}, -- daramian axe
	{2440, 0}, -- daramian waraxe
	{2439, 0}, -- daramian mace
	{2438, 0}, -- epee
	{2437, 0}, -- light mace
	{2436, 0}, -- skull staff
	{2435, 0}, -- dwarven axe
	{2434, 0}, -- dragon hammer
	{2433, 0}, -- enchanted staff
	{2432, 0}, -- fire axe
	{2431, 0}, -- stonecutter axe
	{2430, 0}, -- knight axe
	{2429, 0}, -- barbarian axe
	{2428, 0}, -- orcish axe
	{2427, 0}, -- guardian halberd
	{2426, 0}, -- naginata
	{2425, 0}, -- obsidian lance
	{2424, 0}, -- silver mace
	{2423, 0}, -- clerical mace
	{2422, 0}, -- iron hammer
	{2421, 0}, -- thunder hammer
	{2419, 0}, -- scimitar
	{2417, 0}, -- battle hammer
	{2415, 0}, -- great axe
	{2414, 0}, -- dragon lance
	{2413, 0}, -- broadsword
	{2412, 0}, -- katana
	{2411, 0}, -- poison dagger
	{2409, 0}, -- serpent sword
	{2408, 0}, -- warlord sword
	{2407, 0}, -- bright sword
	{2406, 0}, -- short sword
	{2404, 0}, -- combat knife
	{2403, 0}, -- knife
	{2402, 0}, -- silver dagger
	{2401, 0}, -- staff
	{2400, 0}, -- magic sword
	{2398, 0}, -- mace
	{2397, 0}, -- longsword
	{2396, 0}, -- ice rapier
	{2395, 0}, -- carlin sword
	{2394, 0}, -- morning star
	{2393, 0}, -- giant sword
	{2392, 0}, -- fire sword
	{2391, 0}, -- war hammer
	{2390, 0}, -- magic longsword
	{2388, 0}, -- hatchet
	{2387, 0}, -- double axe
	{2386, 0}, -- axe
	{2385, 0}, -- sabre
	{2384, 0}, -- rapier
	{2383, 0}, -- spike sword
	{2382, 0}, -- club
	{2381, 0}, -- halberd
	{2380, 0}, -- hand axe
	{2379, 0}, -- dagger
	{2378, 0}, -- battle axe
	{2377, 0}, -- two handed sword
	{2376, 0}, -- sword
	{2321, 0} -- giant smithhammer
}
local destroy = Action()

function destroy.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	return ActionsLib.destroyItem(player, target, toPosition)
end

for _, d in ipairs(destroyItems) do
	if(CLIENT_VERSION >= d[2]) then
		destroy:id(d[1])
	end
end
destroy:register()
