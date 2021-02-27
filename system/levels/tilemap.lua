-- Tiles: 0(Floor), 1(Wall), 2(Ladder), #(Void)

require 'system/physics';

local tileLayer = 1;

local tilemap = {
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
};

function drawTilemap(roomIndex, developerMode)
    local floor = love.graphics.newImage('graphics/tiles/floor.png');
    local wall = love.graphics.newImage('graphics/tiles/wall.png');

    tileSize = 47;
    local tileScale = 3;

    for i = 1, #tilemap do
        for j = 1, #tilemap[i] do
            local tileIndex = tilemap[i][j];

            if tileIndex == 0 then
                local tile = {
                    x = j,
                    y = i,
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
                    scale = 1
                };

                tile.draw = function()
                    love.graphics.draw(wall, tileSize * j, tileSize * i, 0, tileScale, tileScale);
                end

                Phi.add(tile, tile.x, tile.y, 47, 47);

                renderer.renderMe(tile, tileLayer);
            end
        end
    end
end

return tileSize;
