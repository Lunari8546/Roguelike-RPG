require 'system/levels/actors';
require 'system/levels/tilemap';

local rooms = {};

function generateRooms(roomIndex)
    local roomsAmount = love.math.random(roomIndex + 2, roomIndex + 4);

    generateRoom(roomIndex);
end

function generateRoom(roomIndex)
    local minWidth = love.math.random(roomIndex + 5, roomIndex + 10);
    local minHeight = love.math.random(roomIndex + 5, roomIndex + 10);
    local maxWidth = love.math.random(minWidth, minWidth + 5);
    local maxHeight = love.math.random(minHeight, minHeight + 5);

    drawTilemap(minWidth, minHeight, maxWidth, maxHeight);
    drawActors(roomIndex);
end
