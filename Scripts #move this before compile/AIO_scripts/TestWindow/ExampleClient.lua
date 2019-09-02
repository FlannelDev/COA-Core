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
This file is a client file and it handles all client side code. It is added on server
side to a list of files to send to the client when the client reloads UI or logs in.
This means that the file is run on server side and then on client side.
This file should be placed somewhere in the lua_scripts folder so Eluna can load it.
You can of course design your own addons and codes in some other way.

Few tips:
Size matters. The final compressed and obfuscated code will be sent to the client and
if it is very large, it will take more messages and more work to send.
Obfuscation will be done on startup so it will not slow down the sending process.
AIO has a cache system that avoids unnecessary resending of unchanged addons
between relogging. You can reset all client side saved information with /aio reset
Type /aio help to see all other commands.

Message compression and obfuscation should be turned on in AIO.lua files on server
and client. If you want to debug your code and need to see the correct line numbers
on error messages, disable obfuscation.
Use locals! local variables will be shortened by obfuscation, so you should prefer
local variables over global and you should try make functions, methods and variables local.
Make functions out of repetitive code to make the code smaller.
Obfuscation removes comments so you can have as much comments as you want in your code
to keep it clear.

After getting some base understanding of how things work, it is suggested to read all the AIO files.
They contain a lot of new functions and information and everything has comments about what it does.
]]


-- Note that getting AIO is done like this since AIO is defined on client
-- side by default when running addons and on server side it may need to be
-- required depending on the load order.
local AIO = AIO or require("AIO")

-- This will add this file to the server side list of addons to send to players.
-- The function is coded to get the path and file name automatically,
-- but you can also provide them yourself. AIO.AddAddon will return true if the
-- addon was added to the list of loaded addons, this means that if the
-- function returns true the file is being executed on server side and we
-- return since this is a client file. On client side the file will be executed
-- entirely.
if AIO.AddAddon() then
    return
end

local scale = 55
local padding = 10

local picks = {}



-- AIO.AddHandlers adds a new table of functions as handlers for a name and returns the table.
-- This is used to add functions for a specific "channel name" that trigger on specific messages.
-- At this point the table is empty, but MyHandlers table will be filled soon.
local MyHandlers = AIO.AddHandlers("AIOExample", {})
local Conquest = AIO.AddHandlers("Conquest", {})
-- You can also call this after filling the table. like so:
--  local MyHandlers = {}; ..fill MyHandlers table.. AIO.AddHandlers("AIOExample", MyHandlers)

-- Lets create some UI frames for the client.
-- Note that this code is executed on addon side - you can use any addon API function etc.
local buttonToggleBook;
FrameTest = CreateFrame("Frame", "FrameTest", UIParent, "UIPanelDialogTemplate")
local frame = FrameTest

-- Some basic method usage..
-- Read the wow addon widget API for what each function does:
-- http://wowwiki.wikia.com/Widget_API
frame:SetSize(scale * 8, 580)
frame:RegisterForDrag("LeftButton")
frame:SetPoint("CENTER")
frame:SetToplevel(true)
frame:SetClampedToScreen(true)
-- Enable dragging of frame
frame:SetMovable(true)
frame:EnableMouse(true)
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnHide", frame.StopMovingOrSizing)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
frame:Hide()
--[[
buttonToggleBook = CreateFrame("Button", "btnToggleBook", UIParent, "ActionButtonTemplate")

local book_sn,book_rnk,book_ico,book_cost = GetSpellInfo(64323)
buttonToggleBook:SetNormalTexture(book_ico)
buttonToggleBook:SetPushedTexture(book_ico)
buttonToggleBook:SetSize(64, 64)
--buttonToggleBook:SetPoint("LEFT", UIParent, 5, 0)
buttonToggleBook:EnableMouse(true)
buttonToggleBook:RegisterForDrag("LeftButton")
--buttonToggleBook:SetPoint("LEFT")
buttonToggleBook:SetPoint("LEFT", UIParent, "LEFT", 0, 100)
buttonToggleBook:SetToplevel(true)
buttonToggleBook:SetClampedToScreen(true)
buttonToggleBook:SetMovable(true)
buttonToggleBook:Show()
AIO.SavePosition(buttonToggleBook)

AIO.SavePosition(frame)]]

