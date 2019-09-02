local NPC_ID = 50231

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	creature:CastSpell(target, 71553, true)
	creature:RegisterEvent(sunken_spit, 2500, 0)
	creature:RegisterEvent(sunken_toxic, 6000, 0)
	creature:RegisterEvent(sunken_toxic1, 3000, 0)
	creature:RegisterEvent(sunken_spawnmobs, 15000, 0)
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

function sunken_spit(event, delay, pCall, creature)
	local spell = 24011
	creature:CastSpell(creature:GetVictim(), spell, false)
end

function sunken_spawnmobs(event, delay, pCall, creature)
	local entry = 50229
	if(math.random(3) == 1)then
		entry = 50228
	end
	local x, y, z, o = creature:GetLocation()
	creature:SpawnCreature(entry, x + (math.random(20) - math.random(20)), y + (math.random(20) - math.random(20)), z, o, 4, 10000)
end


function sunken_toxic(event, delay, pCall, creature)
	playersInRange = creature:GetPlayersInRange(40)
	local target = playersInRange[math.random(tablelength(playersInRange))]
	local spell = 70436
	creature:CastSpell(target, spell, true)
end

function sunken_toxic1(event, delay, pCall, creature)
	if(creature:GetHealthPct() <= 40)then
		playersInRange = creature:GetPlayersInRange(40)
		local target = playersInRange[math.random(tablelength(playersInRange))]
		local spell = 70436
		creature:CastSpell(target, spell, true)
	end
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
