require 'system/levels/actors';
require 'system/levels/tilemap';

function drawRoom(roomIndex)
    drawActors(roomIndex);
    drawTilemap(roomIndex);
end

return drawRoom(roomIndex);
