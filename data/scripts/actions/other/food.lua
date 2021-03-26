local foods = {
	--[itemid] = {foodvalue, saytext, client_version}
	[3250] = {5, "Crunch.", 0}, -- carrot
	[3577] = {15, "Munch.", 0}, -- meat
	[3578] = {12, "Munch.", 0}, -- fish
	[3579] = {10, "Mmmm.", 0}, -- salmon
	[3580] = {17, "Munch.", 0}, -- northern pike
	[3581] = {4, "Gulp.", 0}, -- shrimp
	[3582] = {30, "Chomp.", 0}, -- ham
	[3583] = {60, "Chomp.", 0}, -- dragon ham
	[3584] = {5, "Yum.", 0}, -- pear
	[3585] = {6, "Yum.", 0}, -- red apple
	[3586] = {13, "Yum.", 0}, -- orange
	[3587] = {8, "Yum.", 0}, -- banana
	[3588] = {1, "Yum.", 0}, -- blueberry
	[3589] = {18, "Slurp.", 0}, -- coconut
	[3590] = {1, "Yum.", 0}, -- cherry
	[3591] = {2, "Yum.", 0}, -- strawberry
	[3592] = {9, "Yum.", 0}, -- grapes
	[3593] = {20, "Yum.", 0}, -- melon
	[3594] = {17, "Munch.", 0}, -- pumpkin
	[3595] = {5, "Crunch.", 0}, -- carrot
	[3596] = {6, "Munch.", 0}, -- tomato
	[3597] = {9, "Crunch.", 0}, -- corncob
	[3598] = {2, "Crunch.", 0}, -- cookie
	[3599] = {2, "Munch.", 0}, -- candy cane
	[3600] = {10, "Crunch.", 0}, -- bread
	[3601] = {3, "Crunch.", 0}, -- roll
	[3602] = {8, "Crunch.", 0}, -- brown bread
	[3606] = {6, "Gulp.", 0}, -- egg
	[3608] = {9, "Smack.", 0}, -- cheese
	[3723] = {9, "Munch.", 0}, -- white mushroom
	[3724] = {4, "Munch.", 0}, -- red mushroom
	[3725] = {22, "Munch.", 0}, -- brown mushroom
	[3726] = {30, "Munch.", 0}, -- orange mushroom
	[3727] = {9, "Munch.", 0}, -- wood mushroom
	[3728] = {6, "Munch.", 0}, -- dark mushroom
	[3729] = {12, "Munch.", 0}, -- some mushrooms
	[3730] = {3, "Munch.", 0}, -- some mushrooms
	[3731] = {36, "Munch.", 0}, -- fire mushroom
	[3732] = {5, "Munch.", 0}, -- green mushroom
	[5096] = {4, "Yum.", 780}, -- mango
	[6125] = {8, "Gulp.", 780}, -- tortoise egg
	[6277] = {10, "Mmmm.", 790}, -- cake
	[6278] = {15, "Mmmm.", 790}, -- decorated cake
	[6392] = {12, "Mmmm.", 790}, -- valentine's cake
	[6393] = {15, "Mmmm.", 790}, -- cream cake
	[6500] = {20, "Mmmm.", 790}, -- gingerbread man
	[6541] = {6, "Gulp.", 790}, -- coloured egg (yellow)
	[6542] = {6, "Gulp.", 790}, -- coloured egg (red)
	[6543] = {6, "Gulp.", 790}, -- coloured egg (blue)
	[6544] = {6, "Gulp.", 790}, -- coloured egg (green)
	[6545] = {6, "Gulp.", 790}, -- coloured egg (purple)
	[6569] = {1, "Mmmm.", 792}, -- candy
	[6574] = {5, "Mmmm.", 792}, -- bar of chocolate
	[7158] = {15, "Munch.", 800}, -- rainbow trout
	[7159] = {13, "Munch.", 800}, -- green perch
	[7372] = {2, "Yum.", 800}, -- ice cream cone (crispy chocolate chips)
	[7373] = {2, "Yum.", 800}, -- ice cream cone (velvet vanilla)
	[7374] = {2, "Yum.", 800}, -- ice cream cone (sweet strawberry)
	[7375] = {2, "Yum.", 800}, -- ice cream cone (chilly cherry)
	[7376] = {2, "Yum.", 800}, -- ice cream cone (mellow melon)
	[7377] = {2, "Yum.", 800}, -- ice cream cone (blue-barian)
	[169] = {9, "Urgh.", 810}, -- scarab cheese
	[836] = {4, "Crunch.", 810}, -- walnut
	[841] = {4, "Crunch.", 810}, -- peanut
	[901] = {60, "Munch.", 810}, -- marlin
	[8010] = {10, "Gulp.", 810}, -- potato
	[8011] = {5, "Yum.", 820}, -- plum
	[8012] = {1, "Yum.", 820}, -- raspberry
	[8013] = {1, "Urgh.", 820}, -- lemon
	[8014] = {7, "Munch.", 820}, -- cucumber
	[8015] = {5, "Crunch.", 820}, -- onion
	[8016] = {1, "Gulp.", 820}, -- jalapeño pepper
	[8017] = {5, "Munch.", 820}, -- beetroot
	[8018] = {11, "Yum.", 820}, -- chocolate cake
	[8019] = {7, "Slurp.", 820}, -- yummy gummy worm
	[8197] = {5, "Crunch.", 840}, -- bulb of garlic
	[9083] = {0, "Slurp.", 850}, -- banana chocolate shake
	[9537] = {0, "Your head begins to feel better.", 850}, -- headache pill
	[10329] = {15, "Yum.", 854}, -- rice ball
	[10453] = {3, "Urgh.", 854}, -- terramite eggs
	[10219] = {10, "Mmmm.", 854}, -- crocodile steak
	[11459] = {20, "Yum.", 860}, -- pineapple
	[11460] = {10, "Munch.", 860}, -- aubergine
	[11461] = {8, "Crunch.", 860}, -- broccoli
	[11462] = {9, "Crunch.", 860}, -- cauliflower
	[11681] = {55, "Gulp.", 860}, -- ectoplasmic sushi
	[11682] = {18, "Yum.", 860}, -- dragonfruit
	[11683] = {2, "Munch.", 860}, -- peas
	[12310] = {20, "Crunch.", 870}, -- haunch of boar
	[13992] = {55, "Munch.", 940}, -- sandfish
	[14084] = {14, "Urgh.", 940}, -- larvae
	[14085] = {15, "Munch.", 940}, -- deepling filet
	[14681] = {60, "Mmmm.", 944}, -- anniversary cake
	[16103] = {33, "Munch.", 960}, -- mushroom pie
	[17457] = {10, "Urgh.", 980}, -- insectoid eggs
	[17820] = {15, "Smack.", 980}, -- soft cheese
	[17821] = {12, "Smack.", 980}, -- rat cheese
	[20310] = {4, 'Mmmm.', 1030}, -- christmas cookie tray
	[22185] = {12, "Yum.", 1050}, -- prickly pear
	[22187] = {60, "Chomp.", 1050}, -- roasted meat
	[23535] = {30, "Mmmm.", 1094}, -- energy bar
	[23545] = {18, "Mmmm.", 1094}, -- energy drink
	[24382] = {20, 'Urgh.', 1102}, -- bug meat
	[24383] = {10, 'Gulp.', 1102}, -- cave turnip
	[24396] = {60, 'Mmmm.', 1102}, -- birthday cake
	[24948] = {10, 'Slurp.', 1102}, -- bottle of tibian wine
	[25692] = {15, 'Mmmmm!', 1140}, -- fresh fruit
	[30198] = {40, 'Mmmmm!', 1202}, -- meringue cake
	[30202] = {15, 'Slurp.', 1202} -- winterberry liquor
}

local food = Action()

function food.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	local food = foods[item.itemid]
	if not food then
		return false
	end

	local condition = player:getCondition(CONDITION_REGENERATION, CONDITIONID_DEFAULT)
	if condition and math.floor(condition:getTicks() / 1000 + (food[1] * 12)) >= 1200 then
		player:sendTextMessage(MESSAGE_STATUS_SMALL, "You are full.")
	else
		player:feed(food[1] * 12)
		player:say(food[2], TALKTYPE_MONSTER_SAY)
		item:remove(1)
	end
	return true
end

-- foodValues[3] = third value of the table (clientVersion)
for foodIds, foodValues in pairs(foods) do
	if(CLIENT_VERSION >= foodValues[3]) then
		food:id(foodIds)
	end
end

food:register()
