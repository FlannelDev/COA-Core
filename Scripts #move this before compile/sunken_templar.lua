local NPC_ID = 50219

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	creature:RegisterEvent(sunken_bladenzoth, 3500, 0)
	creature:RegisterEvent(sunken_ironguard, 8000, 0)
	creature:RegisterEvent(sunken_firecharge, 7500, 0)
end

function onLeave(event, creature)
	creature:RemoveEvents()
end

function onDied(event, creature, killer)
    creature:RemoveEvents()
end

function killTarget(event, creature, victim)
end

function sunken_bladenzoth(event, delay, pCall, creature)
	local spell = 500722
	creature:CastSpell(creature:GetVictim(), spell, false)
end

function sunken_ironguard(event, delay, pCall, creature)
	local spell = 500932
	if(math.random(3) == 1)then
		spell = 500921
	end
	creature:CastSpell(creature, spell, true)
end

function sunken_firecharge(event, delay, pCall, creature)
	playersInRange = creature:GetPlayersInRange(30)
	local target = playersInRange[math.random(tablelength(playersInRange))]
	local spell = 500084
	if(math.random(5) == 1)then
		spell = 800474
	end
	creature:CastSpell(target, spell, true)
end

function spawn(event, creature)
	creature:SetPowerType(0)
	creature:SetMaxPower(0, 6000 + math.random(300))
	creature:SetEquipmentSlots(42334, 0, 0)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)
