local bump = require 'libraries/bump/bump';

world = bump.newWorld(47);

function addPhysics(obj)
    world:add(obj, obj.x, obj.y, obj.scale, obj.scale);
end
