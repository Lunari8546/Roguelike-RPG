require 'system/levels/actors';
require 'system/levels/tilemap';
require 'system/levels/menu';

function drawRoom(roomIndex)
    if roomIndex ~= 0 then
        drawActors();
    else
        drawMenu('start');
    end

    drawTilemap(roomIndex);
end

return drawRoom(roomIndex);
