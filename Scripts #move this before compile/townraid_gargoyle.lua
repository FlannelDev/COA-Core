local NPC_ID = 50176

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	creature:RegisterEvent(townraid_scarabs, 4100, 0)
end

function onLeave(event, creature)
	creature:RemoveEvents()
end

function onDied(event, creature, killer)
    creature:RemoveEvents()
end

function killTarget(event, creature, victim)
end

function townraid_scarabs(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), 500965, false)
end

function spawn(event, creature)
	creature:MoveRandom(14)
	creature:SetPowerType(0)
	creature:SetMaxPower(0, 10235)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)
