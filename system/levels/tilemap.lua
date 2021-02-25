-- Tiles: 0(Floor), 1(Wall)

local tileLayer = 1;

local menuTilemap = {
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1},
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1}
}

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

function drawTilemap(roomIndex)
    local floor = love.graphics.newImage('graphics/tiles/floor.png');
    local wall = love.graphics.newImage('graphics/tiles/wall.png');

    tileSize = 47;
    local tileScale = 3;

    if roomIndex == 0 then
        for i = 1, #menuTilemap do
            for j = 1, #menuTilemap[i] do
                local tileIndex = menuTilemap[i][j];

                if tileIndex == 0 then
                    local tile = {
                        draw = function()
                            love.graphics.draw(floor, tileSize * j, tileSize * i, 0, tileScale, tileScale);
                        end
                    };

                    renderer.renderMe(tile, tileLayer);
                elseif tileIndex == 1 then
                    local tile = {
                        draw = function()
                            love.graphics.draw(floor, tileSize * j, tileSize * i, 0, tileScale, tileScale);
                        end
                    };

                    renderer.renderMe(tile, tileLayer);
                end
            end
        end
    else
        for i = 1, #tilemap do
            for j = 1, #tilemap[i] do
                local tileIndex = tilemap[i][j];

                if tileIndex == 0 then
                    love.graphics.draw(floor, tileSize * j, tileSize * i, 0, tileScale, tileScale);
                elseif tileIndex == 1 then
                    love.graphics.draw(wall, tileSize * j, tileSize * i, 0, tileScale, tileScale);
                end
            end
        end
    end
end

return drawTilemap(), tileSize;
