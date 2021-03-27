local walkback = MoveEvent()
walkback:type("stepin")

function walkback.onStepIn(creature, item, position, fromPosition)
	if item.uid > 0 and item.uid <= 65535 then
		creature:teleportTo(fromPosition, false)
	end
	return true
end

if(CLIENT_VERSION >= 780) then
	walkback:id(5674, 5675)
end
if(CLIENT_VERSION >= 800) then
	walkback:id(7160, 7161)
end
if(CLIENT_VERSION >= 1110) then
	walkback:id(25229,25230,25231,25232,26164,26165,26166,26167)
end
if(CLIENT_VERSION >= 1186) then
	walkback:id(28938,28939,28940,28941)
end
walkback:id(2469,2471,2472,2473,2478,2480,2481,2482,2483,2484,2485,2486)
walkback:register()
