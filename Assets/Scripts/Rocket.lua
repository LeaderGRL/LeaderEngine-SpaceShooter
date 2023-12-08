local Bullets = require "Bullets"

Rocket = {
    rocketCounter = 0,  -- Counter for unique rocket names
}

Rocket = setmetatable(Rocket, {__index = Bullets})

function Rocket:New()
    self.rocketCounter = self.rocketCounter + 1

    local instance = Bullets:New()
    setmetatable(instance, {__index = Rocket})

    instance.bulletsName = "Rocket" .. tostring(self.rocketCounter)
    print(instance.bulletsName)
    local entity = instance.EManager:CreateEntity(instance.bulletsName)
    if entity then
        entity:AddComponent(Component.ANIMATION)
        entity:GetComponent(Component.ANIMATION):PlayAnimation(instance.animationName, true)
    end
    
    return instance
end

function Rocket:Update(dt)
    Bullets.Update(self, dt)
end

return Rocket



