function OnPlayerSpawned(player_entity)
EntityLoad("data/clockwork_xml/script_loaders/clockwork.xml");
end;

print("Clockwork started.");
ModMagicNumbersFileAdd("data/clockwork_xml/entities/magic_numbers.xml")
ModLuaFileAppend("data/scripts/gun/gun_actions.lua","data/clockwork_scripts/customactions.lua");
ModLuaFileAppend("data/scripts/perks/perk_list.lua","data/clockwork_scripts/customperks.lua");