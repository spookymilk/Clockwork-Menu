function begin(parent,x,y)
return GuiLayoutBeginVertical(parent,x,y);
end;
function randomHexRainbow()
local rainbow={0xFF00FF00,0xFFFF0000,0xFF0000FF,0xFFFFD700,0xFFFFFF00,0xFF00FFFF,0xFF7B68EE,0xFFFF00FF,0xFF4B0082,0xFFFF1493};
return rainbow[math.random(1,10)];
end;
function endit(parent)
return GuiLayoutEnd(parent);
end;
function button(parent,x,y,text,status)
return GuiButton(parent,x,y,text,status);
end;
function localplayer()
return EntityGetWithTag("player_unit")[1];
end;
function localplayerPos()
return EntityGetTransform(localplayer());
end;
function tableCount(tableGuy)
local total=0;
for _,v in pairs(tableGuy) do
total=total+1;
end;
return total;
end;
function tableButton(tableGuy,value,func)
for i,def in pairs(tableGuy) do
if (tableGuy[i] == tableGuy[value]) then
tableGuy[i]={tableGuy[i],func};
end;
end;
end;
function setHealth(entity,health,maxhealth)
local damagemodels=EntityGetComponent( entity,"DamageModelComponent");
if damagemodels~=nil then
for i,damagemodel in pairs(damagemodels) do		
ComponentSetValue(damagemodel,"hp",health);
ComponentSetValue(damagemodel,"max_hp",maxhealth);
end;
end;
end;
function teleport(x,y)
EntitySetTransform(localplayer(),x,y);
end;
function setTime(timer)
local world_entity_id=GameGetWorldStateEntity();
local test=EntityGetComponent(world_entity_id,"WorldStateComponent");
if test~=nil then
for i,yuh in pairs(test) do		
ComponentSetValue(yuh,"time",timer);
end;
end;
end;
function huntNKill(entity)
local ent=EntityGetAllChildren(localplayer());
for _,v in pairs(ent) do
if v==entity then
EntityKill(v);
end;
end;
end;
function getSeed()
local seed=tonumber(StatsGetValue("world_seed"));
return seed;
end;
function loadability(player,playerPos,ability)
local x,y=playerPos;
local entity=EntityLoad(ability,x,y);
EntityAddChild(player,entity);
end;
function loadabilityraw(player,ability)
local x,y=localplayerPos();
local entity=EntityLoad(ability,x,y-10);
EntityAddChild(player,entity);
end;
function spawnitem(item,spawnrate)
for i=1,spawnrate do
local x,y=localplayerPos();
EntityLoad(item,x,y-18);
end;
end;
function spawnmonster(monsters,friendly,rate)
if friendly==true then
local x,y=localplayerPos();
for i=1,rate do
local monster=EntityLoad("data/entities/animals/" .. monsters .. ".xml",x,y+8);
GetGameEffectLoadTo(monster,"CHARM",true);
end;
elseif friendly==false then
local x,y=localplayerPos();
for i=1,rate do
EntityLoad("data/entities/animals/" .. monsters .. ".xml",x,y+8);
end;
end;
end;
function getTime()
local world_entity_id=GameGetWorldStateEntity();
local test=EntityGetComponent(world_entity_id,"WorldStateComponent");
if test~=nil then
for i,yuh in pairs(test) do		
local dah=ComponentGetValue(yuh,"time");
return dah;
end;
end;
end;
function addCards(tableGuy,startIndex,endIndex,currentPage,isMorePages)
for i,v in pairs(tableGuy) do
if i>=startIndex and i<=endIndex then
local nelly={};
table.insert(nelly,v.id);
for p,t in pairs(nelly) do
table.insert(currentPage,t);
end;
end;
end;
if isMorePages==true then
table.insert(currentPage,"Next Page -->");
end;
end;
function getChildren(ofwhat)
local guys=EntityGetAllChildren(ofwhat);
for i=1,#guys do
return EntityGetName(guys[i]);
end;
end;
function editComponentInsidePlayer(component,componentChild,value)
local comp=EntityGetComponent(localplayer(),component);
if comp~=nil then
for i,x in pairs(comp) do		
ComponentSetValue(x,componentChild,value);
end;
end;
end;
function editMetaComponentInsidePlayer(component,componentChild,value)
local comp=EntityGetComponent(localplayer(),component);
if comp~=nil then
for i,x in pairs(comp) do		
ComponentSetMetaCustom(x,componentChild,value);
end;
end;
end;
function editComponentInsideWorld(component,componentChild,value)
local world_entity_id=GameGetWorldStateEntity();
local comp=EntityGetComponent(world_entity_id,component);
if comp~=nil then
for i,x in pairs(comp) do		
ComponentSetValue(x,componentChild,value);
end;
end;
end;
function compareComponentInsideWorld(component,componentChild,value)
local world_entity_id=GameGetWorldStateEntity();
local comp=EntityGetComponent(world_entity_id,component);
if comp~=nil then
for i,x in pairs(comp) do		
return ComponentGetValue(x,componentChild);
end;
end;
end;
function setPlayer(character,arm,ragdoll,cape,script)
local player=localplayer();
local arm_r=nil;
local children=EntityGetAllChildren(player);
if children~=nil then
for _,v in pairs(children) do
local spec=EntityGetName(v);
if spec=="arm_r" then
arm_r=v;
end;
end;
end;
local playerSprite=EntityGetFirstComponent(player,"SpriteComponent");
local playerArmSprite=EntityGetFirstComponent(arm_r,"SpriteComponent");
local playerRagdoll=EntityGetFirstComponent(player,"DamageModelComponent");
ComponentSetValue(playerSprite,"image_file",character);
ComponentSetValue(playerArmSprite,"image_file",arm);
ComponentSetValue(playerRagdoll,"ragdoll_filenames_file",ragdoll);
local findOld=EntityGetWithName("cape");
local findScript=EntityGetWithName("PLAYER_APPEARANCE_SCRIPT");
if findOld~=nil then
EntityKill(findOld);
end;
if findScript~=nil then
EntityKill(findScript);
end;
local x,y=localplayerPos();
local CAP=EntityLoad(cape,x,y);
EntityAddChild(player,CAP);
loadabilityraw(player,script);
end;