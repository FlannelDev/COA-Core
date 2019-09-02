local NPC_ID = 50223

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	creature:RegisterEvent(sunken_bloodbolt, 5000, 0)
end

function onLeave(event, creature)
	creature:RemoveEvents()
end

function onDied(event, creature, killer)
    creature:RemoveEvents()
end

function killTarget(event, creature, victim)
end

function sunken_bloodbolt(event, delay, pCall, creature)
	local spell = 500917
	creature:CastSpell(creature:GetVictim(), spell, true)
end

function spawn(event, creature)
	creature:AddAura(800657, creature)
	creature:MoveRandom(8)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)
