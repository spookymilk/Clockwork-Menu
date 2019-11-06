if not async then
  dofile("data/scripts/lib/coroutines.lua");
end;
dofile("data/scripts/lib/utilities.lua");
dofile("data/scripts/perks/perk.lua");
dofile("data/scripts/gun/gun_actions.lua" );
dofile("data/functions.lua");
dofile("data/tables.lua");

local gui=GuiCreate();
local milk=nil;
local closed,open,player,abilities,world,spawnables,animals,timeguy,weatherguy,itemsguy,booksguy,miscguy,friendlyguys,meanguys,teleportLoc,settings,alchemy,spells,spellstwo,spellsthree,perks,weapons;
local spawnRate=1;
local god=false
local breathless=false
local greedy=false;
local jetpack=false;
local megainv=false;
local high=false;
local supershield=false;
local drunk=false;
local xyz=false;
local electro=false;
local johnnyflame=false;
local perksStay=false;
local wandsE=false;
local spellRefresh=false;
local freecam=false;
local immortal=false;
local heavyguy=false;
local fastjetpack=false;
local removecape=false;
local rainbowcape=false;
local light=false;
local theTime;
local cock=false;
local magnet=false;
-- this is probably really gross way of doing this, oh well
local prot_all=EntityLoad("data/edited/protection_all.xml",9999999,9999999);
local super_shield=EntityLoad("data/edited/supershield.xml",9999999,9999999);
local drunkguy=EntityLoad("data/edited/drunk.xml",9999999,9999999);
local electroG=EntityLoad("data/edited/electro.xml",9999999,9999999);
local johnnyG=EntityLoad("data/edited/johnnyflame.xml",9999999,9999999);
local wem=EntityLoad("data/edited/wem.xml",9999999,9999999);
local lightguy=EntityLoad("data/edited/light.xml",9999999,9999999);
local magnetguy=EntityLoad("data/edited/magnet.xml",99999999,99999999);
local books=TABLE_ONE;
local items=TABLE_TWO;
local friendly=TABLE_MONSTERS_FRIENDLY;
local mean=TABLE_MONSTERS_ENEMY;
local phraseOfDay=TABLE_PHRASE[math.random(#TABLE_PHRASE)];
local teleporter=TABLE_TELEPORT;
local cardsPageOne={"<-- Go Back"};
local cardsPageTwo={"<-- Last Page"};
local cardsPageThree={"<-- Last Page"};
local merks={"<-- Go Back"};
local XGUY=GuiText(gui,0,50,"");
local YGUY=GuiText(gui,0,50,"");
local CLOCKGUY=GuiText(gui,0,50,"");


-- is this hacky? probably. no performance issues on my end though.
async_loop(function()
wait(0); -- i wish wait''; worked.
if prot_all==1 then
prot_all=EntityLoad("data/edited/protection_all.xml",9999999,9999999);
elseif super_shield==1 then
super_shield=EntityLoad("data/edited/supershield.xml",9999999,9999999);
elseif drunkguy==1 then
drunkguy=EntityLoad("data/edited/drunk.xml",9999999,9999999);
elseif electroG==1 then
electroG=EntityLoad("data/edited/electro.xml",9999991,9999919);
elseif johnnyG==1 then
johnnyG=EntityLoad("data/edited/johnnyflame.xml",9919999,9999199);
elseif wem==1 then
wem=EntityLoad("data/edited/wem.xml",9999999,9999999);
elseif lightguy==1 then
lightguy=EntityLoad("data/edited/light.xml",9999999,9999999);
elseif magnetguy==1 then
magnetguy=EntityLoad("data/edited/magnet.xml",99999999,99999999);
end;
if xyz==true then
local x,y=localplayerPos();
XGUY=GuiText(gui,1,0,"X: "..tostring(x));
YGUY=GuiText(gui,1,10,"Y: "..tostring(y));
elseif xyz==false then
XGUY=GuiText(gui,0,250,"");
YGUY=GuiText(gui,0,250,"");
end;
if cock==true then
CURRENT_TIME=getTime();
HOUR=string.sub(tostring(CURRENT_TIME),3,3);
MINUTES=string.sub(tostring(CURRENT_TIME),4,5);
local AMORPM="";
for i,v in pairs(TABLE_TIME) do
if HOUR==TABLE_TIME[1] or HOUR==TABLE_TIME[2] or HOUR==TABLE_TIME[3] or HOUR==TABLE_TIME[4] or HOUR==TABLE_TIME[5] then
AMORPM="PM";
else
AMORPM="AM";
end;
end;
CLOCKGUY=GuiText(gui,145,0,HOUR..":"..MINUTES.." "..AMORPM);
elseif cock==false then
CLOCKGUY=GuiText(gui,0,250,"");
end;
if spellRefresh==true then
GameRegenItemActionsInPlayer(localplayer());
elseif spellRefresh==false then
end;
if frozentime==true then
setTime(theTime);
end;
if rainbowcape==true then
local cape=EntityGetWithName("cape");
local rainbow=randomHexRainbow();
if cape~=nil then
edit_component(cape,"VerletPhysicsComponent",function(comp,vars) 
vars.cloth_color=rainbow;
vars.cloth_color_edge=rainbow;
end);
end;
elseif rainbowcape==false then
local cape=EntityGetWithName("cape");
if cape~=nil then
edit_component(cape,"VerletPhysicsComponent",function(comp,vars) 
vars.cloth_color=0xFFFFA07A;
vars.cloth_color_edge=vars.cloth_color;
end);
end;
end;
end);

function list(theTable)
local x=1;
local offset=15;
local func=1;
for i=1,tableCount(theTable) do
if not theTable[func] then break end;
begin(gui,x,12)
for d=1,28 do
if not theTable[func] then break end;
local jesus=theTable[func];
if button(gui,0,0,jesus[1],1) then
jesus[2](jesus);
end;
func=func+1;
end;
endit(gui)
x=x+offset;
end;
end;

function listFree(theTable)
local x=1;
local offset=30;
local func=1;
for i=1,tableCount(theTable) do
if not theTable[func] then break end;
begin(gui,x,12)
for d=1,28 do
if not theTable[func] then break end;
local jesus=theTable[func];
if button(gui,0,0,jesus[1],1) then
jesus[2](jesus);
end;
func=func+1;
end;
endit(gui)
x=x+offset;
end;
end;

closed=function()
begin(gui,45,0);
if button(gui,0,0,phraseOfDay,1) then
milk=open;
end;
endit(gui);
end;
-- they need to add colorable GUI
open=function()
begin(gui,1,12)
if button(gui,0,0,"Player",1) then
milk=player;
end;
if button(gui,0,0,"Abilities",1) then
milk=abilities;
end;
if button(gui,0,0,"World",1) then
milk=world;
end;
if button(gui,0,0,"Weapons",1) then
milk=weapons;
end;
if button(gui,0,0,"Items",1) then
milk=spawnables;
end;
if button(gui,0,0,"Animals",1) then
milk=animals;
end;
if button(gui,0,0,"Alchemy",1) then
milk=alchemy;
end;
if button(gui,0,0,"Settings",1) then
milk=settings;
end;
if button(gui,0,0,"Close",1) then
milk=closed;
end;
endit(gui);
end;

player=function()
local ee=prot_all;
begin(gui,1,12);
if button(gui,0,0,"<-- Go Back",1) then
milk=open;
end;
if god==true then
if button(gui,0,0,"Godmode [ON]",1) then
god=false;
setHealth(localplayer(),4,4);
huntNKill(ee);
prot_all=1;
end;
else
if button(gui,0,0,"Godmode [OFF]",1) then
god=true;
setHealth(localplayer(),25,25);
EntityAddChild(localplayer(),ee);
end;
end;
if breathless==true then
if button(gui,0,0,"Breathless [ON]",1) then
breathless=false;
local damagemodels=EntityGetComponent(localplayer(),"DamageModelComponent");
if(damagemodels~=nil ) then
for i,damagemodel in ipairs(damagemodels) do		
ComponentSetValue(damagemodel,"air_needed",1);
end;
end;
end;
else
if button(gui,0,0,"Breathless [OFF]",1) then
breathless=true;
local damagemodels=EntityGetComponent(localplayer(),"DamageModelComponent");
if(damagemodels~=nil ) then
for i,damagemodel in ipairs(damagemodels) do		
ComponentSetValue(damagemodel,"air_needed",0);
end;
end;
end;
end;
if greedy==true then
if button(gui,0,0,"Greedy [ON]",1) then
greedy=false;
local damagemodels=EntityGetComponent(localplayer(),"WalletComponent");
if(damagemodels~=nil ) then
for i,damagemodel in ipairs(damagemodels) do		
ComponentSetValue(damagemodel,"money",10);
ComponentSetValue(damagemodel,"mHasReachInf",0);
end;
end;
end;
else
if button(gui,0,0,"Greedy [OFF]",1) then
greedy=true;
local damagemodels=EntityGetComponent(localplayer(),"WalletComponent");
if(damagemodels~=nil ) then
for i,damagemodel in ipairs(damagemodels) do		
ComponentSetValue(damagemodel,"money",10000);
ComponentSetValue(damagemodel,"mHasReachInf",1);
end;
end;
end;
end;
if jetpack==true then
if button(gui,0,0,"Unlimited Jetpack [ON]",1) then
jetpack=false;
local damagemodels=EntityGetComponent(localplayer(),"CharacterDataComponent");
if(damagemodels~=nil ) then
for i,damagemodel in ipairs(damagemodels) do		
ComponentSetValue(damagemodel,"flying_needs_recharge",1);
end;
end;
end;
else
if button(gui,0,0,"Unlimited Jetpack [OFF]",1) then
jetpack=true;
local damagemodels=EntityGetComponent(localplayer(),"CharacterDataComponent");
if(damagemodels~=nil ) then
for i,damagemodel in ipairs(damagemodels) do		
ComponentSetValue(damagemodel,"flying_needs_recharge",0);
end;
end;
end;
end;
if megainv==true then
if button(gui,0,0,"Mega Inventory [ON]",1) then
megainv=false;
local damagemodels=EntityGetComponent(localplayer(),"Inventory2Component");
if(damagemodels~=nil ) then
for i,damagemodel in ipairs(damagemodels) do		
ComponentSetValue(damagemodel,"full_inventory_slots_y",1);
end;
end;
end;
else
if button(gui,0,0,"Mega Inventory [OFF]",1) then
megainv=true;
local damagemodels=EntityGetComponent(localplayer(),"Inventory2Component");
if(damagemodels~=nil ) then
for i,damagemodel in ipairs(damagemodels) do		
ComponentSetValue(damagemodel,"full_inventory_slots_y",5);
end;
end;
end;
end;
if high==true then
if button(gui,0,0,"High [ON]",1) then
high=false;
local damagemodels=EntityGetComponent(localplayer(),"DrugEffectComponent");
if(damagemodels~=nil ) then
for i,damagemodel in ipairs(damagemodels) do		
ComponentSetValue(damagemodel,"hallucinogen_amount",0);
end;
end;
end;
else
if button(gui,0,0,"High [OFF]",1) then
high=true;
local damagemodels=EntityGetComponent(localplayer(),"DrugEffectComponent");
if(damagemodels~=nil ) then
for i,damagemodel in ipairs(damagemodels) do		
ComponentSetValue(damagemodel,"hallucinogen_amount",1);
end;
end;
end;
end;
if drunk==true then
if button(gui,0,0,"Drunk [ON]",1) then
drunk=false;
huntNKill(drunkguy);
drunkguy=1;
end;
else
if button(gui,0,0,"Drunk [OFF]",1) then
drunk=true;
EntityAddChild(localplayer(),drunkguy);
end;
end;
if xyz==true then
if button(gui,0,0,"Show X/Y [ON]",1) then
xyz=false;
end;
else
if button(gui,0,0,"Show X/Y [OFF]",1) then
xyz=true;
end;
end;
if cock==true then
if button(gui,0,0,"Show Clock [ON]",1) then
cock=false;
end;
else
if button(gui,0,0,"Show Clock [OFF]",1) then
cock=true;
end;
end;
if freecam==true then
if button(gui,0,0,"Freecam [ON]",1) then
freecam=false;
GameSetCameraFree(false);
end;
else
if button(gui,0,0,"Freecam [OFF]",1) then
freecam=true;
GameSetCameraFree(true);
end;
end;
if spellRefresh==true then
if button(gui,0,0,"Constant Spell Refresh [ON]",1) then
spellRefresh=false;
end;
else
if button(gui,0,0,"Constant Spell Refresh [OFF]",1) then
spellRefresh=true;
end;
end;
if wandsE==true then
if button(gui,0,0,"Edit Wands Everywhere [ON]",1) then
wandsE=false;
huntNKill(wem);
wem=1;
end;
else
if button(gui,0,0,"Edit Wands Everywhere [OFF]",1) then
wandsE=true;
EntityAddChild(localplayer(),wem);
end;
end;
if supershield==true then
if button(gui,0,0,"Angry God Shield [ON]",1) then
supershield=false;
huntNKill(super_shield);
super_shield=1;
end;
else
if button(gui,0,0,"Angry God Shield [OFF]",1) then
supershield=true;
EntityAddChild(localplayer(),super_shield);
end;
end;
if electro==true then
if button(gui,0,0,"Electro [ON]",1) then
electro=false;
huntNKill(electroG);
electroG=1;
end;
else
if button(gui,0,0,"Electro [OFF]",1) then
electro=true;
EntityAddChild(localplayer(),electroG);
end;
end;
if johnnyflame==true then
if button(gui,0,0,"Johnny Flame [ON]",1) then
johnnyflame=false;
huntNKill(johnnyG);
johnnyG=1;
end;
else
if button(gui,0,0,"Johnny Flame [OFF]",1) then
johnnyflame=true;
EntityAddChild(localplayer(),johnnyG);
end;
end;
if immortal==true then
if button(gui,0,0,"Immortal [ON]",1) then
immortal=false;
local damagemodel=EntityGetFirstComponent(localplayer(),"DamageModelComponent");
local health=ComponentGetValue(damagemodel,"hp");
local maxHealth=ComponentGetValue(damagemodel,"max_hp");
ComponentSetValue(damagemodel,"wait_for_kill_flag_on_death","0");
ComponentSetValue(damagemodel,"hp",maxHealth);
end;
else
if button(gui,0,0,"Immortal [OFF]",1) then
immortal=true;
local damagemodel=EntityGetFirstComponent(localplayer(),"DamageModelComponent");
ComponentSetValue(damagemodel,"wait_for_kill_flag_on_death","1");
end;
end;
if heavyguy==true then
if button(gui,0,0,"Heavy Feet [ON]",1) then
heavyguy=false;
editComponentInsidePlayer("CharacterDataComponent","destroy_ground",0);
editComponentInsidePlayer("CharacterDataComponent","mass",1);
end;
else
if button(gui,0,0,"Heavy Feet [OFF]",1) then
heavyguy=true;
editComponentInsidePlayer("CharacterDataComponent","destroy_ground",1000);
editComponentInsidePlayer("CharacterDataComponent","mass",1000);
end;
end;
if fastjetpack==true then
if button(gui,0,0,"Fast Jetpack [ON]",1) then
fastjetpack=false;
editComponentInsidePlayer("CharacterPlatformingComponent","fly_speed_max_up",100);
end;
else
if button(gui,0,0,"Fast Jetpack [OFF]",1) then
fastjetpack=true;
editComponentInsidePlayer("CharacterPlatformingComponent","fly_speed_max_up",1000);
end;
end;
if rainbowcape==true then
if button(gui,0,0,"Rainbow Cape [ON]",1) then
rainbowcape=false;
end;
else
if button(gui,0,0,"Rainbow Cape [OFF]",1) then
local cape=EntityGetWithName("cape");
if cape~=nil then
rainbowcape=true;
end;
end;
end;
if light==true then
if button(gui,0,0,"Light [ON]",1) then
light=false;
huntNKill(lightguy);
lightguy=1;
end;
else
if button(gui,0,0,"Light [OFF]",1) then
light=true;
EntityAddChild(localplayer(),lightguy);
end;
end;
if magnet==true then
if button(gui,0,0,"Magnet [ON]",1) then
magnet=false;
huntNKill(magnetguy);
magnetguy=1;
end;
else
if button(gui,0,0,"Magnet [OFF]",1) then
magnet=true;
EntityAddChild(localplayer(),magnetguy);
end;
end;
endit(gui);
end;

world=function()
begin(gui,1,12);
if button(gui,0,0,"<- Go Back",1) then
milk=open;
end;
if button(gui,0,0,"Time",1) then
milk=timeguy;
end;
if button(gui,0,0,"Weather",1) then
milk=weatherguy;
end;
if button(gui,0,0,"Teleport",1) then
milk=teleportLoc;
end;
if button(gui,0,0,"Misc.",1) then
milk=miscguy;
end;
endit(gui);
end;

weatherguy=function()
begin(gui,1,12);
if button(gui,0,0,"<-- Go Back",1) then
milk=world;
end;
if button(gui,0,0,"Cloudy",1) then
editComponentInsideWorld("WorldStateComponent","rain",100000);
end;
if button(gui,0,0,"Foggy",1) then
editComponentInsideWorld("WorldStateComponent","fog",1);
end;
if button(gui,0,0,"Clear",1) then
editComponentInsideWorld("WorldStateComponent","fog",0);
editComponentInsideWorld("WorldStateComponent","fog_target",0);
editComponentInsideWorld("WorldStateComponent","intro_weather",1);
--wait(1);
--editComponentInsideWorld("WorldStateComponent","intro_weather",0);
end;
if button(gui,0,0,"Rain",1) then
test("water");
GamePrintImportant("You have angered the Gods!","The Gods have cursed you with rain.")
end;
if button(gui,0,0,"Blood Rain",1) then
test("blood_fading");
GamePrintImportant("You have angered the Gods!","The Gods have cursed you with blood.")
end;
if button(gui,0,0,"Acid Rain",1) then
test("acid");
GamePrintImportant("You have angered the Gods!","The Gods have cursed you with acid.")
end;
if button(gui,0,0,"Slime Rain",1) then
test("slime");
GamePrintImportant("You have angered the Gods!","The Gods have cursed you with slime.")
end;
if button(gui,0,0,"Gold Rain",1) then
test("gold");
GamePrintImportant("You have pleased the Gods!","Wait what?")
end;
endit(gui);
end;

timeguy=function()
begin(gui,1,12);
if button(gui,0,0,"<-- Go Back",1) then
milk=world;
end;
if frozentime==true then
if button(gui,0,0,"Freeze Time [ON]",1) then
frozentime=false;
end;
else
if button(gui,0,0,"Freeze Time [OFF]",1) then
frozentime=true;
theTime=getTime();
end;
end;
if button(gui,0,0,"Dusk",1) then
setTime(0.7);
end;
if button(gui,0,0,"Morning",1) then
setTime(0.9);
end;
if button(gui,0,0,"MidDay",1) then
setTime(0.1);
end;
if button(gui,0,0,"Golden Hour",1) then
setTime(0.3);
end;
if button(gui,0,0,"Apocolyptic",1) then
setTime(0.47752);
end;
if button(gui,0,0,"Night",1) then
setTime(0.55356);
end;
endit(gui);
end;

miscguy=function()
begin(gui,1,12);
if button(gui,0,0,"<-- Go Back",1) then
milk=world;
end;
if perksStay==true then
if button(gui,0,0,"Perks Stay [ON]",1) then
perksStay=false;
local gottem=100;
GlobalsSetValue("TEMPLE_PERK_DESTROY_CHANCE", tostring(gottem));
end;
else
if button(gui,0,0,"Perks Stay [OFF]",1) then
perksStay=true;
local perk_destroy_chance = tonumber(GlobalsGetValue("TEMPLE_PERK_DESTROY_CHANCE","100"));
perk_destroy_chance=0;
GlobalsSetValue("TEMPLE_PERK_DESTROY_CHANCE",tostring(perk_destroy_chance));
end;
end;
if button(gui,0,0,"Everythings Gold",1) then
ConvertEverythingToGold();
end;
endit(gui);
end;

spawnables=function()
begin(gui,1,12);
if button(gui,0,0,"<-- Go Back",1) then
milk=open;
end;
if button(gui,0,0,"Items",1) then
milk=itemsguy;
end;
if button(gui,0,0,"Tablets",1) then
milk=booksguy;
end;
if button(gui,0,0,"Spells",1) then
milk=spells;
end;
if button(gui,0,0,"Perks",1) then
milk=perks;
end;
endit(gui);
end;

animals=function()
begin(gui,1,12);
if button(gui,0,0,"<-- Go Back",1) then
milk=open;
end;
if button(gui,0,0,"Friendly",1) then
milk=friendlyguys;
end;
if button(gui,0,0,"Mean",1) then
milk=meanguys;
end;
endit(gui);
end;

abilities=function()
begin(gui,1,12);
if button(gui,0,0,"<-- Go Back",1) then
milk=open;
end;
if button(gui,0,0,"Giga Blackhole",1) then
loadabilityraw(localplayer(),"data/entities/projectiles/deck/black_hole_big.xml");
end;
if button(gui,0,0,"Earthquake",1) then
loadabilityraw(localplayer(),"data/edited/earthquake.xml");
end;
if button(gui,0,0,"Super Freeze Circle",1) then
loadabilityraw(localplayer(),"data/edited/superfreezeguy.xml");
end;
if button(gui,0,0,"Air Essence",1) then
loadabilityraw(localplayer(),"data/edited/air.xml");
end;
if button(gui,0,0,"Fire Essence",1) then
loadabilityraw(localplayer(),"data/edited/fire.xml");
end;
if button(gui,0,0,"Earth Essence",1) then
loadabilityraw(localplayer(),"data/edited/laser.xml");
end;
if button(gui,0,0,"Water Essence",1) then
loadabilityraw(localplayer(),"data/edited/water.xml");
end;
if button(gui,0,0,"Curse of the Octopus",1) then
GamePrint("Is this really an ability?");
loadabilityraw(localplayer(),"data/edited/octopussy.xml");
end;
endit(gui);
end;

settings=function()
begin(gui,1,12);
if button(gui,0,0,"<-- Go Back",1) then
milk=open;
end;
local spawnD=GuiText(gui,0,0,"Spawn Rate: "..spawnRate);
if button(gui,65,-11,"[-]",1) then
if spawnRate==0 then
GamePrint("Can't go below zero!");
else
spawnRate=spawnRate-1;
end;
end;
if button(gui,81,-11,"[+]",1) then
if spawnRate==99 then
GamePrint("You hit the max!");
else
spawnRate=spawnRate+1;
end;
end;
if button(gui,0,0,"Unlock All Spells",1) then
for _,v in pairs(actions) do
UnlockItem(v.id)
GamePrint("Unlocked: "..v.id);
end;
end;
endit(gui);
end;

weapons=function()
begin(gui,1,12);
if button(gui,0,0,"<-- Go Back",1) then
milk=open;
end;
if button(gui,0,0,"Super Wand",1) then
--loadability(localplayer(),localplayerPos(),"data/edited/superwand.xml");
spawnitem("data/edited/superwand.xml",1);
end;
if button(gui,0,0,"Mjolnir",1) then
spawnitem("data/edited/mjolnir.xml",1);
end;
if button(gui,0,0,"Shotgun",1) then
spawnitem("data/edited/shotgun.xml",1);
end;
if button(gui,0,0,"AK-47",1) then
spawnitem("data/edited/ak47.xml",1);
end;
if button(gui,0,0,"Destroyer",1) then
spawnitem("data/edited/destroyer.xml",1);
end;
if button(gui,0,0,"TMP5000",1) then
spawnitem("data/edited/TMP5000.xml",1);
GamePrint("Enjoy your new Tunnel Master Pro 5000.");
end;
if button(gui,0,0,"Shoop",1) then
spawnitem("data/edited/shoop.xml",1);
end;
endit(gui);
end;

booksguy=function()
list(books);
end;

itemsguy=function()
list(items);
end;

friendlyguys=function()
list(friendly);
end;
meanguys=function()
list(mean);
end;

teleportLoc=function()
list(teleporter);
end;

alchemy=function()
list(TABLE_ALC);
end;

spells=function()
listFree(cardsPageOne);
end;

spellstwo=function()
listFree(cardsPageTwo);
end;

spellsthree=function()
listFree(cardsPageThree);
end;

perks=function()
listFree(merks);
end;

addCards(actions,1,82,cardsPageOne,true);
addCards(actions,83,164,cardsPageTwo,true);
addCards(actions,165,196,cardsPageThree,false);
addCards(perk_list,1,90,merks,false);
tableButton(books,1,function()milk=spawnables;end);
tableButton(books,2,function()spawnitem("data/entities/items/books/base_book.xml",spawnRate);end);
tableButton(books,3,function()spawnitem("data/entities/items/books/book_00.xml",spawnRate);end);
tableButton(books,4,function()spawnitem("data/entities/items/books/book_01.xml",spawnRate);end);
tableButton(books,5,function()spawnitem("data/entities/items/books/book_02.xml",spawnRate);end);
tableButton(books,6,function()spawnitem("data/entities/items/books/book_03.xml",spawnRate);end);
tableButton(books,7,function()spawnitem("data/entities/items/books/book_04.xml",spawnRate);end);
tableButton(books,8,function()spawnitem("data/entities/items/books/book_05.xml",spawnRate);end);
tableButton(books,9,function()spawnitem("data/entities/items/books/book_06.xml",spawnRate);end);
tableButton(books,10,function()spawnitem("data/entities/items/books/book_07.xml",spawnRate);end);
tableButton(books,11,function()spawnitem("data/entities/items/books/book_08.xml",spawnRate);end);
tableButton(books,12,function()spawnitem("data/entities/items/books/book_09.xml",spawnRate);end);
tableButton(books,13,function()spawnitem("data/entities/items/books/book_10.xml",spawnRate);end);
tableButton(books,14,function()spawnitem("data/entities/items/books/book_11.xml",spawnRate);end);
tableButton(books,15,function()spawnitem("data/entities/items/books/book_12.xml",spawnRate);end);
tableButton(books,16,function()spawnitem("data/entities/items/books/book_corpse.xml",spawnRate);end);
tableButton(books,17,function()spawnitem("data/entities/items/books/book_tree.xml",spawnRate);end);
tableButton(items,1,function()milk=spawnables;end);
tableButton(items,1+1,function()spawnitem("data/entities/items/pickup/chest_random.xml",spawnRate);end);
tableButton(items,2+1,function()spawnitem("data/entities/items/pickup/chest_random_super.xml",spawnRate);end);
tableButton(items,3+1,function()spawnitem("data/entities/items/pickup/egg_fire.xml",spawnRate);end);
tableButton(items,4+1,function()spawnitem("data/entities/items/pickup/egg_monster.xml",spawnRate);end);
tableButton(items,5+1,function()spawnitem("data/entities/items/pickup/egg_red.xml",spawnRate);end);
tableButton(items,6+1,function()spawnitem("data/entities/items/pickup/egg_slime.xml",spawnRate);end);
tableButton(items,7+1,function()spawnitem("data/entities/items/pickup/egg_worm.xml",spawnRate);end);
tableButton(items,8+1,function()spawnitem("data/entities/items/pickup/goldnugget.xml",spawnRate);end);
tableButton(items,9+1,function()spawnitem("data/entities/items/pickup/thunderstone.xml",spawnRate);end);
tableButton(items,10+1,function()spawnitem("data/entities/items/easter/beer_bottle.xml",spawnRate);end);
tableButton(items,11+1,function()spawnitem("data/entities/items/easter/druidsoccer_ball.xml",spawnRate);end);
tableButton(items,12+1,function()spawnitem("data/entities/props/ladder_long.xml",spawnRate);end);
tableButton(items,13+1,function()spawnitem("data/entities/props/physics_barrel_burning.xml",spawnRate);end);
tableButton(items,14+1,function()spawnitem("data/entities/props/physics_barrel_oil.xml",spawnRate);end);
tableButton(items,15+1,function()spawnitem("data/entities/props/physics_barrel_radioactive.xml",spawnRate);end);
tableButton(items,16+1,function()spawnitem("data/entities/props/physics_vase_longleg.xml",spawnRate);end);
tableButton(items,17+1,function()spawnitem("data/entities/props/physics_box_explosive.xml",spawnRate);end);
tableButton(items,18+1,function()spawnitem("data/entities/props/physics_box_harmless.xml",spawnRate);end);
tableButton(items,19+1,function()spawnitem("data/entities/props/physics_box_harmless_small.xml",spawnRate);end);
tableButton(items,20+1,function()spawnitem("data/entities/props/physics_bucket.xml",spawnRate);end);
tableButton(items,21+1,function()spawnitem("data/entities/props/physics_lantern_small.xml",spawnRate);end);
tableButton(items,22+1,function()spawnitem("data/entities/props/physics_cart.xml",spawnRate);end);
tableButton(items,23+1,function()spawnitem("data/entities/props/physics_chair_1.xml",spawnRate);end);
tableButton(items,24+1,function()spawnitem("data/entities/props/physics_crate.xml",spawnRate);end);
tableButton(items,25+1,function()spawnitem("data/entities/props/physics_gem.xml",spawnRate);end);
tableButton(items,26+1,function()spawnitem("data/entities/props/physics_lantern.xml",spawnRate);end);
tableButton(items,27+1,function()spawnitem("data/entities/props/physics_minecart.xml",spawnRate);end);
tableButton(items,28+1,function()spawnitem("data/entities/props/physics_propane_tank.xml",spawnRate);end);
tableButton(items,29+1,function()spawnitem("data/entities/props/physics_pressure_tank.xml",spawnRate);end);
tableButton(items,30+1,function()spawnitem("data/entities/props/physics_sandbag.xml",spawnRate);end);
tableButton(items,31+1,function()spawnitem("data/entities/props/physics_skateboard.xml",spawnRate);end);
tableButton(items,32+1,function()spawnitem("data/entities/props/physics_skull_01.xml",spawnRate);end);
tableButton(items,33+1,function()spawnitem("data/entities/props/physics_bone_01.xml",spawnRate);end);
tableButton(items,34+1,function()spawnitem("data/entities/props/physics_table.xml",spawnRate);end);
tableButton(items,35+1,function()spawnitem("data/entities/props/physics_vase.xml",spawnRate);end);
tableButton(items,36+1,function()spawnitem("data/entities/props/physics_wheel.xml",spawnRate);end);
tableButton(items,38,function()spawnitem("data/entities/projectiles/deck/sea_water.xml",spawnRate);end);
tableButton(items,39,function()spawnitem("data/entities/projectiles/deck/sea_lava.xml",spawnRate);end);
tableButton(items,40,function()spawnitem("data/entities/projectiles/deck/sea_oil.xml",spawnRate);end);
tableButton(items,41,function()spawnitem("data/entities/projectiles/deck/sea_acid.xml",spawnRate);end);
tableButton(items,42,function()spawnitem("data/edited/sea_toxic.xml",spawnRate);end);
tableButton(items,43,function()spawnitem("data/edited/sea_slime.xml",spawnRate);end);
tableButton(items,44,function()spawnitem("data/entities/projectiles/deck/sea_alcohol.xml",spawnRate);end);
tableButton(items,45,function()spawnitem("data/edited/sea_gold.xml",spawnRate);end);
tableButton(items,46,function()spawnitem("data/entities/projectiles/bomb.xml",spawnRate);end);
tableButton(items,47,function()spawnitem("data/entities/projectiles/bomb_holy.xml",spawnRate);end);
tableButton(items,48,function()spawnitem("data/entities/projectiles/tnt.xml",spawnRate);end);
tableButton(items,49,function()spawnitem("data/entities/projectiles/clusterbomb.xml",spawnRate);end);
tableButton(items,50,function()spawnitem("data/entities/projectiles/bomb_small.xml",spawnRate);end);
tableButton(items,51,function()spawnitem("data/entities/projectiles/deck/nuke.xml",spawnRate);end);
tableButton(items,52,function()spawnitem("data/entities/projectiles/deck/fireworks/firework_blue.xml",spawnRate);end);
tableButton(items,53,function()spawnitem("data/entities/projectiles/deck/fireworks/firework_green.xml",spawnRate);end);
tableButton(items,54,function()spawnitem("data/entities/projectiles/deck/fireworks/firework_orange.xml",spawnRate);end);
tableButton(items,55,function()spawnitem("data/entities/projectiles/deck/fireworks/firework_pink.xml",spawnRate);end);
tableButton(items,56,function()spawnitem("data/edited/gunpowder.xml",spawnRate);end);
tableButton(items,57,function()spawnitem("data/entities/props/physics_trap_circle_acid.xml",spawnRate);end);
tableButton(items,58,function()spawnitem("data/entities/props/physics_trap_electricity.xml",spawnRate);end);
tableButton(items,59,function()spawnitem("data/entities/props/physics_trap_ignite_a.xml",spawnRate);end);
tableButton(items,60,function()spawnitem("data/entities/props/physics_trap_ignite_b.xml",spawnRate);end);
tableButton(items,61,function()spawnitem("data/entities/props/physics_seamine.xml",spawnRate);end);
tableButton(items,62,function()spawnitem("data/entities/props/physics_chandelier.xml",spawnRate);end);
tableButton(items,63,function()spawnitem("data/entities/props/physics_brewing_stand.xml",spawnRate);end);
tableButton(teleporter,1,function()milk=world;end);
tableButton(teleporter,2,function()teleport(227,-80);end);
tableButton(teleporter,3,function()teleport(8735,-137);end);
tableButton(teleporter,4,function()teleport(3546,13003);end);
tableButton(teleporter,5,function()teleport(-1471,-1276);end);
tableButton(teleporter,6,function()teleport(-14068,-61);end);
tableButton(teleporter,7,function()teleport(-12885,127);end);
tableButton(teleporter,8,function()teleport(781,-1163);end);
tableButton(teleporter,9,function()teleport(2822,80);end);
tableButton(teleporter,10,function()teleport(7412,-59);end);
tableButton(teleporter,11,function()teleport(-1592,-814);end);
tableButton(teleporter,12,function()teleport(2361,807);end);
tableButton(teleporter,13,function()teleport(-725,1000);end);
tableButton(teleporter,14,function()teleport(-725,2550);end);
tableButton(teleporter,15,function()teleport(-725,4600);end);
tableButton(teleporter,16,function()teleport(-725,6150);end);
tableButton(teleporter,17,function()teleport(1911,13118);end);
tableButton(teleporter,18,function()teleport(6230,15151);end);
tableButton(teleporter,19,function()teleport(261,-26129);end);
tableButton(teleporter,20,function()teleport(190,17634);end);
tableButton(teleporter,21,function()teleport(-12909,12200);end);
tableButton(teleporter,22,function()teleport(2345,7388);end);
tableButton(teleporter,23,function()teleport(32129,-80);end);
tableButton(teleporter,24,function()teleport(-32129,-80);end);
tableButton(teleporter,25,function()teleport(math.random(-15000,15000),math.random(-150000,150000));end);
tableButton(teleporter,26,function()teleport(16129,-1988);end);
tableButton(teleporter,27,function()teleport(-5393,16500);end); -- water
tableButton(teleporter,28,function()teleport(-14062,370);end); -- fire
tableButton(teleporter,29,function()teleport(-14075,13535);end); -- spirit
tableButton(teleporter,30,function()teleport(-14075,16640);end);
tableButton(teleporter,31,function()teleport(15087,-3208);end);
tableButton(teleporter,32,function()teleport(-19748,-3420);end);
tableButton(teleporter,33,function()teleport(0,1000000);end);
tableButton(teleporter,34,function()teleport(0,-1000000);end);
tableButton(teleporter,35,function()teleport(-4354,10800);end);
tableButton(teleporter,36,function()teleport(-15446,-4700);end);
tableButton(TABLE_ALC,1,function()milk=open;end);
tableButton(TABLE_ALC,2,function()spawnitem("data/milk_alc/bone.xml",1);end);
tableButton(TABLE_ALC,3,function()spawnitem("data/milk_alc/brass.xml",1);end);
tableButton(TABLE_ALC,4,function()spawnitem("data/milk_alc/copper.xml",1);end);
tableButton(TABLE_ALC,5,function()spawnitem("data/milk_alc/creepingfungi.xml",1);end);
tableButton(TABLE_ALC,6,function()spawnitem("data/milk_alc/diamond.xml",1);end);
tableButton(TABLE_ALC,7,function()spawnitem("data/milk_alc/fungisoil.xml",1);end);
tableButton(TABLE_ALC,8,function()spawnitem("data/milk_alc/gold.xml",1);end);
tableButton(TABLE_ALC,9,function()spawnitem("data/milk_alc/lava.xml",1);end);
tableButton(TABLE_ALC,10,function()spawnitem("data/milk_alc/magicliquid.xml",1);end);
tableButton(TABLE_ALC,11,function()spawnitem("data/milk_alc/midas.xml",1);end);
tableButton(TABLE_ALC,12,function()spawnitem("data/milk_alc/midasprec.xml",1);end);
tableButton(TABLE_ALC,13,function()spawnitem("data/milk_alc/purifyingpowder.xml",1);end);
tableButton(TABLE_ALC,14,function()spawnitem("data/milk_alc/salt.xml",1);end);
tableButton(TABLE_ALC,15,function()spawnitem("data/milk_alc/silver.xml",1);end);
tableButton(TABLE_ALC,16,function()spawnitem("data/milk_alc/sodium.xml",1);end);
tableButton(TABLE_ALC,17,function()spawnitem("data/milk_alc/soil.xml",1);end);
tableButton(TABLE_ALC,18,function()spawnitem("data/milk_alc/sulphur.xml",1);end);
tableButton(TABLE_ALC,19,function()spawnitem("data/milk_alc/void.xml",1);end);
tableButton(TABLE_ALC,20,function()spawnitem("data/milk_alc/water.xml",1);end);
tableButton(TABLE_ALC,21,function()spawnitem("data/milk_alc/wormblood.xml",1);end);

for get,aperm in pairs(cardsPageOne) do
if aperm=="<-- Go Back" then
tableButton(cardsPageOne,1,function()milk=spawnables;end);
elseif aperm=="Next Page -->" then
tableButton(cardsPageOne,get,function()milk=spellstwo;end);
else
tableButton(cardsPageOne,get,function()local x,y=localplayerPos();CreateItemActionEntity(aperm,x,y);end);
end;
end;
for get,meet in pairs(cardsPageTwo) do
if meet=="<-- Last Page" then
tableButton(cardsPageTwo,1,function()milk=spells;end);
elseif meet=="Next Page -->" then
tableButton(cardsPageTwo,get,function()milk=spellsthree;end);
else
tableButton(cardsPageTwo,get,function()local x,y=localplayerPos();CreateItemActionEntity(meet,x,y);end);
end;
end;
for get,turt in pairs(cardsPageThree) do
if turt=="<-- Last Page" then
tableButton(cardsPageThree,1,function()milk=spellstwo;end);
else
tableButton(cardsPageThree,get,function()local x,y=localplayerPos();CreateItemActionEntity(turt,x,y);end);
end;
end;
for _,v in pairs(friendly) do
if v=="<-- Go Back" then
tableButton(friendly,1,function()milk=animals;end);
else
tableButton(friendly,_,function()spawnmonster(v,true,spawnRate);end);
end;
end;
for u,c in pairs(mean) do
if c=="<-- Go Back" then
tableButton(mean,1,function()milk=animals;end);
else
tableButton(mean,u,function()spawnmonster(c,false,spawnRate);end);
end;
end;
for curry,denzel in pairs(merks) do
if denzel=="<-- Go Back" then
tableButton(merks,1,function()milk=spawnables;end);
else
tableButton(merks,curry,function()local x,y=localplayerPos();perk_spawn(x,y-5,denzel);end);
end;
end;

milk=closed;
--newAction("CALL_OF_CTHULHU","Call of Cthulhu","Call the great one.","data/milk_gfx/call_of_cthulhu.png",ACTION_TYPE_PROJECTILE,"0,1,2,3,4,5,6,7,8,9,10,11","1,1,1,1,1,1,1,1,1,1,1,1",999999,650,666,"data/milk_cards/call_of_cthulhu_tentacle.xml",function()add_projectile("data/milk_cards/call_of_cthulhu.xml");end)
--soon


async_loop(function()
if gui~=nil then
GuiStartFrame(gui);
end;
if milk~=nil then
milk();
end;
wait(0);
end);
