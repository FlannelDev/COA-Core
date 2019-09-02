
function spawn_stalker(event, creature)
    creature:AddAura(39947, creature)
    creature:SetScale(2)
end

RegisterCreatureEvent(50094, 5, spawn_stalker)