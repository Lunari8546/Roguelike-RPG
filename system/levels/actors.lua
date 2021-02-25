require 'system/renderer';

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
        moveSpeed = 0.1
    });
end

function drawActors(roomIndex, world)
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

            renderer.renderMe(actor);
        end
    end
end

function playerMovement()
    for i = 1, #actors do
        if actors[i].type == 'player' then
            if love.keyboard.isDown('w') then
                actors[i].y = actors[i].y - actors[i].moveSpeed;
            elseif love.keyboard.isDown('a') then
                actors[i].x = actors[i].x - actors[i].moveSpeed;
            elseif love.keyboard.isDown('s') then
                actors[i].y = actors[i].y + actors[i].moveSpeed;
            elseif love.keyboard.isDown('d') then
                actors[i].x = actors[i].x + actors[i].moveSpeed;
            end
        end
    end
end

return drawActors(roomIndex), playerMovement(), actors;
