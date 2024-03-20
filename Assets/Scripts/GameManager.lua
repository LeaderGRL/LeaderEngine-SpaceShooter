require "Player"
require "MainMenu"

GameManager = {}

function GameManager:New()

      MainMenu:new()
--    editBox = tgui.EditBox.Create()
--    text = tgui.String("ip")
--    gui:Add(editBox, text)
--    sizeX = tgui.Layout(200)
--    sizeY = tgui.Layout(40)
--    centerX = tgui.Layout((window:getSize().x - sizeX:getValue()) / 2)
--    centerY = tgui.Layout((window:getSize().y - sizeY:getValue()) / 2)
--    editBox:SetSize(sizeX, sizeY)
--    editBox:SetPosition(centerX, centerY)
    --Player:Create()
    --Player:RegisterEvents()
end

function GameManager:Update(dt)
    Player:Update(dt)
end

GameManager:New()
return GameManager