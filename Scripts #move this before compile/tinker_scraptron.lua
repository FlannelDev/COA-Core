local NPC_ID = 50048

function spawn(event, creature)
	local dur = 30000
	creature:SetMaxHealth(creature:GetOwner():GetStat(2) * 1.2 +  creature:GetOwner():GetStat(0) / 2)
	creature:SetHealth(creature:GetMaxHealth())
	initPetAttack(creature)
	creature:RegisterEvent(tinker_scraptron_attack, 2000, dur / 2000)
end

function initPetAttack(creature)
	local tar = creature:GetOwner():GetSelection()
	if(tar:GetVictim() == nil)then
		tar:AttackStart(creature)
	end
	creature:AttackStart(tar)
end

function tinker_scraptron_attack(i, ii, iii, creature)
	tar = creature:GetVictim()
	if(tar ~= nil)then
		creature:CastSpell(tar, 64799, true)
		local owner = creature:GetOwner()
		local dmg = (5 + math.random(5) + owner:GetLevel() * 3 + owner:GetStat(1) / 2) 
		creature:GetOwner():DealDamage(tar, dmg)
	end
end

RegisterCreatureEvent(NPC_ID, 5, spawn)
