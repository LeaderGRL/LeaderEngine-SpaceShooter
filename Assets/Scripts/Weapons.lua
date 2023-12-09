require "BulletManager"
require "Bullets"
require "Rocket"

Weapons = {
    weaponsName = "FighterWeapons",
    
    EManager = EntityManager:GetInstance(),
    RManager = ResourceManager:GetInstance(),
    EventManager = EventManager:GetInstance(),
    BManager = BulletManager:GetInstance(),
}

function Weapons:Create()
    local weapons = self.EManager:CreateEntity(self.weaponsName)
    
    if weapons then
        weapons:AddSprite2DComponent()
    end

    weapons:SetPosition(200,200)
end

function Weapons:OnMousePressed(event)
    if sf.MouseButtonEvent.GetMouseEventCode(event.mouseButton) == sf.LEFT then
        local weapons = self.EManager:GetEntity(self.weaponsName)
        local rocket = Rocket:New(weapons)
        self.BManager:AddBullet(rocket)
        weapons:GetSprite2DComponent():PlayAnimation("FighterWeaponsAnimation", true)
    end
end

function Weapons:OnMouseReleased(event)
    if sf.MouseButtonEvent.GetMouseEventCode(event.mouseButton) == sf.LEFT then
        self.EManager:GetEntity(self.weaponsName):GetSprite2DComponent():StopAnimation("FighterWeaponsAnimation")
    end
end

function Weapons:RegisterEvents()
    self.EventManager:RegisterEvent(Input.INPUT_EVENT_MOUSE_PRESSED, function(event) self:OnMousePressed(event) end)
    self.EventManager:RegisterEvent(Input.INPUT_EVENT_MOUSE_RELEASED, function(event) self:OnMouseReleased(event) end)
end

function Weapons:Update(dt)
    --print(dt)
end

return Weapons
--Weapons:Create()