local NPC_ID = 50227

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	creature:CastSpell(target, 71553, true)
	creature:RegisterEvent(sunken_chain, 6000, 0)
	creature:RegisterEvent(sunken_stomp, 12000, 0)
	creature:SendUnitYell("Wretched fools! The master will feast on your flesh tonight!", 0)
end

function onLeave(event, creature)
	creature:RemoveEvents()
end

function onDied(event, creature, killer)
    creature:RemoveEvents()
    creature:SendUnitSay("You will not... Leave this place... Alive...", 0)
    creature:SetRespawnDelay(60 * 60 * 3)
end

function killTarget(event, creature, victim)
end

function sunken_steelstorm(event, delay, pCall, creature)
	local spell = 800637
	creature:CastSpell(creature:GetVictim(), spell, false)
end

function sunken_stomp(event, delay, pCall, creature)
	local spell = 800302
	creature:CastSpell(creature:GetVictim(), spell, true)
end


function sunken_chain(event, delay, pCall, creature)
	playersInRange = creature:GetPlayersInRange(30)
	local target = playersInRange[math.random(tablelength(playersInRange))]
	local spell = 500020
	if(creature:GetHealthPct() <= 50)then
		spell = 500359
	end
	creature:CastSpell(target, spell, true)
	creature:RegisterEvent(sunken_steelstorm, 750, 1)
	creature:AttackStart(target)
end


function spawn(event, creature)
	creature:SetPowerType(1)
	creature:SetMaxPower(1, 1000)
	creature:SetEquipmentSlots(24044, 0, 0)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)
