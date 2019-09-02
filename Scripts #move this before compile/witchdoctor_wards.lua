function spawn_vitality(event, creature)
    creature:AddAura(500956, creature)
    creature:CastSpell(creature, 62851, true)
    local dis = creature:AddAura(32752, creature)
    dis:SetDuration(1000 * 20)
end

RegisterCreatureEvent(50104, 5, spawn_vitality)

function spawn_voodoo(event, creature)
    creature:AddAura(500959, creature)
    creature:CastSpell(creature, 62851, true)
    local dis = creature:AddAura(32752, creature)
    dis:SetDuration(1000 * 20)
end

RegisterCreatureEvent(50105, 5, spawn_voodoo)

function spawn_spiritpower(event, creature)
    creature:AddAura(500958, creature)
    creature:CastSpell(creature, 62851, true)
    local dis = creature:AddAura(32752, creature)
    dis:SetDuration(1000 * 20)
end

RegisterCreatureEvent(50106, 5, spawn_spiritpower)
