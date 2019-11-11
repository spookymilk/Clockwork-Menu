dofile("data/scripts/lib/utilities.lua")
dofile("data/milk_scripts/functions.lua");

local entity_id=GetUpdatedEntityID();
local x,y=EntityGetTransform(entity_id);

local itemsToLoad={"data/milk_gfx/player_sprites/Fire/items/potion_fire.xml","data/milk_gfx/player_sprites/Fire/items/fire.xml"};
for _,c in pairs(itemsToLoad) do
EntityLoad(c,x,y-8);
end;
