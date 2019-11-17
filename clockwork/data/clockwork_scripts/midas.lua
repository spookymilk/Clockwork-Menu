dofile("data/scripts/lib/utilities.lua")
dofile("data/clockwork_scripts/functions.lua");

local entity_id = GetUpdatedEntityID();
convertField(entity_id,"destruction_target",55,"gold");
convertField(entity_id,"projectile",75,"gold");