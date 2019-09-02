--[[
Copyright (C) 2014-  Rochet2 <https://github.com/Rochet2>

This program is free software; you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation; either version 2 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License along
with this program; if not, write to the Free Software Foundation, Inc.,
51 Franklin Street, Fifth Floor, Boston, MA 02110-1301 USA.
]]

--[[
This file is a server file. It is loaded on server side and handles all server side code.
This file should be placed somewhere in the lua_scripts folder so Eluna can load it.
You can of course design your own addons and codes in some other way.

Few tips:
On server side the code size does not matter, however safety does!
On client side safety is not needed, but server safety will avoid nasty behavior and errors.
The client may send ANY data. Be cautious and make sure the data you receive is indeed the type you
expect it to be.

Message compression and obfuscation should be turned on in AIO.lua files on server
and client. If you want to debug your code and need to see the correct line numbers
on error messages, disable obfuscation.

After getting some base understanding of how things work, it is suggested to read all the AIO files.
They contain a lot of new functions and information and everything has comments about what it does.
]]


-- Note that getting AIO is done like this since AIO is defined on client
-- side by default when running addons and on server side it may need to be
-- required depending on the load order. On server only files the require
-- would be enough, but lets just keep it like this for the sake of consistency
local AIO = AIO or require("AIO")

-- AIO.AddHandlers adds a new table of functions as handlers for a name and returns the table.
-- This is used to add functions for a specific "channel name" that trigger on specific messages.
-- At this point the table is empty, but MyHandlers table will be filled soon.
local MyHandlers = AIO.AddHandlers("AIOExample", {})
local Conquest = AIO.AddHandlers("Conquest", {})
-- You can also call this after filling the table. like so:
--  local MyHandlers = {}; ..fill MyHandlers table.. AIO.AddHandlers("AIOExample", MyHandlers)

-- An example handler.
-- This prints all the values the client sends with the command
--  AIO.Handle("AIOExample", "print")
function MyHandlers.Print(player, ...)
    print(...)
end

local spells_fighter = {
	{0, 0, 0},
	{800041, 800018, 800020},
	{800023, 800019, 800016},
	{800031, 800015, 800021},
	{800013, 800027, 800030},
	{800029, 800053, 800044},
	{800071, 800073, 800069},
	{800068, 800064, 800028},
--	{500129, 500130, 500132},
}

local spells_support = {
	{0, 0, 0},
	{800051, 800052, 65542},
	{800049, 800046, 800048},
	{800034, 800014, 800022},
	{800058, 800056, 800025},
	{800669, 800063, 800059},
	{800029, 800015, 800017},
	{800013, 800018, 800068},
--	{500129, 500130, 500132},
}

local spells_magic = {
	{0, 0, 0},
	{800075, 800017, 800026},
	{800022, 800025, 800015},
	{800020, 800021, 800016},
	{800034, 800014, 65542},
	{800078, 800052, 800009},
	{800077, 800019, 800030},
	{800076, 800013, 800079},
	--{500129, 500130, 500132},
}

local spells_rogue = {
	{0, 0, 0},
	{800047, 800050, 800066},
	{800064, 800067, 800065},
	{800044, 800069, 800019},
	{800027, 800080, 800030},
	{800053, 800012, 800043},
	{800016, 800024, 800023},
	{800021, 800041, 800020},
	--{500132, 500132, 500132},
}

--local brackets = {15, 30, 45, 60, 75, 80}
local brackets = {10, 20, 30, 40, 50, 60, 70, 80}

