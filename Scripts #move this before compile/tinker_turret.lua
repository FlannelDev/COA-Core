local NPC_ID = 50046

function spawn(event, creature)
    creature:RegisterEvent(turret_shoot, 2000, 30)
        creature:AddAura(42716, creature)

end

function turret_shoot(i, ii, iii, creature)
    local owner = creature:GetOwner()
    petFindAttackTarget(owner, creature, 30, 0)
    tar = creature:GetVictim()
    if(tar ~= nil)then
        if(creature:GetDistance(tar) <= 25)then
            if(tar:IsInCombat())then
                creature:SetFacingToObject(tar)
                creature:CastSpell(tar, 46440, true)
                creature:CastSpell(tar, 500245, true)
                local dmg = 5 + math.random(3) + owner:GetStat(1) / 4 * 3 + 2 * owner:GetLevel()
                owner:DealDamage(tar, dmg, false, 0)
            end
        end
    end
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
