dofile("data/scripts/lib/utilities.lua")
dofile("data/milk_scripts/functions.lua");

local entity_id = GetUpdatedEntityID();
convertField(entity_id,"destruction_target",75,"gold");