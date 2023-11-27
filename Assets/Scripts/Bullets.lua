Bullets = {
    bulletsName = "Rocket",
    
    EManager = EntityManager:GetInstance(),
    RManager = ResourceManager:GetInstance(),
    EventManager = EventManager:GetInstance(),
}

function Bullets:Create()
    local bullets = self.EManager:GetEntity(self.bulletsName)

    if bullets then
        bullets:AddComponent(Component.ANIMATION)
    end
    
    bullets:SetPosition(200,200)
end

function Bullets:Move(dt)
    print("eee")
    local bullets = self.EManager:GetEntity(self.bulletsName)
    local position = bullets:GetPosition()
    bullets:SetPosition(position.x, position.y * 100 * dt)
end

function Bullets:Update(dt)
    print(dt)
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