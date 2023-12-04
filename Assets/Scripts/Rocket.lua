local Bullets = Require "Bullets"

Rocket = {}
setmetatable(rocket, {__index = Bullers})

function Rocket:New()
    local instance = Bullets:New()
    setmetatable(instance, {__index = Rocket})
    return instance
end

function Rocket:Update()
    -- do something
end

return Rocket
--bullet = Bullets:New(bulletsName="Rocket", speed=100)
--rocket = bullet:New{}



