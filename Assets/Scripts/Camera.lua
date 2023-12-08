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
    
    camera:SetPosition(0,0)
        
    local cameraComponent = camera:GetComponent(Component.CAMERA)

    if cameraComponent then
        cameraComponent:SetZoom(1)
        cameraComponent:SetSize(Vector2f(800,800))
        cameraComponent:SetRotation(0)
    end
end

function Camera:Update(dt)

end

Camera:Create()