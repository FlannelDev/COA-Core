local NPC_ID = 50184

function onCombat(event, creature, target)
	local entry = creature:GetEntry()
	creature:RegisterEvent(jaedenar_bossattack, 4000, 0)
	creature:SendUnitYell("Who is this that dares interfere with my ritual?!", 0)
	creature:RemoveAura(57561)
end

function onLeave(event, creature)
	creature:RemoveEvents()
end

function onDied(event, creature, killer)
    creature:RemoveEvents()
end

function killTarget(event, creature, victim)
end

function jaedenar_bossattack(event, delay, pCall, creature)
	local spell = 800356
	if(math.random(6) == 1)then
		spell = 800206
	end
	playersInRange = creature:GetPlayersInRange(30)
	local target = playersInRange[math.random(tablelength(playersInRange))]
	creature:CastSpell(target, spell, false)
end


function spawn(event, creature)
	creature:SetPowerType(0)
	creature:SetMaxPower(0, 10235)
	creature:SetEquipmentSlots(42382, 0, 0)
	creature:CastSpell(creature, 57561, false)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
RegisterCreatureEvent(NPC_ID, 1, onCombat)
RegisterCreatureEvent(NPC_ID, 2, onLeave)
RegisterCreatureEvent(NPC_ID, 3, killTarget)
RegisterCreatureEvent(NPC_ID, 4, onDied)
