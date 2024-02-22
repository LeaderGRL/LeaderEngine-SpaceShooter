BulletManager = {
    instance = nil
}

function BulletManager:GetInstance()
    if not self.instance then
        self.instance = self:New()
    end
    return self.instance
end

function BulletManager:New()
    print("New BulletManager created")

    local obj = {
        bulletList = {}
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function BulletManager:AddBullet(bullet)
    table.insert(self.bulletList, bullet)
end

function BulletManager:RemoveBullet(bullet)
    for i, v in ipairs(self.bulletList) do
        if v == bullet then
            table.remove(self.bulletList, i)
            break
        end
    end
end

function BulletManager:RemoveAllBullet()
    self.bulletList = {}
end

function BulletManager:Update(dt)
    for i, v in ipairs(self.bulletList) do
        v:Update(dt)
    end
end

return BulletManager