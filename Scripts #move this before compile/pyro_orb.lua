local NPC_ID = 50258

function spawn(event, creature)
	creature:SetScale(0.5)
    creature:AddAura(71706, creature)
    creature:AddAura(63726, creature)
    creature:AddAura(800817, creature)
	creature:SetMaxHealth(250 + 110 * creature:GetLevel())
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
