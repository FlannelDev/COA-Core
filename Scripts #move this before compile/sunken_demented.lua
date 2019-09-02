local NPC_ID = 50224

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	local spell = 500022
	creature:AddAura(spell, creature)
	creature:RegisterEvent(sunken_bile, 6000, 0)
	creature:RegisterEvent(sunken_regen, 9000, 0)
end

function onLeave(event, creature)
	creature:RemoveEvents()
end

function onDied(event, creature, killer)
	creature:CastSpell(creature, 800430, true)
    creature:RemoveEvents()
end

function killTarget(event, creature, victim)
end

function sunken_regen(event, delay, pCall, creature)
	local spell = 500022
	creature:AddAura(spell, creature)
	if(delay >= 4000)then
		creature:RegisterEvent(sunken_regen, delay - 500, 1)
	else
		creature:RegisterEvent(sunken_regen, 3100, 1)
	end
end

function sunken_bile(event, delay, pCall, creature)
	playersInRange = creature:GetPlayersInRange(10)
	local target = playersInRange[math.random(tablelength(playersInRange))]
	local spell = 500993
	creature:CastSpell(target, spell, true)
end

function spawn(event, creature)
	creature:SetPowerType(0)
	creature:SetMaxPower(0, 6000 + math.random(300))
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)
