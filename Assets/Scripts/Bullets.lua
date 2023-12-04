Bullets = {
    bulletsName = "Rocket",
    speed = 100,
    EManager = EntityManager:GetInstance(),
    RManager = ResourceManager:GetInstance(),
    EventManager = EventManager:GetInstance(),
}

--Bullets.__index = Bullets

function Bullets.New()
    local instance = {}
    setmetatable(instance, {__index = Bullets})

    return instance
end

--function Bullets:Create()
--    local bullets = self.EManager:GetEntity(self.bulletsName)

--    if bullets then
--        bullets:AddComponent(Component.ANIMATION)
--    end

--    bullets:SetPosition(200,200)
--end

function Bullets:Move(dt)
    local bullets = self.EManager:GetEntity(self.bulletsName)
    local position = bullets:GetPosition()
    local x = position.x + self.speed * dt
    local y = position.y - self.speed * dt
    bullets:SetPosition(position.x,y)
    --bullets:SetPosition(position.x, position.y - 1 * dt)
end

function Bullets:Update(dt)
    self:Move(dt)
end

--function Bullets:Destroy()
--    local bullets = self.EManager:GetEntity(self.bulletsName)
--    if bullets then
--        self.EManager:RemoveEntity(bullets)
--    end
--end

--function Bullets:OnCollisionEnter(other)
--    if other:GetName() == "Enemy" then
--        self:Destroy()
--    end
--end

--function Bullets:OnCollisionExit
--end

return Bullets