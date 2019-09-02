function spawn_impgate(event, creature)
    creature:AddAura(62170, creature)
    --creature:CastSpell(creature, 75498, true)
    local dis = creature:AddAura(42716, creature)
    dis:SetDuration(1000 * 60)
    creature:SetDisplayId(15435)
    creature:RegisterEvent(spawnImp, 3000, 12)
end

RegisterCreatureEvent(50186, 5, spawn_impgate)


function spawnImp(i, ii, iii, creature)
    creature:CastSpell(creature, 800418, true)
end

function spawn_imp(event, creature)
    creature:RegisterEvent(imp_fireball, 2000, 8)
    creature:SetPowerType(0)
    creature:SetMaxPower(0, 1000)
    setPower(creature, 0, 1000)
    --creature:SetOwnerGUID(creature:GetOwner():GetOwner():GetGUID())
    creature:MoveFollow(creature:GetOwner(), math.random(8), math.random(1000) / 360)
    creature:RegisterEvent(demon_despawn, 8000, 1)
    applyFelPower(creature)
end

function imp_fireball(i, ii, iii, creature)
    local tar = findDemonTarget(creature, 0)
    creature:CastSpell(tar, 133, false)
end

RegisterCreatureEvent(50191, 5, spawn_imp)

---------------------------------------------------------------------------

function spawn_satyrgate(event, creature)
    creature:AddAura(62170, creature)
    --creature:CastSpell(creature, 75498, true)
    local dis = creature:AddAura(42716, creature)
    dis:SetDuration(1000 * 60)
    creature:SetDisplayId(15435)
    creature:RegisterEvent(spawnSatyr, 3000, 12)
end

RegisterCreatureEvent(50190, 5, spawn_satyrgate)


function spawnSatyr(i, ii, iii, creature)
    creature:CastSpell(creature, 800436, true)
end

function spawn_satyr(event, creature)
    creature:RegisterEvent(satyr_attack, 2500, 8)
    creature:SetPowerType(3)
    creature:SetMaxPower(3, 100)
    setPower(creature, 3, 100)
    --creature:SetOwnerGUID(creature:GetOwner():GetOwner():GetGUID())
    creature:MoveFollow(creature:GetOwner(), math.random(8), math.random(1000) / 360)
    creature:RegisterEvent(demon_despawn, 10000, 1)
    creature:SetEquipmentSlots(19924, 19924, 0)
    applyFelPower(creature)
end

function satyr_attack(i, ii, iii, creature)
    local tar = findDemonTarget(creature, 0)
    creature:CastSpell(tar, 46463, true)
    creature:CastSpell(tar, 63754, true)
end

RegisterCreatureEvent(50196, 5, spawn_satyr)

---------------------------------------------------------------------------

function spawn_observergate(event, creature)
    creature:AddAura(62170, creature)
    --creature:CastSpell(creature, 75498, true)
    local dis = creature:AddAura(42716, creature)
    dis:SetDuration(1000 * 60)
    creature:SetDisplayId(15435)
    creature:RegisterEvent(spawnObserver, 3000, 12)
end

RegisterCreatureEvent(50189, 5, spawn_observergate)


function spawnObserver(i, ii, iii, creature)
    creature:CastSpell(creature, 800439, true)
end

function spawn_observer(event, creature)
    creature:AddAura(800438, creature)
    creature:RegisterEvent(observer_attack, 2000, 8)
    creature:SetPowerType(0)
    creature:SetMaxPower(0, 100000)
    setPower(creature, 0, 100000)
    --creature:SetOwnerGUID(creature:GetOwner():GetOwner():GetGUID())
    creature:MoveFollow(creature:GetOwner(), math.random(8), math.random(1000) / 360)
    creature:RegisterEvent(demon_despawn, 10000, 1)
    applyFelPower(creature)
end

function observer_attack(i, ii, iii, creature)
    local tar = findDemonTarget(creature, 0)
    creature:CastSpell(tar, 800416, false)
end

RegisterCreatureEvent(50194, 5, spawn_observer)

---------------------------------------------------------------------------

function spawn_voidmangate(event, creature)
    creature:AddAura(62170, creature)
    --creature:CastSpell(creature, 75498, true)
    local dis = creature:AddAura(42716, creature)
    dis:SetDuration(1000 * 60)
    creature:SetDisplayId(15435)
    creature:RegisterEvent(spawnVoidman, 3000, 12)
end

RegisterCreatureEvent(50187, 5, spawn_voidmangate)


function spawnVoidman(i, ii, iii, creature)
    creature:CastSpell(creature, 800441, true)
end

function spawn_voidman(event, creature)
    creature:RegisterEvent(voidman_attack, 2000, 8)
    creature:SetPowerType(0)
    creature:SetMaxPower(0, 1000)
    setPower(creature, 0, 1000)
    --creature:SetOwnerGUID(creature:GetOwner():GetOwner():GetGUID())
    creature:MoveFollow(creature:GetOwner(), math.random(8), math.random(1000) / 360)
    creature:RegisterEvent(demon_despawn, 10000, 1)
    applyFelPower(creature)
end

function voidman_attack(i, ii, iii, creature)
    local tar = findDemonTarget(creature, 0)
    creature:CastSpell(tar, 800473, true)
    local host = creature:GetOwner():GetOwner()
    setPower(host, 0, host:GetPower(0) + host:GetMaxPower(0) / 100)
end

RegisterCreatureEvent(50193, 5, spawn_voidman)

---------------------------------------------------------------------------

function spawn_felguardgate(event, creature)
    creature:AddAura(62170, creature)
    --creature:CastSpell(creature, 75498, true)
    local dis = creature:AddAura(42716, creature)
    dis:SetDuration(1000 * 60)
    creature:SetDisplayId(15435)
    creature:RegisterEvent(spawnFelguard, 4000, 3)
