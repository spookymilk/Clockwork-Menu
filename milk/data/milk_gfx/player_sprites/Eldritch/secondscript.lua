dofile("data/scripts/lib/utilities.lua")
dofile("data/milk_scripts/functions.lua");

local entity_id=GetUpdatedEntityID();
local probability=math.random(1,150);


if probability==15 or probability==8 or probability==9 or probability==99 then
attackCore(entity_id,"destruction_target",65,2,"data/milk_edited/call_of_cthulhu.xml");
end;
