require "Player"

GameManager = {}

function GameManager:New()
    Player:Create()
    Player:RegisterEvents()
end

function GameManager:Update(dt)
    Player:Update(dt)
end

GameManager:New()
return GameManager