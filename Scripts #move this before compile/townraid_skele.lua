local NPC_ID = 50175

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	creature:RegisterEvent(townraid_bolt, 3000, 0)
end

function onLeave(event, creature)
	creature:RemoveEvents()
end

function onDied(event, creature, killer)
    creature:RemoveEvents()
end

function killTarget(event, creature, victim)
end

function townraid_bolt(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), 800161, true)
	creature:MoveRandom(8)
end

function spawn(event, creature)
	creature:MoveRandom(8)
	creature:SetPowerType(0)
	creature:SetMaxPower(0, 10235)
	creature:SetEquipmentSlots(0, 20368, 0)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)
