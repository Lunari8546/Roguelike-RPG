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

function drawActors(roomIndex)
    drawPlayer();

    if roomIndex == 1 then
        for _, actor in ipairs(actors) do
            actor.draw = function()
                love.graphics.draw (
                    actor.sprite,
                    actor.x,
                    actor.y,
                    0,
                    actor.scale,
                    actor.scale
                );
            end

            Phi.add(actor, actor.x * 47, actor.y * 47, 47, 47);

            renderer.renderMe(actor);
        end
    end
end

function playerControls(dt)
    for i = 1, #actors do
        if actors[i].type == 'player' then
            local targetX = actors[i].pos.x + (actors[i].vel.x * dt);
            local targetY = actors[i].pos.y + (actors[i].vel.y * dt);

            if love.keyboard.isDown('up') then
                actors[i].vel.y = -280;
            elseif love.keyboard.isDown('down') then
                actors[i].vel.y = 280;
            else
                actors[i].vel.y = 0;
            end

            if love.keyboard.isDown('left') then
                actors[i].vel.x = -280;
            elseif love.keyboard.isDown('right') then
                actors[i].vel.x = 280;
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

            local nextX, nextY, cols, len = Phi.move(actors[i], futureX, futureY, true);
            actors[i].x = nextX;
            actors[i].y = nextY;
        end
    end
end

return actors;
