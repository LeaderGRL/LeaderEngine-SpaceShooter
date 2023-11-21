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

return Bullets