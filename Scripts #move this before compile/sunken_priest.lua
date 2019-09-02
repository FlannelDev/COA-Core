local NPC_ID = 50220

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	local spell = 800194
	creature:AddAura(spell, creature)
	creature:RegisterEvent(sunken_torment, 100, 1)
	creature:RegisterEvent(sunken_torment, 8000, 0)
	creature:RegisterEvent(sunken_kiss, 3500, 0)
end

function onLeave(event, creature)
	creature:RemoveEvents()
end

function onDied(event, creature, killer)
    creature:RemoveEvents()
end

function killTarget(event, creature, victim)
end

function sunken_torment(event, delay, pCall, creature)
	local spell = 800432
	creature:CastSpell(creature:GetVictim(), spell, false)
end

function sunken_kiss(event, delay, pCall, creature)
	playersInRange = creature:GetCreaturesInRange(30, 0, 2)
	local len = tablelength(playersInRange)
	local target = nil
	if(len > 0)then
		target = playersInRange[math.random(len)]
	else
		target = creature
	end
	local spell = 800367
	if(math.random(3) == 1)then
		spell = 500715
	end
	creature:CastSpell(target, spell, true)
	creature:RegisterEvent(sunken_torment, 100, 1)
end

function spawn(event, creature)
	creature:SetPowerType(0)
	creature:SetMaxPower(0, 8000 + math.random(300))
	creature:SetEquipmentSlots(37617, 0, 0)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)
