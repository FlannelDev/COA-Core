local NPC_ID = 50225

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	creature:CastSpell(creature, 800621, true)
	creature:AddAura(55766, creature)
	creature:AddAura(61204, creature)
	creature:SendUnitSay("Unauthorised personnel detected. Defence systems online in T-12 seconds...", 0)
	creature:RegisterEvent(sunken_wakegolem, 12000, 1)
end

function onLeave(event, creature)
	creature:RemoveEvents()
end

function onDied(event, creature, killer)
    creature:RemoveEvents()
    creature:SetRespawnDelay(60 * 60 * 3)
end

function killTarget(event, creature, victim)
end

function sunken_wakegolem(event, delay, pCall, creature)
	creature:RemoveAura(55766)
	creature:RemoveAura(61204)
	creature:CastSpell(creature, 68771, true)
	creature:RegisterEvent(sunken_icespike, 9000, 0)
	creature:RegisterEvent(sunken_shout, 35000, 0)
	creature:RegisterEvent(sunken_devastate, 3000, 0)
	creature:RegisterEvent(sunken_vigil, 20000, 0)
	creature:SendUnitSay("Defence systems online.", 0)
end

function sunken_shout(event, delay, pCall, creature)
	local spell = 32064
	if(math.random(2) == 1)then
		spell = 27579
	end
	creature:CastSpell(creature, spell, true)
end

function sunken_vigil(event, delay, pCall, creature)
	if(creature:GetHealthPct() >= 80)then
		local spell = 800621
		creature:CastSpell(creature, spell, true)
	end
end

function sunken_devastate(event, delay, pCall, creature)
	local spell = 60018
	creature:CastSpell(creature:GetVictim(), spell, true)
end


function sunken_icespike(event, delay, pCall, creature)
	playersInRange = creature:GetPlayersInRange(40)
	local target = playersInRange[math.random(tablelength(playersInRange))]
	local spell = 54532
	if(math.random(5) == 1)then
		spell = 800395
	end
	creature:CastSpell(target, spell, false)
end

function spawn(event, creature)
	creature:SetPowerType(0)
	creature:SetMaxPower(0, 10000 + math.random(2000))
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)
