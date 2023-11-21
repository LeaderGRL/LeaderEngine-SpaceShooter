local Bullets = {
    BulletsName = "Rocket",
    
    EManager = EntityManager:GetInstance(),
    RManager = ResourceManager:GetInstance(),
    EventManager = EventManager:GetInstance(),
}

function Bullets:Create()
{
    local bullets = self.EManager:GetEntity(self.BulletsName)

    if bullets then
        bullets:AddComponent(Component.ANIMATION)
    end
    
    bullets:SetPosition(200,200)
}