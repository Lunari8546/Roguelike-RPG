-- Coded by 'Ben, who's'.

local Renderer = {};

local insert = table.insert;
local remove = table.remove;

function Renderer:init(numLayers)
    local renderer = {};

    renderer.drawers = {};

    for i = 0, numLayers do
        renderer.drawers[i] = {};
    end

    renderer.renderMe = function(thing, layer)
        local l = thing.layer or layer;

        insert(renderer.drawers[l], thing);
    end

    renderer.destroyMe = function(thing,layer)
        local l = thing.layer or layer;

        remove(renderer.drawers, l);
    end

    renderer.draw = function()
        for layer = 1, #renderer.drawers do
            for draw = 1, #renderer.drawers[layer] do
                local thing = renderer.drawers[layer][draw];

                if thing ~= nil then
                    thing:draw();
                end
            end
        end
    end

    return renderer;
end

return Renderer;
