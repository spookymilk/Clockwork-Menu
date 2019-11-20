dofile("data/scripts/lib/utilities.lua")
dofile("data/clockwork_scripts/functions.lua");

local entity_id=GetUpdatedEntityID();
local x,y=EntityGetTransform(entity_id);
GameCreateParticle("poo",x-2,y+3,5,0,100,false,false);