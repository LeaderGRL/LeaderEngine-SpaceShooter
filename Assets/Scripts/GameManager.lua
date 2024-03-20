require "Player"
require "MainMenu"

GameManager = {}

function GameManager:New()
      MainMenu:new()
end

function GameManager:Update(dt)
    --Player:Update(dt)
    MainMenu:Update(dt)
end

GameManager:New()
return GameManager