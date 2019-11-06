dofile("data/scripts/lib/utilities.lua")
dofile("data/milk_scripts/functions.lua");

local entity_id = GetUpdatedEntityID()

attract(entity_id,"item_physics",250,45,45);
attract(entity_id,"mortal",250,45,45);
--attract(entity_id,"helpless_animal",250,45,45);
attract(entity_id,"teleportable_NOT",250,45,45);