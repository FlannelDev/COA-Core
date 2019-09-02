local NPC_ID = 50003

function On_Gossip(event, plr, unit)
        if(getClassID(plr) == 0)then
            for i=1,50 do
                generateClassGossipOption(plr, unit, i)
            end
            plr:GossipSendMenu(1, unit)
        else
            plr:SendBroadcastMessage("You've already chosen your class.")
        end
end

function generateClassGossipOption(plr, unit, class)
    local iconsize = 40
    local name = getNameForClass(class)
    if(name ~= "NULL")then
        local info = getInfoForClass(class)
        local icon = info[1]
        local data = info[2]
        local archetype = info[3]
        local color = "|cFF00008B"
        if(isAllowed(plr, class))then
        else
            color = "|cFFFF0000"
            name = name.." [Locked]"
        end
        if (class == CLASS_DOOMCALLER)then
            name = name.." [Requires a level 80 character]"
        end
        if((plr:GetClass() == archetype) or plr:IsGM())then
            plr:GossipMenuAddItem(5, generateIcon(icon, iconsize).." Become a "..color..name.."|r\n", 0, class, false, data.."\r\rAre you sure you wish to become a |cFF87CEFA"..name.."?")
        end
    end
end

function spawn(event, creature)
    creature:SetPowerType(3)
    creature:SetMaxPower(3, 10000)
end

function On_Select(event, plr, unit, sender, intid, code)
    if(isAllowed(plr, intid))then
        plr:SendBroadcastMessage("TYPE .spells TO PREVIEW ALL CLASS SPELLS!")
        local starter_spells = getSpellsForClass(intid)[1];
        for i,v in ipairs(starter_spells) do
            if(v > 0)then
                plr:LearnSpell(v)
            else
                plr:RemoveSpell(v*(-1))
            end
        end
        plr:KilledMonsterCredit(50040)
        plr:AddItem(159, 10)
        plr:AddItem(4540, 10)
        plr:AddItem(700000 + intid)
        initClass(plr, intid)
        if(intid == CLASS_RANGER)then
            plr:AddItem(2504, 1)
            plr:AddItem(2512, 1000)
        end
        if(intid == CLASS_TINKER)then
            plr:AddItem(2508, 1)
            plr:AddItem(2516, 1000)
        end
        if(intid == CLASS_GROVEWARDEN)then
            plr:AddItem(2361, 1)
        end
        if(intid == CLASS_RIFTBLADE)then
            plr:AddItem(2139, 1)
            plr:AddItem(50057, 1)
            plr:RemoveItem(20978, 1)
            plr:RemoveItem(3661, 1)
            plr:RemoveItem(35, 1)
        end
        if(intid == CLASS_DEMONHUNTER)then
            --plr:AddItem(3536, 1)
            plr:EquipItem(3536, 0)
        end
        if(intid == CLASS_SUNDANCER)then
            plr:LearnSpell(198)
            plr:LearnSpell(199)
            plr:AddItem(2361, 1)
            plr:EquipItem(2361, 17)
        end
        if(intid == CLASS_GUARDIAN)then
            plr:AddItem(25, 1)
            plr:AddItem(2210, 1)
            plr:RemoveItem(49778, 1)
            plr:RemoveItem(12282, 1)
            plr:RemoveItem(2361, 1)
        end
        if(intid == CLASS_DRAGONKNIGHT)then
            plr:AddItem(12282, 2)
        end
        if(intid == CLASS_CULTIST)then
            plr:AddItem(25, 1)
            plr:AddItem(2210, 1)
            plr:AddItem(2128, 1)
            plr:LearnSpell(198)
            plr:LearnSpell(199)
            plr:LearnSpell(201)
            plr:LearnSpell(202)
        end
        if(intid == CLASS_ABOMINATION)then
            plr:AddItem(25, 1)
            plr:AddItem(2210, 1)
            plr:LearnSpell(198)
            plr:LearnSpell(201)
        end
        plr:GossipComplete()
     else
        plr:SendBroadcastMessage("You are not authorized to play this class.")
        plr:GossipComplete()
    end
end

