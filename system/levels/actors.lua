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
    for _, actor in ipairs(actors) do
        if actor.type == 'player' then
            local targetX = actor.pos.x + (actor.vel.x * dt);
            local targetY = actor.pos.y + (actor.vel.y * dt);

            if love.keyboard.isDown('up') then
                actor.vel.y = -280;
            elseif love.keyboard.isDown('down') then
                actor.vel.y = 280;
            else
                actor.vel.y = 0;
            end

            if love.keyboard.isDown('left') then
                actor.vel.x = -280;
            elseif love.keyboard.isDown('right') then
                actor.vel.x = 280;
            else
                actor.vel.x = 0;
            end

            if love.keyboard.isDown('q') then

            end

            if love.keyboard.isDown('w') then

            end

            if love.keyboard.isDown('e') then

            end

            if love.keyboard.isDown('r') then

            end

            local futureX = actor.x + (actor.vel.x * dt);
            local futureY = actor.y + (actor.vel.y * dt);

            local nextX, nextY, cols, len = Phi.move(actor, futureX, futureY, true);
            actor.x = nextX;
            actor.y = nextY;
        end
    end
end

return actors;
