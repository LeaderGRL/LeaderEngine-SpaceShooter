local GameManager = require "GameManager"

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
    --print(self.editBox:GetText():ToStdString())
end

function MainMenu:InitEditBox(sizeX, sizeY)
    --local newScene = GameManager.SceneManager:CreateScene()

    print(self.editBox)
    local text = tgui.String("ip")
    gui:Add(self.editBox, text)

    self.editBox:SetDefaultText(text)
    local centerX = tgui.Layout((window:getSize().x - sizeX:getValue()) / 2)
    local centerY = tgui.Layout((window:getSize().y - sizeY:getValue()) / 2)
    self.editBox:SetPosition(centerX, centerY)

    -- Connect the return key press event
    tgui.OnReturnKeyPress(self.editBox, function() self:OnEditBoxReturn() end)
end

function MainMenu:OnEditBoxReturn()
    local ip = self.editBox:GetText():ToStdString()

    MainMenu:SendIP(ip)

    local newScene = GameManager.SceneManager:CreateScene()
    newScene:SetId("GameScene")
    --GameManager.SceneManager:ChangeScene(newScene)

    local player = GameManager.SceneManager:GetCurrentScene():GetEntityManager():CreateEntity("Player")

    player:AddScriptComponent("Assets/Scripts/Player.lua")
    print("Player added")


end

function MainMenu:SendIP(ip)
    local ipAddress = IpAddress(ip)
    GameManager.NetworkManager:SetIp(ipAddress)
    print("IP: " .. ip)
    print("IP Address: " .. GameManager.NetworkManager:GetIp():ToString())

end

local mainMenu = MainMenu:new()
mainMenu:InitEditBox(tgui.Layout(200), tgui.Layout(40))

return mainMenu