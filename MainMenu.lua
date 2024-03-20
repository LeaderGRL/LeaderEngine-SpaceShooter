MainMenu = {}

function MainMenu:new()
    self:EditBox(tgui.Layout(200), tgui.Layout(40))
end

function MainMenu:Update(dt)
    
end

function MainMenu:EditBox(sizeX, sizeY)
    editBox = tgui.EditBox.Create()
    text = tgui.String("ip")
    gui:Add(editBox, text)
    editBox:SetSize(sizeX, sizeY)
    centerX = tgui.Layout((window:getSize().x - sizeX:getValue()) / 2)
    centerY = tgui.Layout((window:getSize().y - sizeY:getValue()) / 2)
    editBox:SetPosition(centerX, centerY)
end

return MainMenu