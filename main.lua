local moonshine = require 'libraries/moonshine';

renderer = require('system/renderer'):init(2);
require 'system/physics';

require 'system/levels/room';
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

    drawRoom(roomIndex);
end

function love.update(dt)
    playerControls(dt);

    Phi.change_debug();
end

function love.draw()
    local fps = love.timer.getFPS();

    effect(function()
        love.graphics.print('FPS: '..tostring(fps));
        love.graphics.print('Level: '..tostring(roomIndex), 100);

        renderer.draw();
    end)
end
