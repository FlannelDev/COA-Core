local NPC_ID = 50182

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	creature:CastSpell(target, 71553, true)
	creature:RegisterEvent(jaedenar_ripper, 1500, 0)
end

function onLeave(event, creature)
	creature:RemoveEvents()
end

function onDied(event, creature, killer)
    creature:RemoveEvents()
end

function killTarget(event, creature, victim)
end

function jaedenar_ripper(event, delay, pCall, creature)
	local spell = 500916
	creature:CastSpell(creature:GetVictim(), spell, true)
end


function spawn(event, creature)
	creature:SetPowerType(1)
	creature:SetMaxPower(1, 1000)
	creature:SetEquipmentSlots(4965, 12348, 0)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)
