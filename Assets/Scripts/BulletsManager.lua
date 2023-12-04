local BulletManager = {
    instance = nil
}

function BulletManager:getInstance()
    if not self.instance then
        self.instance = self:new()
    end
    return self.instance
end

function BulletManager:new()
    local obj = {
        bulletList = {}
    }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function BulletManager:addBullet(bullet)
    table.insert(self.bulletList, bullet)
end

function BulletManager:removeBullet(bullet)
    for i, v in ipairs(self.bulletList) do
        if v == bullet then
            table.remove(self.bulletList, i)
            break
        end
    end
end

function BulletManager:removeAllBullet()
    self.bulletList = {}
end

function BulletManager:update(dt)
    for i, v in ipairs(self.bulletList) do
        v:update(dt)
    end
end