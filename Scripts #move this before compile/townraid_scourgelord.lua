local NPC_ID = 50177

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	creature:RegisterEvent(townraid_plague, 15000, 0)
	creature:RegisterEvent(townraid_charge, 9000, 0)
	creature:RegisterEvent(townraid_worms, 3000, 0)
	creature:SendUnitYell("Your foolish efforts will be in vain, mortals!", 0)
end

function onLeave(event, creature)
	creature:RemoveEvents()
end

function onDied(event, creature, killer)
    creature:RemoveEvents()
end

function killTarget(event, creature, victim)
	creature:CastSpell(creature, 500970, true)
	creature:SendUnitYell("Another soldier for the scourge!", 0)
end

function townraid_plague(event, delay, pCall, creature)
	creature:CastSpell(creature:GetVictim(), 500340, true)
end


function townraid_worms(event, delay, pCall, creature)
	if(math.random(12) == 1)then
		creature:CastSpell(creature, 500090, true)
		creature:SendUnitYell("DIE, DIE, DIE!", 0)
	else
		playersInRange = creature:GetPlayersInRange(20)
		local target = playersInRange[math.random(tablelength(playersInRange))]
		creature:CastSpell(target, 500338, true)
	end
end


function townraid_charge(event, delay, pCall, creature)
	playersInRange = creature:GetPlayersInRange(20)
	local target = playersInRange[math.random(tablelength(playersInRange))]
	creature:CastSpell(target, 500009, true)
	creature:SendUnitYell("Kneel before the might of the Lich King!", 0)
end

function spawn(event, creature)
	creature:SetPowerType(0)
	creature:SetMaxPower(0, 10235)
	creature:SetEquipmentSlots(50761, 0, 0)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)
