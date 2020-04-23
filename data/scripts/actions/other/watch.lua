local watch = Action()

function watch.onUse(player, item, fromPosition, target, toPosition, isHotkey)
	player:sendTextMessage(MESSAGE_INFO_DESCR, "The time is " .. getFormattedWorldTime() .. ".")
	return true
end

if(CLIENT_VERSION >= 840) then
	watch:id(9443, 9444)
end
if(CLIENT_VERSION >= 810) then
	watch:id(7828)
end
if(CLIENT_VERSION >= 780) then
	watch:id(6092)
end
if(CLIENT_VERSION >= 750) then
	watch:id(3900)
end
watch:id(2036, 1728, 1729, 1730, 1731)
watch:register()
