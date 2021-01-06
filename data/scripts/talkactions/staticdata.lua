local talk = TalkAction("/staticdata")

local monsters = {}
local achievements = {}
local houses = {}

local function ReadProtobufTag(file)
	local res = string.byte(file:read(1))
	if res < 128 then
		return res
	end

	for i = 1, 5 do
		local byte = string.byte(file:read(1))
		res = res + (bit.lshift((byte - 1), (7 * i)))
		if byte < 128 then
			return res
		end
	end

	return 0
end

local function ReadProtobufSize(file)
	local res = string.byte(file:read(1))
	if res < 128 then
		return res
	end

	local tmp = 1
	for i = 0, 4 do
		local byte = string.byte(file:read(1))
		tmp = tmp + (bit.lshift((byte - 1), (7 * i)))
		if byte < 128 then
			break
		end
	end

	if tmp >= (bit.lshift(1, 24) - 16) then
		return 0
	end

	return (bit.lshift(tmp, 7) + res - 0x80)
end

local function ReadProtobufVariant(file)
	local res = string.byte(file:read(1))
	if res < 128 then
		return res
	end

	for i = 1, 10 do
		local byte = string.byte(file:read(1))
		res = res + (bit.lshift((byte - 1), (7 * i)))
		if byte < 128 then
			return res
		end
	end

	return 0
end

local function ReadProtobufString(file)
	local len = ReadProtobufSize(file)
	if len > 0 then
		return file:read(len)
	end

	return ""
end

