local bump = require 'libraries/bump/bump';

require 'system/renderer';
require 'system/physics';

require 'system/levels/tilemap';

actors = {};

local function drawPlayer()
    local player = love.graphics.newImage('graphics/actors/player.png');
    local playerFlipped = love.graphics.newImage('graphics/actors/player_flipped.png');

    table.insert(actors, {
        type = 'player',
        sprite = playerFlipped,
        x = 2,
        y = 2,
        scale = 3,
        layer = 2,
        vel = {x = 1, y = 1}
    });
end

function drawActors(roomIndex, developerMode)
    drawPlayer();

    if roomIndex == 1 then
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

            addPhysics(actor);

            renderer.renderMe(actor);
        end
    end
end

function playerControls(world, dt)
    for i = 1, #actors do
        if actors[i].type == 'player' then
            if love.keyboard.isDown('up') then
                actors[i].vel.y = -6;
            elseif love.keyboard.isDown('down') then
                actors[i].vel.y = 6;
            else
                actors[i].vel.y = 0;
            end

            if love.keyboard.isDown('left') then
                actors[i].vel.x = -6;
            elseif love.keyboard.isDown('right') then
                actors[i].vel.x = 6;
            else
                actors[i].vel.x = 0;
            end

            if love.keyboard.isDown('q') then

            end

            if love.keyboard.isDown('w') then

            end

            if love.keyboard.isDown('e') then

            end

            if love.keyboard.isDown('r') then

            end

            local futureX = actors[i].x + (actors[i].vel.x * dt);
            local futureY = actors[i].y + (actors[i].vel.y * dt);

            local nextX, nextY, cols, len = world:move(actors[i], futureX, futureY);

            actors[i].x = nextX;
            actors[i].y = nextY;
        end
    end
end

return actors;
