--GameManager = {
--    EManager = SceneManager:GetInstance():GetCurrentScene():GetEntityManager(),
--    RManager = ResourceManager:GetInstance(),
--    EventManager = EventManager:GetInstance(),
--}

local function GameManager(super) -- super is optional, if not provided, it will inherit from Object

    local gameManager = {
        EManager = SceneManager:GetInstance():GetCurrentScene():GetEntityManager(),
        RManager = ResourceManager:GetInstance(),
        EventManager = EventManager:GetInstance(),
        NetworkManager = NetworkManager:GetInstance(),
        SceneManager = SceneManager:GetInstance(),
    }

    gameManager.__index = gameManager -- failed table lookups on the instances should fallback to the class table, to get methods and fields
    setmetatable(gameManager, super) -- inherit from super class if super is provided


    function gameManager.New(...) -- The constructor 
        if gameManager._instance then
            return gameManager._instance -- return the instance if it exists already
        end

        local instance = setmetatable({}, gameManager) -- make GameManager handle lookup 
        if instance.ctor then -- constructor of the derived class 
            instance:ctor() -- call the constructor
        end

        gameManager._instance = instance -- save the instance created to be returned by the class
        return instance -- return the instance of the class 
    end

    function gameManager.Update(dt)
        --Player:Update(dt)
    end

    return gameManager -- return the class table to be assigned to a global variable later
end

local game = GameManager()
local manager = game.New()
return manager