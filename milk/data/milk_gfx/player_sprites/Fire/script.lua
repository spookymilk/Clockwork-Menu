dofile("data/scripts/lib/utilities.lua")
dofile("data/milk_scripts/functions.lua");

local entity_id=GetUpdatedEntityID();
local probability=math.random(1,175);

if probability==16 or probability==65 or probability==1 or probability==54 then
convertField(entity_id,"destruction_target",35,"fire"); -- is this op?
end;
if probability==4 or probability==145 or probability==87 then
convertField(entity_id,"destruction_target",55,"lava"); -- is this op?
end;