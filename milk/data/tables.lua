dofile("data/functions.lua");
TABLE_ONE={"<-- Go Back","Base Tablet","Tablet 00","Tablet 01","Tablet 02","Tablet 03","Tablet 04","Tablet 05","Tablet 06","Tablet 07","Tablet 08","Tablet 09","Tablet 10","Tablet 11","Tablet 12","Tablet Corpse","Tablet Tree"};
TABLE_TWO={"<-- Go Back","Chest","Chest Rare","Egg: Fire","Egg: Monster","Egg: Red", "Egg: Slime","Egg: Worm","Gold Nugget","Thunderstone","Beer Bottle","Big Rock","Ladder","Burning Barrel","Oil Barrel",
"Radioactive Barrel","Long Vase","Explosives","Box","Small Box","Bucket","Small Lantern","Cart","Chair","Crate","Gem","Lantern","Minecart","Propane Tank","Pressure Tank","Sandbag","Skateboard","Skull","Bone",
"Table","Vase","Wheel","Sea of Water","Sea of Lava","Sea of Oil","Sea of Acid","Sea of Toxic Sludge","Sea of Slime","Sea of Alcohol","Sea of Gold","Bomb","Holy Bomb","TNT","Cluster Bomb","Small Bomb","Nuke (DANGEROUS)","Blue Firework","Green Firework","Orange Firework","Pink Firework","Pile of Gunpowder",
"Acid Trap","Electricity Trap","Ignition Trap #1","Ignition Trap #2","Seamine","Chandelier","Brewing Stand"};
TABLE_MONSTERS_FRIENDLY={"<-- Go Back","Acidshooter","Alchemist","Ant","Assassin","Barfer","Bat","Bigbat","Bigfirebug",
"Bigzombie","Blob","Bloodcrystal_physics","Bloom","Boss_dragon","Chest_mimic","Crystal_physics","Darkghost","Deer","Drone","Duck","Eel","Firebug",
"Firemage","Firemage_weak","Fireskull","Fireskull_weak","Fish","Fish_large","Flamer","Fly","Frog","Fungus",
"Fungus_big","Gazer","Ghost","Ghoul","Giant","Giantshooter","Giantshooter_weak","Icer","Iceskull","Lasershooter",
"Longleg","Lurker","Maggot","Miner","Miner_fire","Miner_santa","Miner_weak","Miniblob","Missilecrab","Necromancer","Necromancer_shop",
"Phantom_a","Phantom_b","Playerghost","Rat","Roboguard","Scavenger_clusterbomb","Scavenger_grenade","Scavenger_heal","Scavenger_leader",
"Scavenger_mine","Scavenger_poison","Scavenger_smg","Scorpion","Sheep","Sheep_bat","Sheep_fly","Shooterflower",
"Shotgunner","Shotgunner_weak","Skullfly","Skullrat","Skycrystal_physics","Slimeshooter","Slimeshooter_nontoxic","Slimeshooter_weak",
"Sniper","Spitmonster","Tank","Tank_rocket","Tank_super","Tentacler","Tentacler_small","Thundermage","Turret_left",
"Turret_right","Wand_ghost","Wizard_dark","Wizard_poly","Wizard_tele","Wolf","Worm","Worm_big","Worm_end",
"Worm_skull","Worm_tiny","Wraith","Wraith_glowing","Wraith_storm","Zombie","Zombie_weak"};
TABLE_MONSTERS_ENEMY={"<-- Go Back","Acidshooter","Alchemist","Ant","Assassin","Barfer","Bat","Bigbat","Bigfirebug",
"Bigzombie","Blob","Bloodcrystal_physics","Bloom","Boss_dragon","Chest_mimic","Crystal_physics","Darkghost","Deer","Drone","Duck","Eel","Firebug",
"Firemage","Firemage_weak","Fireskull","Fireskull_weak","Fish","Fish_large","Flamer","Fly","Frog","Fungus",
"Fungus_big","Gazer","Ghost","Ghoul","Giant","Giantshooter","Giantshooter_weak","Icer","Iceskull","Lasershooter",
"Longleg","Lurker","Maggot","Miner","Miner_fire","Miner_santa","Miner_weak","Miniblob","Missilecrab","Necromancer","Necromancer_shop",
"Phantom_a","Phantom_b","Playerghost","Rat","Roboguard","Scavenger_clusterbomb","Scavenger_grenade","Scavenger_heal","Scavenger_leader",
"Scavenger_mine","Scavenger_poison","Scavenger_smg","Scorpion","Sheep","Sheep_bat","Sheep_fly","Shooterflower",
"Shotgunner","Shotgunner_weak","Skullfly","Skullrat","Skycrystal_physics","Slimeshooter","Slimeshooter_nontoxic","Slimeshooter_weak",
"Sniper","Spitmonster","Tank","Tank_rocket","Tank_super","Tentacler","Tentacler_small","Thundermage","Turret_left",
"Turret_right","Wand_ghost","Wizard_dark","Wizard_poly","Wizard_tele","Wolf","Worm","Worm_big","Worm_end",
"Worm_skull","Worm_tiny","Wraith","Wraith_glowing","Wraith_storm","Zombie","Zombie_weak"};
TABLE_TELEPORT={"<-- Go Back","Spawn","Pyramid","The Boss","Tree","Statue","Lake","Shrine","Pond","Skull","E.S.A","Lava",
"Holy Mountain #1","Holy Mountain #2","Holy Mountain #3","Holy Mountain #4","Holy Mountain #5","The End","The Moon","The Underworld","Bottom of the Lake","Dragon Cave","East Parrallel","West Parrallel","Random Location","Earth Essence","Water Essence","Fire Essence","Spirit Essence","Gold Stash #1","Gold Stash #2",
"Gold Stash #3","1,000,000 Below","1,000,000 Above","The Tower","Cloudscape/Air Essence"};
TABLE_PHRASE={"Got Milk?"};
TABLE_ALC={"<-- Go Back","Acid","Alcohol","Blood","Blood_fungi","Blood_worm","Bone","Brass","Cement","Coal","Copper","Creepy_liquid","Diamond","Fungi","Fungi_creeping","Gold","Grass","Gunpowder","Gunpowder_explosive","Honey","Lava","Magic_liquid","Magic_liquid_berserk","Magic_liquid_charm","Magic_liquid_invisibility","Magic_liquid_polymorph","Magic_liquid_random_polymorph","Magic_liquid_teleportation","Midas","Midas_precursor","Mud","Oil","Poison","Purifying_powder","Radioactive_liquid","Rotten_meat","Salt","Sand","Silver","Slime","Snow","Sodium","Soil","Swamp","Urine","Void_liquid","Water","Water_ice","Water_swamp","Wax"};
TABLE_TIME={"1","2","3","4","5","6","7","8","9","0"};
TABLE_PLAYERSPRITES={"<-- Go Back","Default","Eldritch","Fire","Milky","Santa","Unknown","Urine"}
TABLE_GUYS={"water","water_ice","water_swamp","oil","alcohol","swamp","mud","blood","blood_fungi","blood_worm","radioactive_liquid","cement","acid","lava","urine","poison","magic_liquid_teleportation","magic_liquid_polymorph","magic_liquid_random_polymorph","magic_liquid_berserk","magic_liquid_charm","magic_liquid_invisibility"};
TABLE_GUYSTWO={"sand","bone","soil","honey","slime","snow","rotten_meat","wax","gold","silver","copper","brass","diamond","coal","gunpowder","gunpowder_explosive","grass","fungi"};
TABLE_ALLMATERIALS={};

getAllMaterial(CellFactory_GetAllLiquids(),TABLE_ALLMATERIALS);
getAllMaterial(CellFactory_GetAllSands(),TABLE_ALLMATERIALS);
getAllMaterial(CellFactory_GetAllGases(),TABLE_ALLMATERIALS);
getAllMaterial(CellFactory_GetAllSolids(),TABLE_ALLMATERIALS);
getAllMaterial(CellFactory_GetAllFires(),TABLE_ALLMATERIALS);
aToZ(TABLE_ALLMATERIALS); -- ocd fixes where possible without overhauling everything :)
cap(TABLE_ALLMATERIALS);
aToZ(TABLE_MONSTERS_ENEMY);
aToZ(TABLE_MONSTERS_FRIENDLY);