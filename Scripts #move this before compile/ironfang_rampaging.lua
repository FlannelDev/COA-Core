local NPC_ID = 50170

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	creature:CastSpell(target, 500126, true)
	creature:RegisterEvent(ironfang_clawsweep, 2500, 0)
end

function onLeave(event, creature)
	creature:RemoveEvents()
end

function onDied(event, creature, killer)
    creature:RemoveEvents()
end

function killTarget(event, creature, victim)
end

function ironfang_clawsweep(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), 500169, false)
end

function spawn(event, creature)
	creature:MoveRandom(8)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)
