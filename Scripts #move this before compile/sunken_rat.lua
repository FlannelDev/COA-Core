local NPC_ID = 50217

function onCombat(event, creature, target)
	if(creature:GetFaction() == 7)then
		creature:SetFaction(1857)
		creature:SendUnitSay("Me help you squish big bads!", 0)
		creature:MoveFollow(target, math.random(3), math.random(3))
	else
		creature:RegisterEvent(sunken_throw, 1100, 0)
	end
end

function onLeave(event, creature)
	creature:RemoveEvents()
end

function onDied(event, creature, killer)
    creature:RemoveEvents()
end

function killTarget(event, creature, victim)
end

function sunken_throw(event, delay, pCall, creature)
	local spell = 59138
	creature:CastSpell(creature:GetVictim(), spell, false)
end

function spawn(event, creature)
	creature:SetFaction(7)
	creature:SetPowerType(0)
	creature:SetMaxPower(0, 8000 + math.random(300))
	creature:SetEquipmentSlots(2901, 3774, 0)
	creature:MoveRandom(6)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)
