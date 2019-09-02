local AIO = AIO or require("AIO")
local charhooks = require "CharHooks"

local Spellview = AIO.AddHandlers("Spellview", {})

function indexOf(value, list)
	for i,v in ipairs(list) do
		if(value == v)then
			return i
		end
	end
	return 0
end

function len(arr)
	count = 0
	for k,v in pairs(arr) do
	     count = count + 1
	end
	return count
end

function getSpellList(player)
	local class = getClassID(player)
	local list = {}
	local full_list = getSpellsForClass(class)
	local index = 0
	local rows = 80
	for i=1,rows do
		local level_spells = full_list[i]
		if(level_spells ~= nil)then
			for j,v in ipairs(level_spells) do
				if(v > 0)then
					list[index] = v
					index = index + 1
				end
			end
		end
	end

	return list
end

local function OnCommand(event, player, command)
    if(command == "spells") then
        local list = getSpellList(player)
        local class = getClassID(player)
        local name = getNameForClass(class)
        AIO.Handle(player, "Spellview", "ShowFrameSpells", class, list, name)
        return false
    end
end

RegisterPlayerEvent(42, OnCommand)

