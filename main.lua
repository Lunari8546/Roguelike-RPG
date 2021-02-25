renderer = require('system/renderer'):init(2);

require 'system/levels/room';

local roomIndex = 1;

function love.load()
    font = love.graphics.newFont('graphics/pixelmix.ttf');
    love.graphics.setFont(font);
    love.graphics.setDefaultFilter('nearest', 'nearest');
end

function love.update(dt)

end

function love.draw()
    drawRoom(roomIndex);
    
    renderer.draw();
end
