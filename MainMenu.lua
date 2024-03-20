MainMenu = {
    editBox = tgui.EditBox.Create()
}

function MainMenu:new()
    local inputField = {editBox = tgui.EditBox.Create()}
    setmetatable(inputField, self)
    self.__index = self
    return inputField
end

function MainMenu:Update(dt)
    
end

function MainMenu:InitEditBox(sizeX, sizeY)
    local text = tgui.String("ip")
    gui:Add(self.editBox, text)
    self.editBox:SetSize(sizeX, sizeY)
    local centerX = tgui.Layout((window:getSize().x - sizeX:getValue()) / 2)
    local centerY = tgui.Layout((window:getSize().y - sizeY:getValue()) / 2)
    self.editBox:SetPosition(centerX, centerY)
    
    -- Connect the return key press event
    tgui.OnReturnKeyPress(self.editBox, function() self:OnEditBoxReturn() end)
end

function MainMenu:OnEditBoxReturn()
    print("Return")
end

MainMenu:InitEditBox(tgui.Layout(200), tgui.Layout(40))

return MainMenu