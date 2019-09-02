local NPC_ID = 50229

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	creature:RegisterEvent(sunken_charge, 5000, 0)
end

function onLeave(event, creature)
	creature:RemoveEvents()
end

function onDied(event, creature, killer)
    creature:RemoveEvents()
end

function killTarget(event, creature, victim)
end

function sunken_charge(event, delay, pCall, creature)
	local spell = 74399
	playersInRange = creature:GetPlayersInRange(30)
	local len = tablelength(playersInRange)
	local target = playersInRange[math.random(len)]
	creature:CastSpell(target, spell, true)
	creature:AttackStart(target)
end

function spawn(event, creature)
	creature:MoveRandom(10)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)
