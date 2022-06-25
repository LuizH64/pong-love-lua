AI = {}

function AI:load()
    self.width = 20
    self.height = 100
    self.yVel = 0
    self.speed = 500
    self.x = love.graphics.getWidth() - 50
    self.y = love.graphics.getHeight() / 2 - (self.height / 2)

    self.timer = 0
    self.rate = 0.2
end

function AI:update(dt)
    AI:move(dt)
    self.timer = self.timer + dt

    if (self.timer > self.rate) then
        self.timer = 0
        AI:acquireTarget()
    end
end

function AI:move(dt)
    self.y = self.y + self.yVel * dt
end

function AI:acquireTarget()
    if (Ball.y + Ball.height < self.y) then
        self.yVel = -self.speed
        return
    end

    if (Ball.y > Ball.height + self.y) then
        self.yVel = self.speed
        return
    end

    self.yVel = 0
end

function AI:draw()
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
end
