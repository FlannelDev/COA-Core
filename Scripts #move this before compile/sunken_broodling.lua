local NPC_ID = 50228

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	creature:RegisterEvent(sunken_web, 7000, 0)
	creature:RegisterEvent(sunken_venom, 10000, 0)
	creature:RegisterEvent(sunken_venomstrike, 2000, 0)
end

function onLeave(event, creature)
	creature:RemoveEvents()
end

function onDied(event, creature, killer)
    creature:RemoveEvents()
end

function killTarget(event, creature, victim)
end

function sunken_web(event, delay, pCall, creature)
	local spell = 71327
	playersInRange = creature:GetPlayersInRange(30)
	local len = tablelength(playersInRange)
	local target = playersInRange[math.random(len)]
	creature:CastSpell(target, spell, true)
end

function sunken_venomstrike(event, delay, pCall, creature)
	local spell = 800090
	local target = creature:GetVictim()
	creature:CastSpell(target, spell, true)
end

function sunken_venom(event, delay, pCall, creature)
	local spell = 800360
	creature:AddAura(spell, creature)
end

function spawn(event, creature)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)
