local NPC_ID = 50129

function spawn(event, creature)
    creature:AddAura(800331, creature)
end

function wargolem_addaura(i, ii, iii, creature)
	creature:AddAura(800329, creature)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
