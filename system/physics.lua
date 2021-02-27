-- Coded by 'Ben, who's'.

local bump = require 'libraries/bump/bump';
Phi = {layer = 2, debug = true};

Phi.world = bump.newWorld();
Phi.color = {1, 1, 1, 1};
Phi.objs = {};
Phi.idblacklist = {420};

function Phi.add(obj, x, y, w, h)
    if w then
        obj.pos = {x = x, y = y};
        obj.size = {x = w, y = h};
    end

    Phi.world:add(obj, obj.pos.x, obj.pos.y, obj.size.x, obj.size.y);

    table.insert(Phi.objs, obj);
end

function Phi.kill(obj)
    for i = 1 ,#Phi.objs do
        if Phi.objs[i].pos == obj.pos then
            table.remove(Phi.objs, i);
            Phi.world:remove(obj);
        end
    end
end

function Phi.move(obj,targetX,targetY,set)
    local nextX, nextY, cols, len = Phi.world:move(obj, targetX, targetY);

    if set == true then obj.pos = {x = nextX, y = nextY} end
    return nextX,nextY,cols;
end

function Phi.change_debug()
    if love.keyboard.isDown("tab") then
       Phi.debug = true;
    else
       Phi.debug = false;
    end
end

function Phi.get_id()
    for i = 1, #Phi.idblacklist do
        local id =  math.random(1, 9999);

		if id ~= Phi.idblacklist[i] then
			table.insert(Phi.idblacklist, id);
			return id;
		else
				Phi.get_id();
		end
	end
end

function Phi.draw()
    if Phi.debug == true then
        love.graphics.setColor(unpack(Phi.color));

        for i, obj in ipairs(Phi.objs) do
            love.graphics.rectangle("line", obj.pos.x, obj.pos.y, obj.size.x or 32, obj.size.y or 32);
        end

        love.graphics.setColor(1, 1, 1, 1);
    end
end

Phi.id = renderer.renderMe(Phi);
return Phi;
