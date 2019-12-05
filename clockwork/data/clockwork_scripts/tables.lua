dofile("data/clockwork_scripts/functions.lua");
dofile("data/clockwork_scripts/constants.lua");

materials={};
customobjects={ -- add custom props and such here
{path="data/clockwork_gfx/items/",filename="physics_bog",name="Barrel of Gold"},
{path="data/clockwork_gfx/items/",filename="physics_septic",name="Septic Tank"},
{path="data/clockwork_gfx/items/",filename="physics_magic_stone",name="Magic Stone"},
{path="data/clockwork_gfx/items/",filename="physics_3up",name="3-Up Moon"},
{path="data/clockwork_gfx/items/",filename="firestone",name="Firestone"},
{path="data/clockwork_gfx/items/",filename="pumpkin_natural",name="Pumpkin"},
{path="data/clockwork_gfx/items/",filename="pumpkin_noglow",name="Carved Pumpkin"},
{path="data/clockwork_gfx/items/",filename="pumpkin_glowing",name="Jack O'Lantern"},
{path="data/clockwork_gfx/items/",filename="pumpkin_cursed",name="Cursed Pumpkin"},
};
customanimal={ -- add custom animals
{path="data/clockwork_gfx/animals/",filename="pbjt",name="Dancing Bananna"},
};
customspells={ -- add custom spells
{name="Page XVI",spellname="PAGE_XVI"},
{name="Page DCCLVI",spellname="PAGE_DCCLVI"},
{name="Page MXXXII",spellname="PAGE_MXXXII"},
{name="Time Stone",spellname="TIME_STONE"},
{name="Power Stone",spellname="POWER_STONE"},
{name="Soul Stone",spellname="SOUL_STONE"},
{name="Reality Stone",spellname="REALITY_STONE"},
{name="Mind Stone",spellname="MIND_STONE"},
};
weapons={ -- add custom wands, weapons, etc.
{path="data/clockwork_gfx/wands/necronomicon/",isweapon=true,filename="necronomicon",name="Necronomicon"},
{path="data/clockwork_gfx/wands/infinity_gauntlet/",isweapon=true,filename="infinity_gauntlet",name="Infinity Gauntlet"},
};
customperks={ -- add custom perks
{name="Poop",perkname="POOP_PERK"};
};
locations={
{name="Spawn",x=225.8,y=-143.3},
{name="Pyramid",x=8795.9,y=-171.6},
{name="Tree",x=-1546.4,y=-1309.3},
{name="Island",x=-13942.7,y=158.3},
{name="Lake",x=-12718.9,y=176.1},
{name="Shrine",x=788.5,y=-1150.0},
{name="Pond",x=2824.7,y=118.0},
{name="Skull",x=7412.0,y=-61.0},
{name="Lava",x=2380.8,y=804.0},
{name="E.S.A",x=-1592.0,y=-815.9},
{name="End",x=6405.3,y=15111.0}, 
{name="Moon",x=261,y=-26129},
{name="Underworld",x=175.4,y=15275.0},
{name="Dragon Cave",x=2355.3,y=7364.9}, 
{name="East Parrallel",x=20077.5,y=136.5},
{name="West Parrallel",x=-20096.7,y=-72.6},
{name="Gold Stash #1",x=15138.5,y=-3435.6},
{name="Gold Stash #2",x=-14078,y=16515},
{name="Holy Mountain #1",x=1246.4,y=1071.2},
{name="Holy Mountain #2",x=1239.2,y=2577.8},
{name="Holy Mountain #3",x=2259.9,y=4638.8},
{name="Holy Mountain #4",x=1238.2,y=6203.0},
{name="Holy Mountain #5",x=721.2,y=8202.1},
{name="Holy Mountain #6",x=221.4,y=10283.6},
{name="Holy Mountain #7",x=218.5,y=12828.0},
{name="Tower",x=9742.0,y=9144.0},
{name="Cloudscape",x=-14963.5,y=-4536.8},
{name="1,000,000 Above",x=0,y=-1000000},
{name="1,000,000 Below",x=0,y=1000000},
};
times={
{name="Scary Hours",timeofday=0.7},
{name="Morning",timeofday=0.9},
{name="Afternoon",timeofday=0.1},
{name="Golden Hour",timeofday=0.3},
{name="Evening",timeofday=0.47752},
{name="Night",timeofday=0.55356},
};
script={
{path="data/clockwork_xml/script_loaders/",filename="magnet",name="Magnet",key="XMAN_MOVIES_SUCK_LOWKEY",toggled=false,cantoggle=true,isspecial=false;},
{path="data/clockwork_xml/entities/",filename="midasfield",name="Midas Field",key="DIE_GOLD_DIE",toggled=false,cantoggle=true,isspecial=false;},
{path="data/clockwork_xml/entities/",filename="blackholefield",name="Blackhole Field",key="HUGE_BLACKHOLE_THING",toggled=false,cantoggle=true,isspecial=false;},
{path="data/clockwork_xml/entities/",filename="instantkillfield",name="Kill Field",key="THIS_WONT_KILL_YOU",toggled=false,cantoggle=true,isspecial=false;},
{path=nil,filename=nil,name="Telekinesis",key=nil,specialOn=function()send("Please read controls.txt located inside mods/clockwork/ for better use!"); tel=true;end,specialOff=function()tel=false;end,toggled=false,cantoggle=true,isspecial=true;},
};
playerset={
{path="data/clockwork_xml/entities/",filename="protectionall",name="Godmode",execOn=nil,execOff=nil,key="CLOCKWORK_GODMODE",toggled=false,isxmlbased=true,cantoggle=true;},
{path=nil,filename=nil,name="Unlimited Jetpack",execOn=function()editCIP("CharacterDataComponent","flying_needs_recharge",0);end,execOff=function()editCIP("CharacterDataComponent","flying_needs_recharge",1);end,key=nil,toggled=false,isxmlbased=false,cantoggle=true;},
{path=nil,filename=nil,name="Faster",execOn=function()local velmin=0-math.abs(219.48);editMIP("CharacterPlatformingComponent","velocity_min_x",tostring(velmin));editMIP("CharacterPlatformingComponent","velocity_max_x",219.48);editMIP("CharacterPlatformingComponent","run_velocity",490);end,execOff=function()local velmin=0-math.abs(65);editMIP("CharacterPlatformingComponent","velocity_min_x",tostring(velmin));editMIP("CharacterPlatformingComponent","velocity_max_x",65);editMIP("CharacterPlatformingComponent","run_velocity",192.5);end,key=nil,toggled=false,isxmlbased=false,cantoggle=true;},
{path=nil,filename=nil,name="Faster Jetpack",execOn=function()editCIP("CharacterPlatformingComponent","fly_speed_max_up",750);end,execOff=function()editCIP("CharacterPlatformingComponent","fly_speed_max_up",100);end,key=nil,toggled=false,isxmlbased=false,cantoggle=true;},
{path=nil,filename=nil,name="Breathless",execOn=function()editCIP("DamageModelComponent","air_needed",0);end,execOff=function()editCIP("DamageModelComponent","air_needed",1);end,key=nil,toggled=false,isxmlbased=false,cantoggle=true;},
{path=nil,filename=nil,name="Infinite Gold",execOn=function()infgold=true;end,execOff=function()infgold=false;editCIP("WalletComponent","money",10);end,key=nil,toggled=false,isxmlbased=false,cantoggle=true;}, -- thanks remmie, this should fix the negative problem
{path=nil,filename=nil,name="Mega Inventory",execOn=function()editCIP("Inventory2Component","full_inventory_slots_y",15);end,execOff=function()editCIP("Inventory2Component","full_inventory_slots_y",1);end,key=nil,toggled=false,isxmlbased=false,cantoggle=true;},
{path=nil,filename=nil,name="High",execOn=function()editCIP("DrugEffectComponent","hallucinogen_amount",1);end,execOff=function()editCIP("DrugEffectComponent","hallucinogen_amount",0);end,key=nil,toggled=false,isxmlbased=false,cantoggle=true;},
{path="data/clockwork_xml/entities/",filename="drunk",name="Drunk",execOn=nil,execOff=nil,key="DRINKING_IS_BAD",toggled=false,isxmlbased=true,cantoggle=true;},
{path=nil,filename=nil,name="Freecam",execOn=function()GameSetCameraFree(true);end,execOff=function()GameSetCameraFree(false);end,key=nil,toggled=false,isxmlbased=false,cantoggle=true;},
{path=nil,filename=nil,name="Heavy Feet",execOn=function()editCIP("CharacterDataComponent","destroy_ground",1000);end,execOff=function()editCIP("CharacterDataComponent","destroy_ground",0);end,key=nil,toggled=false,isxmlbased=false,cantoggle=true;},
{path=nil,filename=nil,name="Spartan Kick",execOn=function()editMIP("KickComponent","max_force",500);editMIP("KickComponent","player_kickforce",500);editMIP("KickComponent","kick_damage",500);editMIP("KickComponent","kick_knockback",750);end,execOff=function()editMIP("KickComponent","max_force",18);editMIP("KickComponent","player_kickforce",14.8);editMIP("KickComponent","kick_damage",0.04);editMIP("KickComponent","kick_knockback",10);end,key=nil,toggled=false,isxmlbased=false,cantoggle=true;},
{path="data/clockwork_xml/entities/",filename="fullbright",name="Fullbright",execOn=nil,execOff=nil,key="FULLBRIGHT_MAYBE",toggled=false,isxmlbased=true,cantoggle=true;},
{path=nil,filename=nil,name="Noclip",execOn=function()noclip=true;end,execOff=function()noclip=false;end,key=nil,toggled=false,isxmlbased=false,cantoggle=true;},
{path=nil,filename=nil,name="Mouseclip",execOn=function()mousehook=true;end,execOff=function()mousehook=false;end,key=nil,toggled=false,isxmlbased=false,cantoggle=true;},
};
weath={
{name="Rain",execOn=function()rain_mat="water";rain_den=1;rain_grav=100;rain=true;end,execOff=function()rain=false;end,toggled=false,needsconstant=true},
{name="Blood Rain",execOn=function()rain_mat="blood";rain_den=1;rain_grav=120;rain=true;end,execOff=function()rain=false;end,toggled=false,needsconstant=true},
{name="Slime Rain",execOn=function()rain_mat="slime";rain_den=3;rain_grav=100;rain=true;end,execOff=function()rain=false;end,toggled=false,needsconstant=true},
{name="Acid Rain",execOn=function()rain_mat="acid";rain_den=1;rain_grav=110;rain=true;end,execOff=function()rain=false;end,toggled=false,needsconstant=true},
{name="Toxic Rain",execOn=function()rain_mat="radioactive_liquid";rain_den=1;rain_grav=100;rain=true;end,execOff=function()rain=false;end,toggled=false,needsconstant=true},
{name="Urine Rain",execOn=function()rain_mat="urine";rain_den=1;rain_grav=105;rain=true;end,execOff=function()rain=false;end,toggled=false,needsconstant=true},
{name="Poison Rain",execOn=function()rain_mat="poison";rain_den=1;rain_grav=105;rain=true;end,execOff=function()rain=false;end,toggled=false,needsconstant=true},
{name="Poo Rain",execOn=function()rain_mat="poo";rain_den=1.5;rain_grav=102;rain=true;end,execOff=function()rain=false;end,toggled=false,needsconstant=true},
{name="Alcohol Rain",execOn=function()rain_mat="alcohol";rain_den=1;rain_grav=103;rain=true;end,execOff=function()rain=false;end,toggled=false,needsconstant=true},
{name="Lava Rain",execOn=function()rain_mat="lava";rain_den=2;rain_grav=100;rain=true;end,execOff=function()rain=false;end,toggled=false,needsconstant=true},
{name="Gold Rain",execOn=function()rain_mat="gold";rain_den=2.4;rain_grav=200;rain=true;end,execOff=function()rain=false;end,toggled=false,needsconstant=true},
{name="Midas Rain",execOn=function()rain_mat="midas";rain_den=9.4;rain_grav=366;rain=true;end,execOff=function()rain=false;end,toggled=false,needsconstant=true},
{name="Snow",execOn=function()rain_mat="snow_sticky";rain_den=3;rain_grav=100;rain=true;end,execOff=function()rain=false;end,toggled=false,needsconstant=true},
{name="Hail",execOn=function()rain_mat="ice";rain_den=15;rain_grav=25;rain=true;end,execOff=function()rain=false;end,toggled=false,needsconstant=true},
{name="Brimstone",execOn=function()rain_mat="liquid_fire";rain_den=10;rain_grav=450;rain=true;end,execOff=function()rain=false;end,toggled=false,needsconstant=true},
{name="Sky Tsunami",execOn=function()rain_mat="water";rain_den=350;rain_grav=25;rain=true;end,execOff=function()rain=false;end,toggled=false,needsconstant=true},
{name="Stones",execOn=function()special_rain_path="data/entities/props/physics_stone_04.xml";special_rain=true;end,execOff=function()special_rain=false;end,toggled=false,needsconstant=true},
{name="Skulls",execOn=function()special_rain_path="data/entities/props/physics_skull_01.xml";special_rain=true;end,execOff=function()special_rain=false;end,toggled=false,needsconstant=true},
{name="Boxes",execOn=function()special_rain_path="data/entities/props/physics_box_harmless_small.xml";special_rain=true;end,execOff=function()special_rain=false;end,toggled=false,needsconstant=true},
{name="Gold Nuggets",execOn=function()special_rain_path="data/entities/items/pickup/goldnugget.xml";special_rain=true;end,execOff=function()special_rain=false;end,toggled=false,needsconstant=true},
{name="Burning Barrels",execOn=function()special_rain_path="data/entities/props/physics_barrel_burning.xml";special_rain=true;end,execOff=function()special_rain=false;end,toggled=false,needsconstant=true},
{name="Thunderstones",execOn=function()special_rain_path="data/entities/items/pickup/thunderstone.xml";special_rain=true;end,execOff=function()special_rain=false;end,toggled=false,needsconstant=true},
{name="Random Potions",execOn=function()special_rain_path="data/entities/items/pickup/potion_random_material.xml";special_rain=true;end,execOff=function()special_rain=false;end,toggled=false,needsconstant=true},
};
setting={
{name="X/Y Coordinates",execOn=function()coords=true;end,execOff=function()coords=false;end,toggled=false,cantoggle=true;},
{name="Clock",execOn=function()clocks=true;end,execOff=function()clocks=false;end,toggled=false,cantoggle=true;},
{name="Convert Everything to Gold",execOn=function()ConvertEverythingToGold();end,execOff=nil,toggled=nil,cantoggle=false;},
};
allanimals={
{filename="_test_walk",name="???"},
{filename="acidshooter",name="Acid Shooter"},
{filename="acidshooter_weak",name="Acid Shooter [WEAK]"},
{filename="alchemist",name="Alchemist"},
{filename="ant",name="Ant"},
{filename="assassin",name="Assassin"},
{filename="barfer",name="Barfer"},
{filename="bat",name="Bat"},
{filename="bigbat",name="Big Bat"},
{filename="bigfirebug",name="Big Fire Bug"},
{filename="bigzombie",name="Big Zombie"},
{filename="bigzombiehead",name="Big Zombie Head"},
{filename="bigzombietorso",name="Big Zombie Torso"},
{filename="blob",name="Blob"},
{filename="bloodcrystal_physics",name="Blood Crystal"},
{filename="bloom",name="Bloom"},
{filename="boss_dragon",name="Dragon Boss"},
{filename="chest_mimic",name="Chest Mimic"},
{filename="crystal_physics",name="Crystal"},
{filename="darkghost",name="Dark Ghost"},
{filename="deer",name="Deer"},
{filename="drone",name="Drone"},
{filename="drone_physics",name="Drone 2"},
{filename="duck",name="Duck"},
{filename="eel",name="Eel"},
{filename="elk",name="Elk"},
{filename="firebug",name="Fire Bug"},
{filename="firemage",name="Fire Mage"},
{filename="firemage_weak",name="Fire Mage [WEAK]"},
{filename="fireskull",name="Fire Skull"},
{filename="fireskull_weak",name="Fire Skull [WEAK]"},
{filename="fish",name="Fish"},
{filename="fish_large",name="Fish [BIG]"},
{filename="flamer",name="Flamer"},
{filename="fly",name="Fly"},
{filename="frog",name="Frog"},
{filename="fungus",name="Fungus"},
{filename="fungus_big",name="Fungus [BIG]"},
{filename="gazer",name="Gazer"},
{filename="ghost",name="Ghost"},
{filename="ghoul",name="Ghoul"},
{filename="giant",name="Giant"},
{filename="giantshooter",name="Giant Shooter"},
{filename="giantshooter_weak",name="Giant Shooter [WEAK]"},
{filename="healerdrone_physics",name="Healer Drone"},
{filename="icer",name="Icer"},
{filename="iceskull",name="Ice Skull"},
{filename="lasershooter",name="Laser Shooter"},
{filename="longleg",name="Long Leg"},
{filename="lurker",name="Lurker"},
{filename="maggot",name="Maggot"},
{filename="mimic_physics",name="Mimic ???"},
{filename="miner",name="Miner"},
{filename="miner_fire",name="Miner Fire"},
{filename="miner_santa",name="Miner Santa"},
{filename="miner_weak",name="Miner [WEAK]"},
{filename="miniblob",name="Mini Blob"},
{filename="missilecrab",name="Missile Crab"},
{filename="necromancer",name="Necromancer"},
{filename="necromancer_shop",name="Angry God"},
{filename="phantom_a",name="Phantom"},
{filename="phantom_b",name="Phantom 2"},
{filename="playerghost",name="Player Ghost"},
{filename="rat",name="Rat"},
{filename="roboguard",name="Robot Guard"},
{filename="scavenger_clusterbomb",name="Scavenger Bombs"},
{filename="scavenger_grenade",name="Scavenger Grenades"},
{filename="scavenger_heal",name="Scavenger Healing"},
{filename="scavenger_leader",name="Scavenger Leader"},
{filename="scavenger_mine",name="Scavenge Mines"},
{filename="scavenger_poison",name="Scavenger Poison"},
{filename="scavenger_smg",name="Scavenger SMG"},
{filename="scorpion",name="Scorpion"},
{filename="sheep",name="Sheep"},
{filename="sheep_bat",name="Sheep Bat"},
{filename="sheep_fly",name="Sheep Fly"},
{filename="shooterflower",name="Shooting Flower"},
{filename="shotgunner",name="Shotgunner"},
{filename="shotgunner_weak",name="Shotgunner [WEAK]"},
{filename="skullfly",name="Skull Fly"},
{filename="skullrat",name="Skull Rat"},
{filename="skycrystal_physics",name="Sky Crystal"},
{filename="slimeshooter",name="Slime Shooter"},
{filename="slimeshooter_nontoxic",name="Slime Shooter [NON-TOXIC]"},
{filename="slimeshooter_weak",name="Slime Shooter [WEAK]"},
{filename="sniper",name="Sniper"},
{filename="spitmonster",name="Spit Monster"},
{filename="statue_physics",name="Uboa ???"},
{filename="tank",name="Tank"},
{filename="tank_rocket",name="Tank Rockets"},
{filename="tank_super",name="Tank [SUPER]"},
{filename="tentacler",name="Tentacler"},
{filename="tentacler_small",name="Tentacler [SMALL]"},
{filename="thundermage",name="Thunder Mage"},
{filename="turret_left",name="Turret [LEFT]"},
{filename="turret_right",name="Turret [RIGHT]"},
{filename="wand_ghost",name="Wand Ghost"},
{filename="wand_ghost_charmed",name="Wand Ghost [CHARMED]"},
{filename="wizard_dark",name="Wizard [BLINDING]"},
{filename="wizard_poly",name="Wizard [POLYMORPHING]"},
{filename="wizard_tele",name="Wizard [TELEPORTING]"},
{filename="wolf",name="Wolf"},
{filename="worm",name="Worm"},
{filename="worm_big",name="Worm [BIG]"},
{filename="worm_end",name="Worm End"},
{filename="worm_skull",name="Worm Skull"},
{filename="worm_tiny",name="Worm [TINY]"},
{filename="wraith",name="Wraith"},
{filename="wraith_glowing",name="Wraith [GLOWING]"},
{filename="zombie",name="Zombie"},
{filename="zombie_weak",name="Zombie [WEAK]"},
}
objects={
{path="data/entities/props/",filename="altar_torch",name="Altar Torch"},
{path="data/entities/props/",filename="altar_torch_old",name="Altar Torch: Old"},
{path="data/entities/props/",filename="banner",name="Banner"},
{path="data/entities/props/",filename="base_coalmine_structure",name="Base Coalmine Structure"},
{path="data/entities/props/",filename="boss_arena_statues",name="Boss Statues"},
{path="data/entities/props/",filename="candle_1",name="Candle One"},
{path="data/entities/props/",filename="candle_2",name="Candle Two"},
{path="data/entities/props/",filename="candle_3",name="Candle Three"},
{path="data/entities/items/pickup/",filename="cape",name="Cape"},
{path="data/entities/items/pickup/",filename="chest_random",name="Chest: Random"},
{path="data/entities/items/pickup/",filename="chest_random_super",name="Super Chest: Random"},
{path="data/entities/props/",filename="coalmine_i_structure_01",name="Coalmine Structure One"},
{path="data/entities/props/",filename="coalmine_i_structure_02",name="Coalmine Structure Two"},
{path="data/entities/props/",filename="coalmine_large_structure_01",name="Coalmine Large Structure One"},
{path="data/entities/props/",filename="coalmine_large_structure_02",name="Coalmine Large Structure Two"},
{path="data/entities/props/",filename="coalmine_structure_01",name="Coalmine Structure: One"},
{path="data/entities/props/",filename="coalmine_structure_02",name="Coalmine Structure: Two"},
{path="data/entities/props/",filename="dripping_acid_gas",name="Dripping: Acid"},
{path="data/entities/props/",filename="dripping_oil",name="Dripping: Oil"},
{path="data/entities/props/",filename="dripping_radioactive",name="Dripping: Radioactive"},
{path="data/entities/props/",filename="dripping_water",name="Dripping: Water"},
{path="data/entities/props/",filename="dripping_water_heavy",name="Dripping: Water 'Heavy'"},
{path="data/entities/items/pickup/",filename="egg_fire",name="Egg: Fire"},
{path="data/entities/items/pickup/",filename="egg_hollow",name="Egg: Hollow"},
{path="data/entities/items/pickup/",filename="egg_monster",name="Egg: Monster"},
{path="data/entities/items/pickup/",filename="egg_red",name="Egg: Red"},
{path="data/entities/items/pickup/",filename="egg_slime",name="Egg: Slime"},
{path="data/entities/items/pickup/",filename="egg_worm",name="Egg: Worm"},
{path="data/entities/items/pickup/",filename="essence_air",name="Essence: Air"},
{path="data/entities/items/pickup/",filename="essence_alcohol",name="Essence: Alcohol"},
{path="data/entities/items/pickup/",filename="essence_fire",name="Essence: Fire"},
{path="data/entities/items/pickup/",filename="essence_laser",name="Essence: Laser"},
{path="data/entities/items/pickup/",filename="essence_water",name="Essence: Water"},
{path="data/entities/props/",filename="excavationsite_machine_3b",name="Excavation Site Machine: A"},
{path="data/entities/props/",filename="excavationsite_machine_3c",name="Excavation Site Machine: B"},
{path="data/entities/items/pickup/",filename="goldnugget",name="Gold Nugget"},
{path="data/entities/items/pickup/",filename="heart",name="Heart"},
{path="data/entities/items/pickup/",filename="heart_better",name="Better Heart"},
{path="data/entities/items/pickup/",filename="heart_evil",name="Evil Heart"},
{path="data/entities/items/pickup/",filename="heart_fullhp",name="Full Heart"},
{path="data/entities/items/pickup/",filename="heart_fullhp_temple",name="Full Heart: Temple"},
{path="data/entities/items/pickup/",filename="perk",name="Perk"},
{path="data/entities/items/pickup/",filename="perk_reroll",name="Perk Reroll"},
{path="data/entities/items/pickup/",filename="potion",name="Potion"},
{path="data/entities/items/pickup/",filename="potion_aggressive",name="Aggressive Potion"},
{path="data/entities/items/pickup/",filename="potion_random_material",name="Random Potion"},
{path="data/entities/items/pickup/",filename="potion_secret",name="Secret Potion"},
{path="data/entities/items/pickup/",filename="potion_water",name="Water Potion"},
{path="data/entities/items/pickup/",filename="random_card",name="Random Spell"},
{path="data/entities/items/pickup/",filename="spell_refresh",name="Spell Refresher"},
{path="data/entities/items/pickup/",filename="thunderstone",name="Thunderstone"},
{path="data/entities/props/",filename="ladder_long",name="Ladder"},
{path="data/entities/props/",filename="mountain_left_entrance_grass",name="Entrance Grass"},
{path="data/entities/props/",filename="physics_barrel_burning",name="Barrel: Burning"},
{path="data/entities/props/",filename="physics_barrel_oil",name="Barrel: Oil"},
{path="data/entities/props/",filename="physics_barrel_radioactive",name="Barrel: Radioactive"},
{path="data/entities/props/",filename="physics_bed",name="Bed [MAY NOT SPAWN]"},
{path="data/entities/props/",filename="physics_bone_01",name="Bone One"},
{path="data/entities/props/",filename="physics_bone_02",name="Bone Two"},
{path="data/entities/props/",filename="physics_bone_03",name="Bone Three"},
{path="data/entities/props/",filename="physics_bone_04",name="Bone Four"},
{path="data/entities/props/",filename="physics_bone_05",name="Bone Five"},
{path="data/entities/props/",filename="physics_bone_06",name="Bone Six"},
{path="data/entities/props/",filename="physics_bottle_blue",name="Blue Bottle"},
{path="data/entities/props/",filename="physics_bottle_green",name="Green Bottle"},
{path="data/entities/props/",filename="physics_bottle_red",name="Red Bottle"},
{path="data/entities/props/",filename="physics_bottle_yellow",name="Yellow Bottle"},
{path="data/entities/props/",filename="physics_box_explosive",name="Explosive Box"},
{path="data/entities/props/",filename="physics_box_harmless",name="Harmless Box"},
{path="data/entities/props/",filename="physics_box_harmless_small",name="Harmless Box: Small"},
{path="data/entities/props/",filename="physics_brewing_stand",name="Brewing Stand"},
{path="data/entities/props/",filename="physics_bucket",name="Bucket"},
{path="data/entities/props/",filename="physics_campfire",name="Campfire [MAY NOT SPAWN]"},
{path="data/entities/props/",filename="physics_candle_1",name="Candle One"},
{path="data/entities/props/",filename="physics_candle_2",name="Candle Two"},
{path="data/entities/props/",filename="physics_candle_3",name="Candle Three"},
{path="data/entities/props/",filename="physics_cart",name="Cart"},
{path="data/entities/props/",filename="physics_chain_torch",name="Chain Torch"},
{path="data/entities/props/",filename="physics_chain_torch_blue",name="Blue Chain Torch"},
{path="data/entities/props/",filename="physics_chain_torch_ghostly",name="Ghostly Chain Torch"},
{path="data/entities/props/",filename="physics_chair_1",name="Chair One"},
{path="data/entities/props/",filename="physics_chair_2",name="Chair Two"},
{path="data/entities/props/",filename="physics_chandelier",name="Chandelier"},
{path="data/entities/props/",filename="physics_crate",name="Crate"},
{path="data/entities/props/",filename="physics_electricity_source",name="Electricity Source"},
{path="data/entities/props/",filename="physics_gem",name="Gem"},
{path="data/entities/props/",filename="physics_glass_shard_01",name="Glass Shard One [MAY NOT SPAWN]"},
{path="data/entities/props/",filename="physics_glass_shard_02",name="Glass Shard Two [MAY NOT SPAWN]"},
{path="data/entities/props/",filename="physics_glass_shard_03",name="Glass Shard Three [MAY NOT SPAWN]"},
{path="data/entities/props/",filename="physics_glass_shard_04",name="Glass Shard Four [MAY NOT SPAWN]"},
{path="data/entities/props/",filename="physics_lantern",name="Lantern"},
{path="data/entities/props/",filename="physics_lantern_small",name="Small Lantern"},
{path="data/entities/props/",filename="physics_logo",name="Logo One"},
{path="data/entities/props/",filename="physics_logo_1",name="Logo Two"},
{path="data/entities/props/",filename="physics_logo_2",name="Logo Three"},
{path="data/entities/props/",filename="physics_logo_3",name="Logo Four"},
{path="data/entities/props/",filename="physics_minecart",name="Minecart"},
{path="data/entities/props/",filename="physics_mining_lamp",name="Mining Lamp"},
{path="data/entities/props/",filename="physics_pressure_tank",name="Pressure Tank"},
{path="data/entities/props/",filename="physics_propane_tank",name="Propane Tank"},
{path="data/entities/props/",filename="physics_ragdoll_part",name="Ragdoll Part"},
{path="data/entities/props/",filename="physics_ragdoll_part_electrified",name="Ragdoll Part: Electrified"},
{path="data/entities/props/",filename="physics_ragdoll_part_exploding",name="Ragdoll Part: Exploding"},
{path="data/entities/props/",filename="physics_sandbag",name="Sandbag"},
{path="data/entities/props/",filename="physics_seamine",name="Seamine"},
{path="data/entities/props/",filename="physics_skateboard",name="Skateboard"},
{path="data/entities/props/",filename="physics_skull_01",name="Skull One"},
{path="data/entities/props/",filename="physics_skull_02",name="Skull Two"},
{path="data/entities/props/",filename="physics_skull_03",name="Skull Three"},
{path="data/entities/props/",filename="physics_statue",name="Statue"},
{path="data/entities/props/",filename="physics_stone_01",name="Stone One"},
{path="data/entities/props/",filename="physics_stone_02",name="Stone Two"},
{path="data/entities/props/",filename="physics_stone_03",name="Stone Three"},
{path="data/entities/props/",filename="physics_stone_04",name="Stone Four"},
{path="data/entities/props/",filename="physics_table",name="Table"},
{path="data/entities/props/",filename="physics_templedoor",name="Templedoor One"},
{path="data/entities/props/",filename="physics_templedoor2",name="Templedoor Two"},
{path="data/entities/props/",filename="physics_torch_stand",name="Torch Stand"},
{path="data/entities/props/",filename="physics_torch_stand_blue",name="Blue Torch Stand"},
{path="data/entities/props/",filename="physics_torch_stand_intro",name="Torch Stand: Intro"},
{path="data/entities/props/",filename="physics_trap_circle_acid",name="Trap: Acid"},
{path="data/entities/props/",filename="physics_trap_electricity",name="Trap: Electricity"},
{path="data/entities/props/",filename="physics_trap_ignite_a",name="Trap: Ignite"},
{path="data/entities/props/",filename="physics_trap_ignite_b",name="Trap: Ignite Two"},
{path="data/entities/props/",filename="physics_tubelamp",name="Tube Lamp"},
{path="data/entities/props/",filename="physics_vase",name="Vase"},
{path="data/entities/props/",filename="physics_vase_longleg",name="Longleg Vase"},
{path="data/entities/props/",filename="physics_wheel",name="Wheel"},
{path="data/entities/props/",filename="physics_wheel_small",name="Wheel: Small"},
{path="data/entities/props/",filename="physics_wheel_stand_01",name="Wheel Stand One"},
{path="data/entities/props/",filename="physics_wheel_stand_02",name="Wheel Stand Two"},
{path="data/entities/props/",filename="physics_wheel_stand_03",name="Wheel Stand Three"},
{path="data/entities/props/",filename="physics_wheel_tiny",name="Wheel: Tiny"},
{path="data/entities/props/",filename="pressure_plate",name="Pressure Plate"},
{path="data/entities/props/",filename="statue",name="Statue"},
{path="data/entities/props/",filename="statue_back",name="Back Statue"},
{path="data/entities/props/",filename="stonepile",name="Stone Pile"},
{path="data/entities/props/",filename="temple_pressure_plate",name="Temple Pressure Plate"},
{path="data/entities/props/",filename="vault_machine_1",name="Vault Machine One"},
{path="data/entities/props/",filename="vault_machine_2",name="Vault Machine Two"},
{path="data/entities/props/",filename="vault_machine_3",name="Vault Machine Three"},
{path="data/entities/props/",filename="vault_machine_4",name="Vault Machine Four"},
{path="data/entities/props/",filename="vault_machine_5",name="Vault Machine Five"},
{path="data/entities/props/",filename="vault_machine_6",name="Vault Machine Six"},
{path="data/entities/animals/boss_centipede/rewards/",filename="giant_dollar",name="Giant Dollar"},
{path="data/entities/animals/boss_centipede/rewards/",filename="gold_reward",name="Sprite"},
{path="data/entities/animals/boss_centipede/rewards/",filename="reward_clock",name="Clock"},
{path="data/entities/animals/boss_centipede/rewards/",filename="reward_crown",name="Crown"},
{path="data/entities/animals/boss_centipede/rewards/",filename="reward_dollar",name="Dollar"},
{path="data/entities/animals/boss_centipede/rewards/",filename="reward_minit",name="Teapot"},
{path="data/entities/animals/boss_centipede/rewards/",filename="reward_nolla",name="Nolla"},
{path="data/entities/animals/boss_centipede/rewards/",filename="reward_peace",name="Peace"},};
getAllMaterial(materials);