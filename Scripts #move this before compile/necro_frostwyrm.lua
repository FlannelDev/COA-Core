local NPC_ID = 50115

function spawn(event, creature)
	tar = creature:GetOwner():GetSelection()
	creature:SetMaxHealth(creature:GetOwner():GetStat(2) * 2 +  creature:GetOwner():GetStat(3) / 4 * 3)
	creature:SetHealth(creature:GetMaxHealth())
	if(tar == nil)then
		creature:CastSpell(creature, 500987, false)
	else
		creature:CastSpell(tar, 500987, false)
	end
	creature:RegisterEvent(necro_wyrm_breath, 1200, 1)
	creature:RegisterEvent(necro_pet_die, 3500, 1)
    creature:SetFacing(creature:GetOwner():GetO())
    local root = creature:AddAura(75215, creature)
    root:SetDuration(5000)
end

function necro_pet_die(i, ii, iii, creature)
	creature:CastSpell(creature, 51929, true)
	creature:DespawnOrUnsummon()
end

function necro_wyrm_breath(i, ii, iii, creature)
	creature:CastSpell(creature, 45846, false)
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
