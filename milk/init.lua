-- this code runs when all mods' filesystems are registered

function OnPlayerSpawned( player_entity )
EntityLoad("data/milk.xml");
end;
--ModMagicNumbersFileAdd( "mods/example/files/magic_numbers.xml" ) -- will override some magic numbers using the specified file
print("Example mod init done")
