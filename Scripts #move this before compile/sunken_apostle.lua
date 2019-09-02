local NPC_ID = 50230

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	creature:RegisterEvent(sunken_curse, 3000, 0)
	creature:RegisterEvent(sunken_deathbite, 5000, 0)
end

function onLeave(event, creature)
	creature:RemoveEvents()
end

function onDied(event, creature, killer)
    creature:RemoveEvents()
end

function killTarget(event, creature, victim)
end

function sunken_curse(event, delay, pCall, creature)
	local spell = 500712
	playersInRange = creature:GetPlayersInRange(30)
	local len = tablelength(playersInRange)
	local target = playersInRange[math.random(len)]
	creature:CastSpell(target, spell, true)
end

function sunken_cone(event, delay, pCall, creature)
	local spell = 64645
	creature:CastSpell(creature:GetVictim(), spell, true)
end

function sunken_deathbite(event, delay, pCall, creature)
	local spell = 500215
	creature:CastSpell(creature:GetVictim(), spell, false)
	creature:RegisterEvent(sunken_bite, 750, 1)
	creature:RegisterEvent(sunken_bite, 1500, 1)
end

function sunken_bite(event, delay, pCall, creature)
	playersInRange = creature:GetPlayersInRange(30)
	local len = tablelength(playersInRange)
	local target = playersInRange[math.random(len)]
	local spell = 500215
	creature:CastSpell(target, spell, true)
end

function spawn(event, creature)
	creature:SetPowerType(0)
	creature:SetMaxPower(0, 8000 + math.random(300))
	creature:SetEquipmentSlots(32841, 25088, 0)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)
