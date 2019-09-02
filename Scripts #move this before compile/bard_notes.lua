local notes = {50125}

function spawn(event, creature)
	creature:AddAura(42716, creature)
	creature:AddAura(800286, creature)
	creature:RegisterEvent(trigger, 3000, 1)
end

function trigger(i, ii, iii, creature)
	creature:DespawnOrUnsummon()
end

for i,v in ipairs(notes) do
	RegisterCreatureEvent(v, 5, spawn)
end

