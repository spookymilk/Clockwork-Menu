if not async then
  dofile("data/scripts/lib/coroutines.lua");
end;
dofile("data/scripts/lib/utilities.lua");
dofile("data/clockwork_scripts/functions.lua");

coords=false;
tel=false;
clocks=false;
rain=false;
mousehook=false;
noclip=false;
tank=false;
rainbowlight=false;
special_rain=false;
infgold=false;
currentforcefield="none";
hentai=false;
superhero=false;
thor=false;
round=false;
onground=false;
stats=false;
special_rain_path="";
rain_mat="";
rain_den=0;
rain_grav=0;
minvel=0;
maxvel=0;
rain_bounce=false;
rain_long=false;
local gui=GuiCreate();
local X=GuiText(gui,0,50,"");
local Y=GuiText(gui,0,50,"");
local clocked=GuiText(gui,0,50,"");
local rounded=GuiText(gui,0,50,"");
--local BH=EntityLoad("data/clockwork_xml/entities/teleken.xml");

async_loop(function()
if coords==true then
local x,y=localplayerPos();
X=GuiText(gui,1,0,"X: "..tostring(x));
Y=GuiText(gui,1,10,"Y: "..tostring(y));
elseif coords==false then
X=GuiText(gui,0,250,"");
Y=GuiText(gui,0,250,"");
end;
if clocks==true then
CURRENT_TIME=getTime();
HOUR=string.sub(tostring(CURRENT_TIME),3,3);
MINUTES=string.sub(tostring(CURRENT_TIME),4,5);
local AMORPM="";
if HOUR=="1" or HOUR=="2" or HOUR=="3" or HOUR=="4" or HOUR=="5" then
AMORPM="PM";
else
AMORPM="AM";
end;
clocked=GuiText(gui,145,0,HOUR..":"..MINUTES.." "..AMORPM);
elseif clocks==false then
clocked=GuiText(gui,0,250,"");
end;
if rain==true then
local x,y=localplayerPos();
GameEmitRainParticles(rain_den*3.4,1060,rain_mat,minvel,maxvel,rain_grav,rain_bounce,true);
elseif rain==false then
rain_mat="";
rain_den=0;
rain_grav=0;
minvel=0;
maxvel=0;
rain_bounce=false;
rain_long=false;
end;
if special_rain==true then
local x,y=localplayerPos();
local rando=math.random(-500,500);
EntityLoad(special_rain_path,x+rando,y-500);
elseif special_rain==false then
special_rain_path="";
end;
if thor==true then
local mx,my=DEBUG_GetMouseWorld();
local button=buttondown("mButtonDownFire2");
if button then
shootToMouse(localplayer(),"data/entities/projectiles/thunderball.xml",mx,my);
end;
end;
if tank==true then
local mx,my=DEBUG_GetMouseWorld();
local button=buttondown("mButtonDownFire2");
if button then
shootToMouse(localplayer(),"data/entities/projectiles/rocket_tank.xml",mx,my);
end;
end;
if hentai==true then
local mx,my=DEBUG_GetMouseWorld();
local button=buttondown("mButtonDownFire2");
if button then
shootToMouse(localplayer(),"data/entities/projectiles/deck/tentacle.xml",mx,my);
shootToMouse(localplayer(),"data/entities/projectiles/smalltentacle.xml",mx,my);
end;
end;
if tel==true then
local mx,my=DEBUG_GetMouseWorld();
local button=buttondown("mButtonDownFire2");
local buttonKick=buttondown("mButtonDownKick");
local buttonDown=buttondown("mButtonDownDown");
if button then
grabAnimal("destruction_target",25);
grab("tablet",25);
grab("item_physics",25);
grab("mortal",25);
grab("prop",25);
grab("prop_physics",25);
grab("teleportable_NOT",25);
grabAnimal("helpless_animal",25);
grab("hittable",25);
grab("sacred_barrel",25);
end;
if button and buttonKick then
GameCreateParticle("spark_red",mx,my,1,math.random(-100,100),math.random(-100,100),true);
killMouse("destruction_target",25);
killMouse("helpless_animal",25);
end;
if button and buttonDown then
GameCreateParticle("spark_teal",mx,my,1,math.random(-100,100),math.random(-100,100),true);
local x,y=DEBUG_GetMouseWorld();
local BH=EntityGetWithName("TELEKEN_TEST");
if BH~=nil then
EntitySetTransform(BH,x,y);--chunk();
end;
end;
if not buttonDown then
local BH=EntityGetWithName("TELEKEN_TEST");
if BH~=nil then
EntitySetTransform(BH,99999,99999);
end;
end;
end;
if noclip==true then
local px,py=localplayerPos();
local buttonUp=buttondown("mButtonDownUp");
local buttonDown=buttondown("mButtonDownDown");
local buttonLeft=buttondown("mButtonDownLeft");
local buttonRight=buttondown("mButtonDownRight");
if buttonUp then
move(localplayer(),px,py-1);
end;
if buttonDown then
move(localplayer(),px,py+1);
end;
if buttonLeft then
move(localplayer(),px-1,py);
end;
if buttonRight then
move(localplayer(),px+1,py);
end;
end;
if infgold==true then
editCIP("WalletComponent","money",2147483647);
end;
if mousehook==true then
local mx,my=DEBUG_GetMouseWorld();
local button=buttondown("mButtonDownFire2");
local ex,ey=DEBUG_GetMouseWorld();
move(localplayer(),ex,ey);
if button then
mousehook=false;
end;
end;
if round==true then
rounded=GuiText(gui,145,10,StatsGetValue("playtime_str"));
elseif round==false then
rounded=GuiText(gui,0,50,"");
end;
if currentforcefield=="burn" then
burn(localplayer(),"tablet",32);
burn(localplayer(),"item_physics",32);
burn(localplayer(),"prop",32);
burn(localplayer(),"prop_physics",32);
burn(localplayer(),"sacred_barrel",32);
burn(localplayer(),"enemy",32);
elseif currentforcefield=="destroy" then
destroy(localplayer(),"tablet",32,"smoke");
destroy(localplayer(),"item_physics",32,"smoke");
destroy(localplayer(),"prop",32,"smoke");
destroy(localplayer(),"prop_physics",32,"smoke");
destroy(localplayer(),"sacred_barrel",32,"smoke");
destroy(localplayer(),"enemy",32,"smoke");
elseif currentforcefield=="midas" then
convertField(localplayer(),"enemy",32,"gold");
convertField(localplayer(),"prop",32,"gold");
convertField(localplayer(),"item_physics",32,"gold");
convertField(localplayer(),"prop_physics",32,"gold");
convertField(localplayer(),"sacred_barrel",32,"gold");
convertField(localplayer(),"tablet",32,"gold");
convertField(localplayer(),"projectile",32,"gold");
elseif currentforcefield=="kill" then
kill(localplayer(),"destruction_target",32);
end;
wait(0);
end);

async_loop(function()
if gui~=nil then
GuiStartFrame(gui);
end;
wait(0);
end);