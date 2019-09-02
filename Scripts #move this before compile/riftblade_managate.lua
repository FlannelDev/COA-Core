local NPC_ID = 50058

function spawn(event, creature)
	creature:SetMaxHealth(creature:GetLevel() * 5)
    creature:AddAura(62348, creature)
        creature:AddAura(42716, creature)

end

RegisterCreatureEvent(NPC_ID, 5, spawn)
