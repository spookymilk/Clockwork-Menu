dofile("data/scripts/lib/utilities.lua")
dofile("data/clockwork_scripts/functions.lua");

local x,y=localplayerPos();
GameCreateParticle("poo",x-2,y+3,5,0,100,false,false);