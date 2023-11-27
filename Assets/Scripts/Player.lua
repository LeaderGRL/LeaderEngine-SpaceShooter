require "Weapons"
require "Bullets"

local Player = {
    entityName = "Fighter",
    speed = 10,
    EManager = EntityManager:GetInstance(),
    RManager = ResourceManager:GetInstance(),
    EventManager = EventManager:GetInstance(),
}

function Player:Create()
    local player = self.EManager:GetEntity(self.entityName)
    local playerEffect = self.EManager:CreateEntity("playerEffect")
    
    if player then
        player:AddComponent(Component.SPRITE2D)
        player:AddComponent(Component.BOX_COLLIDER)
    end

    playerEffect:AddComponent(Component.ANIMATION)

    local fighter = player:GetComponent(Component.SPRITE2D)
    local boxCollider = player:GetComponent(Component.BOX_COLLIDER)
    local fighterEffect = playerEffect:GetComponent(Component.ANIMATION)

    if fighter then
        fighter:SetSprite(self.RManager:GetTexture("Fighter"))
    end

    if boxCollider then
        boxCollider:SetSize(Vector2f(64,64))
    end

    if fighterEffect then
        fighterEffect:PlayAnimation("FighterEffectAnimation", true)
    end
        
    player:SetPosition(200,200)
    playerEffect:SetPosition(200,200)
    Weapons:Create()
    self.EManager:GetEntity(Weapons.weaponsName)
end

function Player:OnKeyPressed(event)
    if sf.KeyEvent.GetKeyEventCode(event.key) == sf.KEY_Z then
        self:Move(0,-1) 
    end

    if sf.KeyEvent.GetKeyEventCode(event.key) == sf.KEY_S then
       self:Move(0,1) 
    end

    if sf.KeyEvent.GetKeyEventCode(event.key) == sf.KEY_Q then
       self:Move(-1,0)
    end
    
    if sf.KeyEvent.GetKeyEventCode(event.key) == sf.KEY_D then
       self:Move(1,0)
    end
end

function Player:Move(x, y)
    local player = self.EManager:GetEntity(self.entityName)
    local playerEffect = self.EManager:GetEntity("playerEffect")
    local playerWeapons = self.EManager:GetEntity(Weapons.weaponsName)
    
    player:Move_V(Vector2f(x * self.speed, y * self.speed))
    playerEffect:Move_V(Vector2f(x * self.speed, y * self.speed))
    playerWeapons:Move_V(Vector2f(x * self.speed, y * self.speed))
end

function Player:SetSpeed(speed)
    
end

function Player:RegisterEvents()
    -- Anonymous function avoid to call the OnKeyPressed function directly
    self.EventManager:RegisterEvent(Input.INPUT_EVENT_KEY_PRESSED, function(event) self:OnKeyPressed(event) end) 
end

function Player:Update(dt)

end
-- Create the player and register events
Player:Create()
Player:RegisterEvents()
Weapons:RegisterEvents()
