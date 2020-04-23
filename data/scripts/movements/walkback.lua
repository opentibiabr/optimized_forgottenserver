local walkback = MoveEvent()
walkback:type("stepin")

function walkback.onStepIn(creature, item, position, fromPosition)
	if item.uid > 0 and item.uid <= 65535 then
		creature:teleportTo(fromPosition, false)
	end
	return true
end

walkback:id(1738, 1740, 1741, 1746, 1747, 1748, 1749, 1714, 1715, 1716, 1717)
walkback:register()