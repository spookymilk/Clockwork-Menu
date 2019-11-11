dofile("data/scripts/lib/utilities.lua")
dofile("data/milk_scripts/functions.lua");

local entity_id=GetUpdatedEntityID();
local x,y=EntityGetTransform(entity_id);
local probability=math.random(1,100);

addFeet(entity_id,8);

local itemsToLoad={"data/milk_gfx/player_sprites/Eldritch/items/potion_teleport.xml","data/milk_gfx/player_sprites/Eldritch/items/eldritch.xml"};
for _,c in pairs(itemsToLoad) do
EntityLoad(c,x,y-8);
end;

