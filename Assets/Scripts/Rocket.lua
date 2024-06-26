local Bullets = require "Bullets"

Rocket = {
    rocketCounter = 0,  -- Counter for unique rocket names
}

Rocket = setmetatable(Rocket, {__index = Bullets})

function Rocket:New(weaponsEntity)
    self.rocketCounter = self.rocketCounter + 1

    local instance = Bullets:New()
    setmetatable(instance, {__index = Rocket})

    instance.bulletsName = "Rocket" .. tostring(self.rocketCounter)
    local entity = instance.EManager:CreateEntity(instance.bulletsName)
    if not entity then
        return
    end

    print("buller position")
    print(weaponsEntity:GetPosition().x + 16)
    if self.rocketCounter % 2 == 0 then
        entity:SetPosition(weaponsEntity:GetPosition().x + 16, weaponsEntity:GetPosition().y + 16) -- TODO : Refactor the function in C++ to allow a Vector2f in parameter
    else
        entity:SetPosition(weaponsEntity:GetPosition().x + 40, weaponsEntity:GetPosition().y + 16) -- TODO : Refactor the function in C++ to allow a Vector2f in parameter
    end
    entity:AddAnimation2DComponent(instance.animationName, true, true)
    -- entity:GetSprite2DComponent():PlayAnimation(instance.animationName, true)
    entity:AddBoxColliderComponent()
    local boxCollider = entity:GetBoxColliderComponent()
    boxCollider:SetSize(Vector2f(9,9))
    
    --instance.weapons = weaponsEntity

    return instance
end

function Rocket:Update(dt)
    --print("Rocket Update")
    Bullets.Update(self, dt)
end

return Rocket



