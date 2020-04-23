if(CLIENT_VERSION < 810) then
	return
end

local condition = Condition(CONDITION_OUTFIT)
condition:setOutfit({lookType = 267})
condition:setTicks(-1)

local swimming = MoveEvent()
swimming:type("stepin")

function swimming.onStepIn(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		return false
	end

	creature:addCondition(condition)
	return true
end

swimming:id(4620, 4621, 4622, 4623, 4624, 4625, 4820, 4821, 4822, 4823, 4824, 4825)
swimming:register()

swimming = MoveEvent()
swimming:type("stepout")

function swimming.onStepOut(creature, item, position, fromPosition)
	if not creature:isPlayer() then
		return false
	end

	creature:removeCondition(CONDITION_OUTFIT)
	return true
end

swimming:id(4620, 4621, 4622, 4623, 4624, 4625, 4820, 4821, 4822, 4823, 4824, 4825)
swimming:register()