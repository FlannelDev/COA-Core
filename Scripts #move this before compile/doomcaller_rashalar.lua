function spawn_rashalar(event, creature)
	creature:SetMaxHealth(creature:GetMaxHealth() * 10)
    creature:SetPowerType(0)
    creature:SetMaxPower(0, 100000)
    setPower(creature, 0, 100000)
    creature:MoveRandom(20)
    creature:SetEquipmentSlots(44424, 0, 0)
end



function rashalar_attack(i, ii, iii, creature)
    local tar = creature:GetVictim()
    local spell = 800411;
    local portal = 800440
    local rand = math.random(5)
    if(rand == 1)then
    	portal = 800417;
    end
    if(rand == 2)then
    	portal = 800442;
    end
    if(rand == 3)then
    	portal = 800437;
    end
    if(rand == 4)then
    	portal = 800435;
    end
    if(math.random(6) == 1)then
    	spell = 800416;
    end
    if(math.random(6) == 1)then
    	spell = 800452;
    end
    if(math.random(8) == 1)then
    	spell = 800413;
    end
    if(math.random(14) == 1)then
    	spell = 800451;
    end
    if(math.random(2) == 1)then
	    creature:CastSpell(creature, portal, true)
	end
    creature:CastSpell(tar, spell, false)
end

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	creature:SendUnitYell("Mortal fools! You don't know the power you are messing with.", 0)
    creature:RegisterEvent(rashalar_attack, 3500, 0)
end

function onLeave(event, creature)
	creature:RemoveEvents()
end

function onDied(event, creature, killer)
    creature:RemoveEvents()
end


RegisterCreatureEvent(50154, 1, onCombat)
RegisterCreatureEvent(50154, 2, onLeave)
RegisterCreatureEvent(50154, 4, onDied)
RegisterCreatureEvent(50154, 5, spawn_rashalar)