local title = frame:CreateFontString("fntTitle")
title:SetFont("Fonts\\FRIZQT__.TTF", 17, "OUTLINE, MONOCHROME")
title:SetShadowOffset(1, -1)
title:SetPoint("TOP", frame, "TOP", 0, -6)
title:SetText("Talents")
title:Show()

function MyHandlers.ShowFrame(p, class, list, name)
	full_list = list
	CLASS_ID = class
	title:SetText(name.." Traits")
    frame:Show()
    start(player, list)
end

local button = CreateFrame("Button", "btnReset", frame, "UIPanelButtonTemplate")
button:SetSize(180, 30)
button:SetPoint("LEFT", frame, "LEFT", 0, -(frame:GetHeight()/2)-8)
button:EnableMouse(true)
button:SetScript("OnMouseUp", function() input:ClearFocus() end)


local fontstring = button:CreateFontString("FontTest")
fontstring:SetFont("Fonts\\FRIZQT__.TTF", 17, "OUTLINE, MONOCHROME")
fontstring:SetShadowOffset(1, -1)
button:SetFontString(fontstring)
button:SetText("Reset All Abilities")


function getClassID(player)
	for i=700001,700050 do
		if(player:HasItem(i))then
			return i - 700000;
		end
	end
	return 0;
end

local function SpellTooltipOnEnter(self, motion) 
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM") 
	GameTooltip:SetHyperlink("spell:"..tonumber(self:GetName()))
   GameTooltip:Show() 
end 

local function SpellTooltipOnClick(self, motion) 
	 AIO.Handle("Conquest", "LearnSpell", tonumber(self:GetName()), 10)
end 

--local brackets = {15, 30, 45, 60, 70, 75, 80}
local brackets = {10, 20, 30, 40, 50, 60, 70, 80}

function start(player, full_list)
	for i=1,8 do
		local catCore = frame:CreateFontString("fntCatCore")
		catCore:SetFont("Fonts\\FRIZQT__.TTF", 40, "OUTLINE, MONOCHROME")
		catCore:SetShadowOffset(1, -1)
		catCore:SetPoint("LEFT", frame, "TOP", 20-(frame:GetWidth()/2), -75 - (scale + padding) * (i-1))
		catCore:SetText(brackets[i]+"0")
		catCore:Show()
	end
	local spacer = scale * 1
	for i,l in ipairs(full_list) do
		for j,k in ipairs(l) do
			local SpellName1,SpellRank1,SpellIcon1,SpellCost1 = GetSpellInfo(k)
			local spellicon = CreateFrame("Button", ""..k, frame, nil)
			spellicon:SetSize(scale, scale)
			spellicon:SetPoint("TOPLEFT", (j) * (scale + spacer), -90 - (scale + padding) * i + scale * 2)
			spellicon:EnableMouse(true)
			spellicon:SetNormalTexture(SpellIcon1)
			spellicon:SetScript("OnEnter", SpellTooltipOnEnter) 
			spellicon:SetScript("OnLeave", function() GameTooltip:Hide() end)
			spellicon:SetScript("OnClick", SpellTooltipOnClick)
			SpellTooltipOnEnter(spellicon, nil)
			spellicon:Show()
		end
	end
end

function swapListValues(list, v1, v2)

end


-- You can do a lot of things on client side events.
-- You can find all events for different frame types here: http://wowwiki.wikia.com/Widget_handlers
-- Here I send a message to the server that executes the print handler
-- See the ExampleServer.lua file for the server side print handler.
local function OnClickButton(btn)
    AIO.Handle("AIOExample", "Print", btn:GetName(), input:GetText(), slider:GetValue())
end



button:SetScript("OnClick", OnClickButton)


