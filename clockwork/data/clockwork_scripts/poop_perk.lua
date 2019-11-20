dofile("data/scripts/lib/utilities.lua")
dofile("data/clockwork_scripts/functions.lua");

local entity_id=GetUpdatedEntityID();
local x,y=EntityGetTransform(entity_id);
GameCreateParticle("poo",x,y+5,5,0,0,false,false);