function talk.onSay(player, words, param)
	local staticData1260 = false
	if player:getGroup():getAccess() then
		if param ~= "" then
			local file = io.open("data/for-future/" .. param, "rb")
			if file then
				while file:read(0) do
					local tag = ReadProtobufTag(file)
					local tagHigh = bit.rshift(tag, 3)
					local tagLow = bit.band(tag, 0xFF)
					if tagHigh == 1 and tagLow == 10 then -- repeated Creature monsters = 1;
						monsters[#monsters + 1] = {}
						local monster = monsters[#monsters]

						local monstersLimit = ReadProtobufSize(file)
						monstersLimit = monstersLimit + file:seek("cur", 0)
						while file:seek("cur", 0) < monstersLimit do
							tag = ReadProtobufTag(file)
							tagHigh = bit.rshift(tag, 3)
							tagLow = bit.band(tag, 0xFF)
							if tagHigh == 1 and tagLow == 8 then -- optional uint32 id = 1;
								monster.id = ReadProtobufVariant(file)
							elseif tagHigh == 2 and tagLow == 18 then -- optional string name = 2;
								monster.name = ReadProtobufString(file)
							elseif tagHigh == 3 and tagLow == 26 then -- optional Outfit outfit = 3;
								monster.outfit = {looktype = 0, lookhead = 0, lookbody = 0, looklegs = 0, lookfeet = 0, lookaddons = 0}

								local outfitLimit = ReadProtobufSize(file)
								outfitLimit = outfitLimit + file:seek("cur", 0)
								while file:seek("cur", 0) < outfitLimit do
									tag = ReadProtobufTag(file)
									tagHigh = bit.rshift(tag, 3)
									tagLow = bit.band(tag, 0xFF)
									if tagHigh == 1 and tagLow == 8 then -- optional uint32 looktype = 1;
										monster.outfit.looktype = ReadProtobufVariant(file)
									elseif tagHigh == 2 and tagLow == 16 then -- optional uint32 lookhead = 2;
										monster.outfit.lookhead = ReadProtobufVariant(file)
									elseif tagHigh == 2 and tagLow == 18 then -- optional OutfitLook lookhead = 2;
										staticData1260 = true

										local outfitLookLimit = ReadProtobufSize(file)
										outfitLookLimit = outfitLookLimit + file:seek("cur", 0)
										while file:seek("cur", 0) < outfitLookLimit do
											tag = ReadProtobufTag(file)
											tagHigh = bit.rshift(tag, 3)
											tagLow = bit.band(tag, 0xFF)
											if tagHigh == 1 and tagLow == 8 then -- optional uint32 lookhead = 1;
												monster.outfit.lookhead = ReadProtobufVariant(file)
											elseif tagHigh == 2 and tagLow == 16 then -- optional uint32 lookbody = 2;
												monster.outfit.lookbody = ReadProtobufVariant(file)
											elseif tagHigh == 3 and tagLow == 24 then -- optional uint32 looklegs = 3;
												monster.outfit.looklegs = ReadProtobufVariant(file)
											elseif tagHigh == 4 and tagLow == 32 then -- optional uint32 lookfeet = 4;
												monster.outfit.lookfeet = ReadProtobufVariant(file)
											else
												break
											end
										end
									elseif tagHigh == 3 and tagLow == 24 then -- optional uint32 lookbody = 3; or optional uint32 lookaddons = 3;
										if staticData1260 then
											monster.outfit.lookaddons = ReadProtobufVariant(file)
										else
											monster.outfit.lookbody = ReadProtobufVariant(file)
										end
									elseif tagHigh == 4 and tagLow == 32 then -- optional uint32 looklegs = 4;
										monster.outfit.looklegs = ReadProtobufVariant(file)
									elseif tagHigh == 5 and tagLow == 40 then -- optional uint32 lookfeet = 5;
										monster.outfit.lookfeet = ReadProtobufVariant(file)
									elseif tagHigh == 6 and tagLow == 48 then -- optional uint32 lookaddons = 6;
										monster.outfit.lookaddons = ReadProtobufVariant(file)
									else
										break
									end
								end
							else
								break
							end
						end
					elseif tagHigh == 2 and tagLow == 18 then -- repeated Achievement achievements = 2;
						achievements[#achievements + 1] = {}
						local achievement = achievements[#achievements]

						local achievementsLimit = ReadProtobufSize(file)
						achievementsLimit = achievementsLimit + file:seek("cur", 0)
						while file:seek("cur", 0) < achievementsLimit do
							tag = ReadProtobufTag(file)
							tagHigh = bit.rshift(tag, 3)
							tagLow = bit.band(tag, 0xFF)
							if tagHigh == 1 and tagLow == 8 then -- optional uint32 id = 1;
								achievement.id = ReadProtobufVariant(file)
							elseif tagHigh == 2 and tagLow == 18 then -- optional string name = 2;
								achievement.name = ReadProtobufString(file)
							elseif tagHigh == 3 and tagLow == 26 then -- optional string description = 3;
								achievement.description = ReadProtobufString(file)
							elseif tagHigh == 4 and tagLow == 32 then -- optional uint32 grade = 4;
								achievement.grade = ReadProtobufVariant(file)
							else
								break
							end
						end
					elseif tagHigh == 3 and tagLow == 26 then -- repeated House houses = 3;
						houses[#houses + 1] = {}
						local house = houses[#houses]

						local housesLimit = ReadProtobufSize(file)
						housesLimit = housesLimit + file:seek("cur", 0)
						while file:seek("cur", 0) < housesLimit do
							tag = ReadProtobufTag(file)
							tagHigh = bit.rshift(tag, 3)
							tagLow = bit.band(tag, 0xFF)
							if tagHigh == 1 and tagLow == 8 then -- optional uint32 id = 1;
								house.id = ReadProtobufVariant(file)
							elseif tagHigh == 2 and tagLow == 18 then -- optional string name = 2;
								house.name = ReadProtobufString(file)
							elseif tagHigh == 3 and tagLow == 26 then -- optional string description = 3;
								house.description = ReadProtobufString(file)
							elseif tagHigh == 4 and tagLow == 32 then -- optional uint32 rent = 4;
								house.rent = ReadProtobufVariant(file)
							elseif tagHigh == 5 and tagLow == 40 then -- optional uint32 beds = 5;
								house.beds = ReadProtobufVariant(file)
							elseif tagHigh == 6 and tagLow == 50 then -- optional Position position = 6;
								house.position = {}

								local positionLimit = ReadProtobufSize(file)
								positionLimit = positionLimit + file:seek("cur", 0)
								while file:seek("cur", 0) < positionLimit do
									tag = ReadProtobufTag(file)
									tagHigh = bit.rshift(tag, 3)
									tagLow = bit.band(tag, 0xFF)
									if tagHigh == 1 and tagLow == 8 then -- optional uint32 x = 1;
										house.position.x = ReadProtobufVariant(file)
									elseif tagHigh == 2 and tagLow == 16 then -- optional uint32 y = 2;
										house.position.y = ReadProtobufVariant(file)
									elseif tagHigh == 3 and tagLow == 24 then -- optional uint32 z = 3;
										house.position.z = ReadProtobufVariant(file)
									else
										break
									end
								end
							elseif tagHigh == 7 and tagLow == 56 then -- optional uint32 SQMs = 7;
								house.SQMs = ReadProtobufVariant(file)
							elseif tagHigh == 8 and tagLow == 64 then -- optional bool isGuildHall = 8;
								house.isGuildHall = (ReadProtobufVariant(file) ~= 0)
							elseif tagHigh == 9 and tagLow == 74 then -- optional string city = 9;
								house.city = ReadProtobufString(file)
							elseif tagHigh == 10 and tagLow == 80 then -- optional bool isShop = 10;
								house.isShop = (ReadProtobufVariant(file) ~= 0)
							else
								break
							end
						end
					else
						break
					end
				end

				io.close(file)

				file = io.open("data/for-future/staticdata.txt", "wb")
				if file then
					file:write("# monsters")
					for i = 1, #monsters do
						local monster = monsters[i]
						if monster.outfit.looktype == 0 then
							file:write("\n<monster id=\""..monster.id.."\" name=\""..monster.name.."\" looktypeex=\""..(monster.outfit.lookhead > 0 and monster.outfit.lookhead or monster.outfit.lookbody > 0 and monster.outfit.lookbody or monster.outfit.looklegs > 0 and monster.outfit.looklegs or monster.outfit.lookfeet).."\" addons=\""..monster.outfit.lookaddons.."\" />")
						else
							file:write("\n<monster id=\""..monster.id.."\" name=\""..monster.name.."\" looktype=\""..monster.outfit.looktype.."\" head=\""..monster.outfit.lookhead.."\" body=\""..monster.outfit.lookbody.."\" legs=\""..monster.outfit.looklegs.."\" feet=\""..monster.outfit.lookfeet.."\" addons=\""..monster.outfit.lookaddons.."\" />")
						end
					end

					file:write("\n\n# achievements")
					for i = 1, #achievements do
						local achievement = achievements[i]
						file:write("\n<achievement id=\""..achievement.id.."\" name=\""..achievement.name.."\" description=\""..achievement.description.."\" grade=\""..achievement.grade.."\" />")
					end

					file:write("\n\n# houses")
					for i = 1, #houses do
						local house = houses[i]
						if house.description and house.description:len() > 0 then
							file:write("\n<house id=\""..house.id.."\" name=\""..house.name.."\" city=\""..house.city.."\" description=\""..house.description.."\" x=\""..house.position.x.."\" y=\""..house.position.y.."\" z=\""..house.position.z.."\" rent=\""..house.rent.."\" sqms=\""..house.SQMs.."\" beds=\""..house.beds.."\" guildHall=\""..(house.isGuildHall and "yes" or "no").."\" shop=\""..(house.isShop and "yes" or "no").."\" />")
						else
							file:write("\n<house id=\""..house.id.."\" name=\""..house.name.."\" city=\""..house.city.."\" x=\""..house.position.x.."\" y=\""..house.position.y.."\" z=\""..house.position.z.."\" rent=\""..house.rent.."\" sqms=\""..house.SQMs.."\" beds=\""..house.beds.."\" guildHall=\""..(house.isGuildHall and "yes" or "no").."\" shop=\""..(house.isShop and "yes" or "no").."\" />")
						end
					end

					io.close(file)
				end
			else
				player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "File not found.")
			end
		else
			player:sendTextMessage(MESSAGE_STATUS_CONSOLE_BLUE, "You need to include filename.")
		end
	end
	return false
end

talk:separator(" ")
talk:register()
