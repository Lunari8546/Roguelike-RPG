local moonshine = require 'libraries/moonshine';

renderer = require('system/renderer'):init(3);
require 'system/physics';

require 'system/levels/rooms';
require 'system/levels/actors';

local roomIndex = 1;

function love.load()
    font = love.graphics.newFont('graphics/pixelmix.ttf');
    love.graphics.setFont(font);
    love.graphics.setDefaultFilter('nearest', 'nearest');

    effect = moonshine(moonshine.effects.filmgrain)
        .chain(moonshine.effects.vignette)
        .chain(moonshine.effects.chromasep);

    effect.filmgrain.size = 7;
    effect.vignette.radius = 0.98;
    effect.chromasep.radius = 1.6;

    local ui = {
        draw = function()
            love.graphics.print('FPS: '..tostring(fps));
            love.graphics.print('Level: '..tostring(roomIndex), 100);
        end
    };

    renderer.renderMe(ui, 3);

    generateRooms(roomIndex);
end

function love.update(dt)
    fps = love.timer.getFPS();

    playerControls(dt);

    Phi.change_debug();
end

function love.draw()
    effect(function()
        renderer.draw();
    end)
end
