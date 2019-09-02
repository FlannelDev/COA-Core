local NPC_ID = 50218

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	creature:RegisterEvent(sunken_slam, 3000, 0)
end

function onLeave(event, creature)
	creature:RemoveEvents()
end

function onDied(event, creature, killer)
    creature:RemoveEvents()
end

function killTarget(event, creature, victim)
end

function sunken_slam(event, delay, pCall, creature)
	local spell = 72149
	creature:CastSpell(creature:GetVictim(), spell, false)
end

function spawn(event, creature)
	creature:AddAura(42716, creature)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)