local spells_class = {
	{19, 46565, 800586, 800602}, --sundancer
	{7, 500026, 800081, 800082}, --flesh warden
	{18, 800060, 800072, 800148}, --necro
	{5, 800098, 800099, 800101}, --sbringer
	{17, 800105, 800107, 800106}, --cultist
	{21, 800103, 800666, 800112}, --riftblade
	{2, 800327, 800328, 800330}, --witch doc
	{20, 800116, 800035, 500246}, --witch doc
	{16, 800122, 800121, 500134}, --pyromancer
	{9, 500694, 500683, 800124}, --monk
	{1, 800131, 800132, 800152}, --barb
	{23, 800143, 800184, 800177}, --wildwalker
	{10, 800486, 800157, 800493}, --sonofarugal
	{4, 500090, 800160, 800167}, --witch hunter
	{22, 800172, 800171, 800174}, --reaper
	{8, 800701, 800322, 800323}, --guardian
	{3, 800355, 800352, 800225}, --demonhunter
	{12, 800358, 800359, 800360}, --ranger
	{26, 800451, 800465, 800462}, --doomcaller
	{6, 500276, 800561, 800758}, --sm
}

function getTalentsForClass(classID)
	print(classID)
	for i,v in ipairs(spells_class) do
		if(v[1] == classID)then
			return v
		end
	end
	return {1, 800045, 800045, 800045}
end

local ULTIMATE_INDEX = 1

function getTalentList(player)
	local classID = getClassID(player)
	local list = spells_fighter
	if(player:GetClass() == 4)then list = spells_rogue; end
	if(player:GetClass() == 8)then list = spells_magic; end
	if(player:GetClass() == 5)then list = spells_support; end
	local class_list = getTalentsForClass(classID)
	for i,v in ipairs(list[ULTIMATE_INDEX]) do
		list[ULTIMATE_INDEX][i] = class_list[i+1]
	end
	return list	
end

function indexOf(value, list)
	for i,v in ipairs(list) do
		if(value == v)then
			return i
		end
	end
	return 0
end

function getBracketForSpell(spell, list)
	for i,v in ipairs(list) do
		for j,x in ipairs(v) do
			if(spell == x)then
				return (i * 10)
			end
		end
	end
end

function onLearnTalent(player, spellid, last)
	player:CastSpell(player, 2641, true)
	if(spellid == 800493)then
		player:LearnSpell(197)
		player:LearnSpell(199)
		player:LearnSpell(202)
	end
	if(last == 800493)then
		player:RemoveSpell(197)
		player:RemoveSpell(199)
		player:RemoveSpell(202)
	end
	initClass(player, getClassID(player))
end

function Conquest.LearnSpell(player, spellid, bracket)
	bracket = getBracketForSpell(spellid, getTalentList(player))
	if(player:HasSpell(spellid))then
		player:SendBroadcastMessage("You already have this talent.")
	else
		if(player:IsInCombat())then
			player:SendBroadcastMessage("You cannot change your talents while in combat.")
		else
			if(player:GetLevel() >= bracket)then
				talents = getTalentList(player)
				line = nil
				for i,v in ipairs(talents) do
					for x,y in ipairs(v) do
						if(y == spellid)then
							line = v
						end
					end
				end
				local last = 0
				for i,v in ipairs(line) do
					if(player:HasSpell(v))then
						last = v;
						player:RemoveSpell(v)
						player:RemoveAura(v)
					end
				end
				player:LearnSpell(spellid)
				onLearnTalent(player, spellid, last)
			end
		end
	end
end

function Conquest.GetSpellsForCategory(class, category)
	local str = ""
	local queryString = "SELECT spell, cost FROM class_spells WHERE class = "..class.." AND category = "..category
	local query = WorldDBQuery(queryString)
	local spells = {}
	if query then 
	    repeat 
	    local row = query:GetRow()
	    	if(tonumber(row["cost"]) > 0)then
		        spells[#spells+1] = row["spell"]
		    end
		until not query:NextRow()
	end
	return spells
end
-- When a player uses command .test, show the UI to player
-- The showing is done by sending a message to the client that then does whatever
-- we have coded to be done when receiving the message
local function OnCommand(event, player, command)
    if(command == "spec") then
        -- Note that AIO.Handle has two different definitions:
        -- On client side you don't pass the player argument
        local class = getClassID(player)
        print(class)
        local list = getTalentList(player)
        print(list)
        local name = (getNameForClass(class))
        AIO.Handle(player, "AIOExample", "ShowFrame", class, list, name)
        return false
    end
end

RegisterPlayerEvent(42, OnCommand)

