local NPC_ID = 50072

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	--creature:RegisterEvent(necro_risenwar_attack, 2000, 0)
end

function onLeave(event, creature)
	--creature:RemoveEvents()
	creature:RegisterEvent(pet_return, 2000, 0)
end

function onDied(event, creature, killer)
   -- creature:RemoveEvents()
end

function killTarget(event, creature, victim)
end

function pet_return(i, ii, iii, creature)
	creature:MoveFollow(creature:GetOwner())
end

function spawn(event, creature)
	creature:AddAura(800603, creature)
	creature:AddAura(800191, creature)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)
