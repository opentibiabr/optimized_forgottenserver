local watch = Action()

function watch.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "The time is " .. getFormattedWorldTime() .. ".")
	return true
end

if(CLIENT_VERSION >= 810) then
	watch:id(751)
end
if(CLIENT_VERSION >= 750) then
	watch:id(2771)
end
if(CLIENT_VERSION >= 780) then
	watch:id(6091)
end
if(CLIENT_VERSION >= 840) then
	watch:id(8527, 8528)
end

watch:id(2906, 2445, 2446, 2447, 2448)
watch:register()
