local NPC_ID = 50052

function spawn(event, creature)
    creature:AddAura(800704, creature)
    creature:AddAura(42716, creature)
    creature:SetMaxHealth(250 + 110 * creature:GetLevel())
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
