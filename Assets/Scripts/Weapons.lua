
require "Bullets"

Weapons = {
    weaponsName = "FighterWeapons",
    
    EManager = EntityManager:GetInstance(),
    RManager = ResourceManager:GetInstance(),
    EventManager = EventManager:GetInstance(),
}

function Weapons:Create()
    local weapons = self.EManager:GetEntity(self.weaponsName)
    
    if weapons then
        weapons:AddComponent(Component.ANIMATION)
    end

    weapons:SetPosition(200,200)
    Bullets:Create()

end

function Weapons:OnMousePressed(event)
    if sf.MouseButtonEvent.GetMouseEventCode(event.mouseButton) == sf.LEFT then
        self.EManager:GetEntity(self.weaponsName):GetComponent(Component.ANIMATION):PlayAnimation("FighterWeaponsAnimation", true)
        self.EManager:GetEntity(Bullets.bulletsName):GetComponent(Component.ANIMATION):PlayAnimation("RocketAnimation", true)
    end
end

function Weapons:OnMouseReleased(event)
    if sf.MouseButtonEvent.GetMouseEventCode(event.mouseButton) == sf.LEFT then
        self.EManager:GetEntity(self.weaponsName):GetComponent(Component.ANIMATION):StopAnimation("FighterWeaponsAnimation")
        self.EManager:GetEntity(Bullets.bulletsName):GetComponent(Component.ANIMATION):StopAnimation("RocketAnimation")
    end
end

function Weapons:RegisterEvents()
    self.EventManager:RegisterEvent(Input.INPUT_EVENT_MOUSE_PRESSED, function(event) self:OnMousePressed(event) end)
    self.EventManager:RegisterEvent(Input.INPUT_EVENT_MOUSE_RELEASED, function(event) self:OnMouseReleased(event) end)
end

return Weapons
--Weapons:Create()