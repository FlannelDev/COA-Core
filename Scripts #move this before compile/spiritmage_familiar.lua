local NPC_ID = 50257

function spawn(event, creature)
    creature:AddAura(800714, creature)
    creature:AddAura(41232, creature)
    creature:AddAura(500139, creature)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
