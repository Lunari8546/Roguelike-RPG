require 'system/renderer';

require 'system/levels/tilemap';

local actors = {};

local function drawPlayer()
    local player = love.graphics.newImage('graphics/actors/player.png');

    table.insert(actors, {
        type = 'player',
        sprite = player,
        x = 2,
        y = 2,
        scale = 3,
        layer = 2
    });
end

local function playerMovement()
    for i = 1, #actors do
        if actors[i].type == 'player' then
            if love.keyboard.isDown('w') then
                love.graphics.print('w');
            end

            if love.keyboard.isDown('a') then
                love.graphics.print('a');
            end

            if love.keyboard.isDown('s') then
                love.graphics.print('s');
            end

            if love.keyboard.isDown('d') then
                love.graphics.print('d');
            end
        end
    end
end

function drawActors()
    drawPlayer();

    for _, actor in ipairs(actors) do
        actor.draw = function()
            love.graphics.draw (
                actor.sprite,
                actor.x * tileSize,
                actor.y * tileSize,
                0,
                actor.scale,
                actor.scale
            );
        end

        renderer.renderMe(actor);
    end

    playerMovement();
end

return drawActors();
