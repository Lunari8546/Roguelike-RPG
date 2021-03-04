require 'system/levels/actors';
require 'system/levels/tilemap';

local rooms = {};

function generateRooms(roomIndex)
    local roomsAmount = love.math.random(roomIndex + 2, roomIndex + 4);

    generateRoom(roomIndex);
end

function generateRoom(roomIndex)
    local minWidth = love.math.random(roomIndex + 5, roomIndex + 7);
    local minHeight = love.math.random(roomIndex + 5, roomIndex + 7);
    local maxWidth = love.math.random(minWidth, minWidth + 3);
    local maxHeight = love.math.random(minHeight, minHeight + 3);

    local width = love.math.random(minWidth, maxWidth);
    local height = love.math.random(minHeight, maxHeight);

    local room = { width, height };
    table.insert(rooms, room);

    drawTilemap_Room(width, height);
    drawActors(roomIndex);

    drawTilemap_Corridor(0, width, height);
end
