local GameManager = require "GameManager"

MainMenu = {
    editBox = tgui.EditBox.Create()
}

function MainMenu:new()
--    MainMenu:SendIP("10.70.10.7")
--    GameManager.NetworkStateManager:PushState(NetworkHostState())
    local inputField = {editBox = tgui.EditBox.Create()}
    setmetatable(inputField, self)
    self.__index = self 
    return inputField
end

function MainMenu:Init()
    print("MainMenu Init")

    local mainMenu = MainMenu:new()
    mainMenu:InitEditBox(tgui.Layout(200), tgui.Layout(40))
end

function MainMenu:Update(dt)
    --print("a")
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
    local newScene = GameManager.SceneManager:CreateScene()
    newScene:SetId("GameScene")

    local player = GameManager.SceneManager:GetCurrentScene():GetEntityManager():CreateEntity("Player")
    player:AddScriptComponent("Assets/Scripts/Player.lua")

    gui:Remove(self.editBox)

    local ip = self.editBox:GetText():ToStdString()

    if ip == "" then
        return
    end
    
    MainMenu:SendIP(ip)

    if ip == "localhost" then
        GameManager.NetworkStateManager:PushState(NetworkHostState())
    else
        GameManager.NetworkStateManager:PushState(NetworkConnectionState())
    end

--    local newScene = GameManager.SceneManager:CreateScene()
--    newScene:SetId("GameScene")

--    local player = GameManager.SceneManager:GetCurrentScene():GetEntityManager():CreateEntity("Player")
--    player:AddScriptComponent("Assets/Scripts/Player.lua")

--    gui:Remove(self.editBox)
end

function MainMenu:SendIP(ip)
    local ipAddress = IpAddress(ip)
    GameManager.NetworkManager:SetIp(ipAddress)
    print("IP: " .. ip)
    print("IP Address: " .. GameManager.NetworkManager:GetIp():ToString())

end

return MainMenu