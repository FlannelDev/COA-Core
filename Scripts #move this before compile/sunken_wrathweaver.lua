local NPC_ID = 50232

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	creature:RegisterEvent(sunken_cone, 5000, 0)
	creature:RegisterEvent(sunken_runebomb, 12000, 0)
end

function onLeave(event, creature)
	creature:RemoveEvents()
end

function onDied(event, creature, killer)
    creature:RemoveEvents()
end

function killTarget(event, creature, victim)
end

function sunken_runebomb(event, delay, pCall, creature)
	local spell = 500805
	playersInRange = creature:GetPlayersInRange(30)
	local len = tablelength(playersInRange)
	local target = playersInRange[math.random(len)]
	creature:CastSpell(target, spell, false)
end

function sunken_cone(event, delay, pCall, creature)
	local spell = 64645
	creature:CastSpell(creature:GetVictim(), spell, true)
end

function spawn(event, creature)
	creature:SetPowerType(6)
	creature:SetMaxPower(6, 1000)
	setPower(creature, 1000, 6)
	creature:SetEquipmentSlots(43618, 0, 0)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)
