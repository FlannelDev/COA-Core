local NPC_ID = 50049

function spawn(event, creature)
    creature:RegisterEvent(turret_shoot1, 2000, 30)
        creature:AddAura(42716, creature)

end

function turret_shoot1(i, ii, iii, creature)
    local owner = creature:GetOwner()
    local tar = owner:GetSelection()
    if(creature:GetDistance(tar) <= 50)then
        if(tar:IsInCombat())then
            creature:SetFacingToObject(tar)
            creature:CastSpell(tar, 500255, true)
        end
    end
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