end

RegisterCreatureEvent(50198, 5, spawn_felguardgate)


function spawnFelguard(i, ii, iii, creature)
    creature:CastSpell(creature, 800443, true)
end

function spawn_felguard(event, creature)
    creature:RegisterEvent(felguard_attack, 1000, 12)
    creature:RegisterEvent(felguard_charge, 3000, 5)
    creature:SetPowerType(0)
    creature:SetMaxPower(0, 1000)
    setPower(creature, 0, 1000)
    --creature:SetOwnerGUID(creature:GetOwner():GetOwner():GetGUID())
    creature:MoveFollow(creature:GetOwner(), math.random(8), math.random(1000) / 360)
    creature:RegisterEvent(demon_despawn, 10000, 1)
    creature:SetEquipmentSlots(33688, 0, 0)
    applyFelPower(creature)
end

function felguard_charge(i, ii, iii, creature)
    local tar = findDemonTarget(creature, 0)
    creature:CastSpell(tar, 71553, true)
end

function felguard_attack(i, ii, iii, creature)
    creature:CastSpell(creature, 31738, true)
end

RegisterCreatureEvent(50195, 5, spawn_felguard)

---------------------------------------------------------------------------

function tablelength(T)
  local count = 0
  for _ in pairs(T) do count = count + 1 end
  return count
end

function findDemonTarget(creature, try)
    if(try >= 5)then
        return nil
    end
    local avail = creature:GetPlayersInRange(30, 1)
    if(tablelength(avail) <= 0 or avail == nil)then
        avail = creature:GetCreaturesInRange(30, 0, 1)
        local len = tablelength(avail)
        if(len <= 0)then
            avail = creature:GetCreaturesInRange(30, 0, 0)
            len = tablelength(avail)
            if(len > 0)then
                rand = avail[math.random(len)]
                if(rand:IsAttackingPlayer())then
                    if(rand:IsTargetableForAttack() and creature:CanStartAttack(rand) and rand:IsInCombat())then
                        return rand;
                    end
                else
                    return findDemonTarget(creature, try + 1)
                end
            end
        else
            rand = avail[math.random(len)]
            if(rand:IsTargetableForAttack() and creature:CanStartAttack(rand) and rand:IsInCombat())then
                return rand;
            end
        end
    else
        local rand = avail[math.random(tablelength(avail))]
        if(rand == nil)then
            avail = creature:GetCreaturesInRange(30, 0, 1)
            rand = avail[math.random(tablelength(avail))]
            if(rand:IsTargetableForAttack() and creature:CanStartAttack(rand) and rand:IsInCombat())then
                return rand;
            end
        else
            if(rand:IsTargetableForAttack() and creature:CanStartAttack(rand) and rand:IsInCombat())then
                return rand;
            end
        end
    end
    return findDemonTarget(creature, try + 1)
end

function demon_despawn(i, ii, iii, creature)
    if(creature:GetVictim() ~= nil)then
        if(creature:GetVictim():ToPlayer() == nil)then
            if(creature:GetVictim():GetVictim() == creature)then
                creature:GetVictim():AttackStart(creature:GetOwner())
            end
        end
    end
    creature:DespawnOrUnsummon()
end

function applyFelPower(creature)
    local host = creature:GetOwner()
    while (creature:GetOwner():ToPlayer() == nil) do
        creature:SetOwnerGUID(creature:GetOwner():GetOwnerGUID())
    end
    creature:SetCreatorGUID(creature:GetOwnerGUID())
    if(creature:GetEntry() ~= 50203)then
        creature:GetOwner():CastSpell(creature:GetOwner(), 800479, true)
    end
    if(host == nil)then
        host = creature:GetOwner()
    end
    if(host:HasAura(800464))then
        creature:AddAura(800191, creature)
    end
    local stacks = host:GetStat(3) / 10
    creature:AddAura(800444, creature):SetStackAmount(stacks)
    creature:MoveRandom(20)
end


function spawn_husk(event, creature)
    if(math.random(2) == 1)then 
        creature:DespawnOrUnsummon() 
    end
    creature:RegisterEvent(husk_attack, 3000, 12)
    creature:SetPowerType(0)
    creature:SetMaxPower(0, 1000)
    setPower(creature, 0, 1000)
    creature:MoveFollow(creature:GetOwner(), math.random(8), math.random(1000) / 360)
    creature:RegisterEvent(demon_despawn, 10000, 1)
    applyFelPower(creature)
    creature:SetSpeed(0, 0.1)
    creature:SetSpeed(1, 0.1)
    creature:SetMaxHealth(creature:GetOwner():GetMaxHealth() / 20)
    creature:AddAura(500139, creature)
end

function husk_attack(i, ii, iii, creature)
    local tar = findDemonTarget(creature, 0)
    creature:CastSpell(tar, 800480, false)
end

RegisterCreatureEvent(50203, 5, spawn_husk)

function spawn_doomlord(event, creature)
    creature:SetPowerType(0)
    creature:SetMaxPower(0, 1000)
    setPower(creature, 0, 1000)
    applyFelPower(creature)
end

RegisterCreatureEvent(50200, 5, spawn_doomlord)

function spawn_eredar(event, creature)
    creature:SetPowerType(0)
    creature:SetMaxPower(0, 1000)
    setPower(creature, 0, 1000)
    applyFelPower(creature)
end

RegisterCreatureEvent(50201, 5, spawn_eredar)

function spawn_pitlord(event, creature)
    creature:SetPowerType(3)
    creature:SetMaxPower(3, 100)
    setPower(creature, 3, 100)
    applyFelPower(creature)
end

RegisterCreatureEvent(50202, 5, spawn_pitlord)
