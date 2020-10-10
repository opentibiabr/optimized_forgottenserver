function canJoin(player)
	return player:hasFlag(PlayerFlag_CanAnswerRuleViolations)
end

function onSpeak(player, type, message)
	return false
end
