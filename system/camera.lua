local Camera = {}

Camera.x = 0
Camera.y = 0
Camera.scaleX = 1
Camera.scaleY = 1
Camera.rotation = 0

function Camera.set()
  love.graphics.push()
  love.graphics.rotate(-Camera.rotation)
  love.graphics.scale(1 / Camera.scaleX, 1 / Camera.scaleY)
  love.graphics.translate(-Camera.x, -Camera.y)
end

function Camera.unset()
  love.graphics.pop()
end

function Camera.move(dx, dy)
  Camera.x = Camera.x + (dx or 0)
  Camera.y = Camera.y + (dy or 0)
end

function Camera.rotate(dr)
  Camera.rotation = Camera.rotation + dr
end


function Camera.edgepan(dt,use_mouse)
local use_mouse = use_mouse or false
local mouseX, mouseY = love.mouse.getPosition()
local speed = 100
if love.keyboard.isDown("lshift") then speed = speed * 10 end
local windowWidth = love.graphics.getWidth()
local windowHeight = love.graphics.getHeight()
if not use_mouse then
    if  love.keyboard.isDown("s") then
       Camera.y = Camera.y + speed * dt
    elseif  love.keyboard.isDown("w") then
         Camera.y = Camera.y - speed * dt end
    if love.keyboard.isDown("d") then
        Camera.x = Camera.x + speed * dt
    elseif love.keyboard.isDown("a") then
         Camera.x = Camera.x - speed * dt
    end
else
if mouseY >= windowHeight *0.9  then
       Camera.y = Camera.y + speed * dt
    elseif mouseY <= windowHeight *0.1 then
         Camera.y = Camera.y - speed * dt end
    if mouseX >= windowWidth *0.9 then
        Camera.x = Camera.x + speed * dt
    elseif mouseX <= windowWidth *0.1 then
         Camera.x = Camera.x - speed * dt end
    end
end

return Camera
