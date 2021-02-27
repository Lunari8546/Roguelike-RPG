require 'system/levels/actors';
require 'system/levels/tilemap';

developerMode = false;

function drawRoom(roomIndex)
    drawActors(roomIndex, developerMode);
    drawTilemap(roomIndex, developerMode);
end
