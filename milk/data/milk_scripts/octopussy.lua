dofile("data/scripts/lib/utilities.lua")
dofile("data/milk_scripts/functions.lua");

local entity_id=GetUpdatedEntityID();

attackNear(entity_id,"destruction_target",65,10,"data/entities/projectiles/tentacle.xml"); -- this is a curse.