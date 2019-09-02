function spawn_anger(event, creature)
	creature:AddAura(500139, creature)
	creature:AddAura(69844, creature)
	creature:SetScale(0.5)
end

function spawn_joy(event, creature)
	creature:AddAura(500139, creature)
	creature:AddAura(22579, creature)
	creature:SetScale(0.5)
end

function spawn(event, creature)
	creature:AddAura(500139, creature)
	creature:SetScale(0.5)
end

RegisterCreatureEvent(50036, 5, spawn_anger)
RegisterCreatureEvent(50039, 5, spawn_joy)
RegisterCreatureEvent(50038, 5, spawn)
RegisterCreatureEvent(50037, 5, spawn)