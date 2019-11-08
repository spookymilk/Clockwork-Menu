dofile("data/scripts/lib/utilities.lua")
dofile("data/milk_scripts/functions.lua");

local entity_id=GetUpdatedEntityID();
local x,y=EntityGetTransform(entity);

attackCore(entity_id,"destruction_target",100,6,"data/milk_edited/call_of_cthulhu.xml"); -- oh dark one..
local xRandom=math.random(-25,25);
local yRandom=math.random(-25,25);
local probability=math.random(1,150);

if probability==10 or probability==5 then
attackRaw(entity_id,0,0,xRandom,yRandom,"data/milk_edited/call_of_cthulhu.xml"); -- add the sense of life
GameScreenshake(10,x,y); -- slight fabric of reality tearing..
end;