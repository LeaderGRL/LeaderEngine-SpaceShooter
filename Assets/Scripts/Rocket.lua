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
    --print(instance.bulletsName)
    local entity = weaponsEntity:AddChild(instance.bulletsName)
    if entity then
        entity:AddComponent(Component.ANIMATION)
        entity:GetComponent(Component.ANIMATION):PlayAnimation(instance.animationName, true)
    end
    
    instance.weapons = weaponsEntity

    return instance
end

function Rocket:Update(dt)
    Bullets.Update(self, dt)
end

return Rocket



