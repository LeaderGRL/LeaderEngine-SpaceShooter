Bullets = {
    bulletsName = "Rocket",
    animationName = "RocketAnimation",
    speed = 100,
    EManager = EntityManager:GetInstance(),
    RManager = ResourceManager:GetInstance(),
    EventManager = EventManager:GetInstance(),
}

--Bullets.__index = Bullets

function Bullets.New()
    local instance = {}
    setmetatable(instance, {__index = Bullets})
    --local bullet = self.EManager:GetEntity(self.bulletsName)
    --print(instance.weapons)
    --bullet:SetPosition(self.weapons:GetPosition().x, self.weapons:GetPosition().y)

    --instance.weapons = weaponsEntity
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
    --print(self.weapons)
    local bullet = self.EManager:GetEntity(self.bulletsName)
    --local bullet = self.weapons:GetChild(self.bulletsName)
    local position = bullet:GetPosition()
    local x = position.x + self.speed * dt
    local y = position.y - self.speed * dt
    bullet:SetPosition(position.x,y)
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