function isAllowed(plr, class)
    name = plr:GetName()
    --[[if(name == "Tommyruin" and class == CLASS_WITCHHUNTER)then
        return true;
    end
    if(name == "Tommyreaper" and class == CLASS_REAPER)then
        return true;
    end

    if(plr:GetAccountName() == "gamemaster11" and (class == CLASS_TINKER or class == CLASS_RIFTBLADE or class == CLASS_NECROMANCER))then
        return true;
    end

    if(plr:GetAccountName() == "Moogphazer" and class == CLASS_WITCHDOCTOR)then
        return true;
    end

    if((plr:GetAccountName() == "Drwyz" or plr:GetAccountName() == "drwyz") and class == CLASS_PYROMANCER)then
        return true;
    end

    if((plr:GetAccountName() == "Deltoids" or plr:GetAccountName() == "deltoids") and class == CLASS_RIFTBLADE)then
        return true;
    end

    if((plr:GetAccountName() == "HirysGamers" or plr:GetAccountName() == "hirysgamers") and class == CLASS_SUNDANCER)then
        return true;
    end

    if((plr:GetAccountName() == "Capar" or plr:GetAccountName() == "capar") and (class == CLASS_RIFTBLADE or class == CLASS_DRAGONKNIGHT))then
        return true;
    end

    if((plr:GetAccountName() == "TheMoneyHater" or plr:GetAccountName() == "themoneyhater" or plr:GetAccountName() == "Mariobox") and class == CLASS_NECROMANCER)then
        return true;
    end

    if(plr:GetAccountName() == "Rooman23" and (class == CLASS_CULTIST or class == CLASS_ABOMINATION or class == CLASS_SPIRITMAGE))then
        return true;
    end

    if((plr:GetAccountName() == "agency" or plr:GetAccountName() == "Agency") and (class == CLASS_DRAGONKNIGHT or class == CLASS_SAMURAI))then
        return true;
    end

    if((plr:GetAccountName() == "Kvothe" or plr:GetAccountName() == "kvothe") and (class == CLASS_NECROMANCER or class == CLASS_STORMBRINGER))then
        return true;
    end

     if((plr:GetAccountName() == "thesentinelblue") and (class == CLASS_NECROMANCER or class == CLASS_RIFTBLADE))then
        return true;
    end

    if(plr:GetAccountName() == "DeerDance56" or plr:GetAccountName() == "ruben381" or plr:GetAccountName() == "bin4ry" or plr:GetAccountName() == "devadam" or string.lower(plr:GetAccountName()) == "mattybraps"or string.lower(plr:GetAccountName()) == "arcanite001"or string.lower(plr:GetAccountName()) == "arcanite123")then
        return true;
    end

    if(plr:GetAccountName() == "arcanite123" and (class == CLASS_REAPER or class == CLASS_CULTIST or class == CLASS_DEMONHUNTER))then
        return true;
    end

    if(plr:GetAccountName() == "Ziptomba" and (class == CLASS_REAPER or class == CLASS_RIFTBLADE))then
        return true;
    end

    if(plr:GetAccountName() == "ikey955" and (class == CLASS_WITCHDOCTOR or class == CLASS_STORMBRINGER or class == CLASS_REAPER or class == CLASS_TINKER or class == CLASS_DEMONHUNTER))then
        return true;
    end

    if(plr:GetAccountName() == "drofnas" and (class == CLASS_NECROMANCER or class == CLASS_SUNDANCER or class == CLASS_DEMONHUNTER))then
        return true;
    end

    if(plr:GetAccountName() == "csiflyingarrow" and (class == CLASS_TINKER))then
        return true;
    end

    if(plr:IsGM() or HOME == true)then
        return true
    end

    --[[if(class == CLASS_DRAGONKNIGHT or class == CLASS_ABOMINATION or class == CLASS_RIFTBLADE or class == CLASS_STORMBRINGER or class == CLASS_GROVEWARDEN or class == CLASS_WORGEN or class == CLASS_TINKER or class == CLASS_WITCHDOCTOR)then
        return true;
    end]]
    if(HasCharAtleast(plr, 80) == false and class == CLASS_DOOMCALLER and plr:IsGM() == false)then
        return false;
    end
    if((class == CLASS_BARD or class == CLASS_HELLION or class == CLASS_TEMPLAR or class == CLASS_STARLORD or class == DJINN or class == CLASS_VALKYRIE or class == CLASS_SPARTAN) and plr:IsGM() == false)then
        return false;
    end

    return true;
end

for i=50001,50004 do
    RegisterCreatureEvent(i, 5, spawn)
    RegisterCreatureGossipEvent(i, 1, On_Gossip)
    RegisterCreatureGossipEvent(i, 2, On_Select)
end
