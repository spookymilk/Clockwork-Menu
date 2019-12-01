dofile("data/scripts/lib/utilities.lua")
dofile("data/clockwork_scripts/functions.lua");

local entity_id = GetUpdatedEntityID()

kill(entity_id,"destruction_target",32);