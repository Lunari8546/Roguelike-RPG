-- Tiles: 0(Floor), 1(Wall), 2(Ladder), #(Void)

require 'system/physics';

local tileLayer = 1;

function drawTilemap_Room(width, height)
    local tilemap = {};

    for i = 0, height do
        tilemap[i] = {};

        for j = 0, width do
            tilemap[i][j] = 0;
        end
    end

    for i = 0, #tilemap[0] do
        tilemap[0][i] = 1;
    end

    for i = 0, #tilemap[#tilemap] do
        tilemap[#tilemap][i] = 1;
    end

    for i = 0, #tilemap do
        tilemap[i][0] = 1;
    end

    for i = 0, #tilemap do
        tilemap[i][#tilemap[i]] = 1;
    end

    renderTilemap(tilemap);
end

function drawTilemap_Corridor(i, roomWidth, roomHeight)
    local tilemap = {};

    local position = roomWidth;
    local height = love.math.random(5, 10);

    -- renderTilemap(tilemap);
end

function renderTilemap(tilemap)
    local floor = love.graphics.newImage('graphics/tiles/floor.png');
    local wall = love.graphics.newImage('graphics/tiles/wall.png');
    local ladder = love.graphics.newImage('graphics/tiles/ladder.png');

    tileSize = 47;
    local tileScale = 3;

    for i = 0, #tilemap do
        for j = 0, #tilemap[i] do
            local tileIndex = tilemap[i][j];

            if tileIndex == 0 then
                local tile = {
                    x = tileSize * j,
                    y = tileSize * i,
                    scale = tileScale
                };

                tile.draw = function()
                    love.graphics.draw(floor, tileSize * j, tileSize * i, 0, tileScale, tileScale);
                end

                renderer.renderMe(tile, tileLayer);
            elseif tileIndex == 1 then
                local tile = {
                    x = tileSize * j,
                    y = tileSize * i,
                    scale = tileScale
                };

                tile.draw = function()
                    love.graphics.draw(wall, tileSize * j, tileSize * i, 0, tileScale, tileScale);
                end

                Phi.add(tile, tile.x, tile.y, 47, 47);

                renderer.renderMe(tile, tileLayer);
            elseif tileIndex == 2 then
                local tile = {
                    x = tileSize * j,
                    y = tileSize * i,
                    scale = tileScale
                };

                tile.draw = function()
                    love.graphics.draw(ladder, tileSize * j, tileSize * i, 0, tileScale, tileScale);
                end

                renderer.renderMe(tile, tileLayer);
            end
        end
    end
end

return tileSize;
