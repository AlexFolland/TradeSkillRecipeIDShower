ExtraTradeSkillRecipeTextFrame = CreateFrame("Frame", nil, UIParent)
ExtraTradeSkillRecipeTextFrame:RegisterEvent("ADDON_LOADED")

local hooked = false
ExtraTradeSkillRecipeTextFrame:SetScript("OnEvent", function(self, event, arg1, ...)
    if arg1 == "Blizzard_TradeSkillUI" then
        if hooked == false then
            hooksecurefunc(TradeSkillFrame.DetailsFrame, "RefreshDisplay", function(self, ...)
                if self.selectedRecipeID == nil then return end

                local extraText="recipe ID: "..tostring(self.selectedRecipeID)

                local sourceText=self.Contents.SourceText:GetText()
                if sourceText==nil then
                    local numReagents = C_TradeSkillUI.GetRecipeNumReagents(self.selectedRecipeID)
                    if numReagents > 0 then
                        self.Contents.SourceText:SetPoint("TOP", self.Contents.Reagents[numReagents], "BOTTOM", 0, -15)
                    else
                        self.Contents.SourceText:SetPoint("TOP", self.Contents.ReagentLabel, "TOP");
                    end
                    sourceText=extraText
                    self:AddContentWidget(self.Contents.SourceText)
                    self.Contents.SourceText:Show()
                else
                    sourceText=sourceText.."\n\n"..extraText
                end
                self.Contents.SourceText:SetText(sourceText)
                self:RefreshButtons()
            end)
            hooked = true
            self:UnregisterEvent("ADDON_LOADED")
        end
    end
end)