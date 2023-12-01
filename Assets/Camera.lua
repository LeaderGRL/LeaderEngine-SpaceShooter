Camera = {
    cameraName = "MainCamera",
    
    EManager = EntityManager:GetInstance(),
    RManager = ResourceManager:GetInstance(),
    EventManager = EventManager:GetInstance(),
}

function Camera:Create()
    local camera = self.EManager:GetEntity(self.cameraName)
    
    if camera then
        camera:AddComponent(Component.CAMERA)
    end
    
    camera:SetPosition(200,200)
    
    local cameraComponent = camera:GetComponent(Component.CAMERA)

    if cameraComponent then
        print("testtt")
        cameraComponent:SetSize(sf.Vector2f(10,10))
    end
end

Camera:Create()