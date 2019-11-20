dofile("data/clockwork_scripts/functions.lua");

addPerk(perk_list,"POOP_PERK","Poop","Maybe a glass of prune juice wasn't the best idea.","data/clockwork_gfx/perks/poop.png","data/clockwork_gfx/perks/poop.png",2,nil,
function(entity_perk_item,entity_who_picked,item_name)
local poo=EntityLoad("data/clockwork_xml/script_loaders/poop_perk.xml");
EntityAddChild(entity_who_picked,poo);
end);