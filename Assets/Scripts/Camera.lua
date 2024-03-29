Camera = {
    cameraName = "MainCamera",
    
    EManager = SceneManager:GetInstance():GetCurrentScene():GetEntityManager(),
    RManager = ResourceManager:GetInstance(),
    EventManager = EventManager:GetInstance(),
}

function Camera:Create()
    local camera = self.EManager:GetEntity(self.cameraName)
    
    if camera then
        camera:AddCameraComponent()
    end
    
    camera:SetPosition(0,0)
        
    local cameraComponent = camera:GetCameraComponent()

    if cameraComponent then
        cameraComponent:SetZoom(1)
        cameraComponent:SetSize(Vector2f(800,800))
        cameraComponent:SetRotation(0)
    end
end

function Camera:Update(dt)

end

Camera:Create()