local NPC_ID = 50233

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	creature:AddAura(800663, creature)
	creature:CastSpell(target, 500109, false)
	creature:RegisterEvent(sunken_glimpse, 8000, 0)
	creature:RegisterEvent(sunken_insane, 20000, 0)
	creature:RegisterEvent(sunken_spawnboss1, 30000, 1)
	creature:RegisterEvent(sunken_spawnboss2, 100000, 1)
	creature:RegisterEvent(sunken_spawnboss3, 220000, 1)
	creature:SendUnitYell("uRa'yll'xrc'Aamun'Raa'x", 0)
	playersInRange = creature:GetPlayersInRange(40)
	for i,v in ipairs(playersInRange) do
		creature:SendUnitWhisper("You have entered a dark and cursed place. And it is far too late to turn back now.", 0, v, true)
	end
end

function onLeave(event, creature)
	creature:RemoveAura(800663)
	creature:RemoveEvents()
end

function onDied(event, creature, killer)
	creature:SendUnitYell("g'Ru'aax'Yrn'laj'orul", 0)
	playersInRange = creature:GetPlayersInRange(40)
	for i,v in ipairs(playersInRange) do
		creature:SendUnitWhisper("Thur'glyx will live on eternally in the dark places of your mind.", 0, v, true)
	end
	creature:RemoveAura(800663)
    creature:RemoveEvents()
    creature:SetRespawnDelay(60 * 60 * 3)
end

function killTarget(event, creature, victim)
end

function sunken_glimpse(event, delay, pCall, creature)
	local spell = 500109
	creature:CastSpell(creature:GetVictim(), spell, false)
end

function sunken_spawnboss1(event, delay, pCall, creature)
	local entry = 50227
	local x, y, z, o = creature:GetLocation()
	local mob = creature:SpawnCreature(entry, x + (math.random(20) - math.random(20)), y + (math.random(20) - math.random(20)), z, o, 4, 10000)
	mob:CastSpell(mob, 64446, true)
	mob:AddAura(800662, mob)
	mob:SendUnitYell("I return in the master's name!", 0)
end

function sunken_spawnboss2(event, delay, pCall, creature)
	local entry = 50231
	local x, y, z, o = creature:GetLocation()
	local mob = creature:SpawnCreature(entry, x + (math.random(20) - math.random(20)), y + (math.random(20) - math.random(20)), z, o, 4, 10000)
	mob:CastSpell(mob, 64446, true)
	mob:AddAura(800662, mob)
	mob:SetScale(0.5)
	mob:SendUnitYell("SSSSSRRRRRAAA!", 0)
end

function sunken_spawnboss3(event, delay, pCall, creature)
	local entry = 50225
	local x, y, z, o = creature:GetLocation()
	local mob = creature:SpawnCreature(entry, x + (math.random(20) - math.random(20)), y + (math.random(20) - math.random(20)), z, o, 4, 10000)
	mob:CastSpell(mob, 64446, true)
	mob:AddAura(800662, mob)
	mob:SetScale(0.9)
	mob:SendUnitYell("I have answered the master's call.", 0)
end


function sunken_insane(event, delay, pCall, creature)
	playersInRange = creature:GetPlayersInRange(40)
	local target = playersInRange[math.random(tablelength(playersInRange))]
	local spell = 24327
	creature:CastSpell(target, spell, true)
end

function spawn(event, creature)
	creature:SetPowerType(0)
	creature:SetMaxPower(0, 20000 + math.random(2000))
	creature:SetEquipmentSlots(28658, 0, 0)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)
