local NPC_ID = 50226

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	creature:RegisterEvent(sunken_frostrune, 7000, 0)
	if(math.random(5) == 1)then
		creature:CastSpell(creature, 500967, true)
	end
end

function onLeave(event, creature)
	creature:RemoveEvents()
end

function onDied(event, creature, killer)
    creature:RemoveEvents()
end

function killTarget(event, creature, victim)
end

function sunken_frostrune(event, delay, pCall, creature)
	playersInRange = creature:GetPlayersInRange(30)
	local target = playersInRange[math.random(tablelength(playersInRange))]
	local spell = 500289
	creature:CastSpell(target, spell, true)
end

function spawn(event, creature)
	creature:SetPowerType(0)
	creature:SetMaxPower(0, 6000 + math.random(300))
	creature:SetEquipmentSlots(25132, 0, 0)
	creature:MoveRandom(8)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)
