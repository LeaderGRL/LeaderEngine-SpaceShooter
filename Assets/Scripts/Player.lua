require "Weapons"
require "Bullets"

Player = {
    entityName = "Fighter",
    speed = 10,
    EManager = SceneManager:GetInstance():GetCurrentScene():GetEntityManager(),
    RManager = ResourceManager:GetInstance(),
    EventManager = EventManager:GetInstance(),
    BManager = BulletManager:GetInstance(),
}

function Player:Create()
    local player = self.EManager:CreateEntity(self.entityName)
    local playerEffect = player:AddChild("playerEffect")
    
    if player then
        player:AddSprite2DComponent()
        player:AddBoxColliderComponent(Vector2f(64,64))
        player:AddNetworkingComponent()
    end

    if playerEffect then
        playerEffect:AddAnimation2DComponent("FighterEffectAnimation", true, true)
    end
    
    local fighter = player:GetSprite2DComponent()
    local boxCollider = player:GetBoxColliderComponent()
    --local fighterEffect = playerEffect:GetSprite2DComponent()

    if fighter then
        fighter:SetSpriteByName("Fighter")
    end

    if boxCollider then
        boxCollider:SetSize(Vector2f(64,64))
    end

--    if fighterEffect then
--        fighterEffect:PlayAnimation("FighterEffectAnimation", true)
--    end
    
    player:SetPosition(200,200)
    --playerEffect:SetPosition(25,25)
    Weapons:Create()
    Weapons:RegisterEvents()
    --self.EManager:CreateEntity(Weapons.weaponsName)
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
    local playerWeapons = self.EManager:GetEntity(Weapons.weaponsName)
    
    player:Move_V(Vector2f(x * self.speed, y * self.speed))
    playerWeapons:Move_V(Vector2f(x * self.speed, y * self.speed))
end

function Player:SetSpeed(speed)
    
end

function Player:RegisterEvents()
    -- Anonymous function avoid to call the OnKeyPressed function directly
    self.EventManager:RegisterEvent(Input.INPUT_EVENT_KEY_PRESSED, function(event) self:OnKeyPressed(event) end) 
end

function Player:Update(dt)
    self.BManager:Update(dt) -- Temp
--    print(dt)
end
-- Create the player and register events
--Player:Create()
--Player:RegisterEvents()
--Weapons:RegisterEvents()

return Player
