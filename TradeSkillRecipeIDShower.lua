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