local AIO = AIO or require("AIO")

if AIO.AddAddon() then
    return
end

local scale = 50
local padding = 10


local Spellview = AIO.AddHandlers("Spellview", {})


local buttonToggleBook;
FrameTest = CreateFrame("Frame", "FrameSpellview", UIParent, "UIPanelDialogTemplate")
local frame = FrameTest

frame:SetSize((scale * 1.25) * 9, 480)
frame:RegisterForDrag("LeftButton")
frame:SetPoint("CENTER")
frame:SetToplevel(true)
frame:SetClampedToScreen(true)
frame:SetMovable(true)
frame:EnableMouse(true)
frame:SetScript("OnDragStart", frame.StartMoving)
frame:SetScript("OnHide", frame.StopMovingOrSizing)
frame:SetScript("OnDragStop", frame.StopMovingOrSizing)
frame:Hide()

local title = frame:CreateFontString("fntTitle")
title:SetFont("Fonts\\FRIZQT__.TTF", 17, "OUTLINE, MONOCHROME")
title:SetShadowOffset(1, -1)
title:SetPoint("TOP", frame, "TOP", 0, -6)
title:SetText("Spells")
title:Show()

function Spellview.ShowFrameSpells(p, class, list, name)
	full_list = list
	CLASS_ID = class
	title:SetText(name.." Core Spells")
    frame:Show()
    startSpells(player, list, 8)
end

function getClassID(player)
	for i=700001,700050 do
		if(player:HasItem(i))then
			return i - 700000;
		end
	end
	return 0;
end

local function SpellTooltipOnEnter1(self, motion) 
	GameTooltip:SetOwner(self, "ANCHOR_BOTTOM") 
	GameTooltip:SetHyperlink("spell:"..tonumber(self:GetName()))
   GameTooltip:Show() 
end 

function startSpells(player, full_list, maxPerLine)
	local spacer = scale * 1.25
	local currentY = - 90 - (scale + padding) * 1 + scale * 2
	local lineCount = 0
	local currentLine = 0
	for i,k in ipairs(full_list) do
		if(k ~= nil)then
			lineCount = lineCount + 1
			local SpellName1,SpellRank1,SpellIcon1,SpellCost1 = GetSpellInfo(k)
			local spellicon = CreateFrame("Button", ""..k, frame, nil)
			spellicon:SetSize(scale, scale)
			spellicon:SetPoint("TOPLEFT", (i - (currentLine * maxPerLine)) * (spacer) - scale / 2, currentY)
			spellicon:EnableMouse(true)
			spellicon:SetNormalTexture(SpellIcon1)
			spellicon:SetScript("OnEnter", SpellTooltipOnEnter1) 
			spellicon:SetScript("OnLeave", function() GameTooltip:Hide() end)
			spellicon:SetScript("OnClick", SpellTooltipOnClick)
			SpellTooltipOnEnter1(spellicon, nil)
			spellicon:Show()
			if(lineCount >= maxPerLine)then
				lineCount = 0
				currentY = currentY - (scale + padding)
				currentLine = currentLine + 1
			end
		end
	end
end

function swapListValues(list, v1, v2)

end
