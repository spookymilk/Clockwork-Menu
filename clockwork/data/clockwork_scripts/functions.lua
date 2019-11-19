dofile("data/scripts/lib/utilities.lua");

function begin(parent,x,y)
return GuiLayoutBeginVertical(parent,x,y);
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
function teleport(teleport)
EntitySetTransform(localplayer(),teleport.x,teleport.y);
end;
function er(er)
if er.needsconstant==true then
local status=er.toggled;
if status==true then
er.name=string.gsub(er.name," <ON>","");
local func=er.execOff;
func();
er.toggled=false;
elseif status==false then
er.name=er.name.." <ON>";
local func=er.execOn;
func();
er.toggled=true;
end;
end;
end;
function run(run)
if run.cantoggle==true then
local placeholder;
local status=run.toggled;
if status==true then
run.name=string.gsub(run.name," <ON>","");
local findKey=EntityGetWithName(run.key);
if findKey~=nil then
EntityKill(findKey);
end;
run.toggled=false;
elseif status==false then
run.name=run.name.." <ON>";
local x,y=localplayerPos();
placeholder=EntityLoad(run.path..run.filename..".xml",x,y-30);
EntityAddChild(localplayer(),placeholder);
run.toggled=true;
end;
elseif cantoggle==false then
local x,y=localplayerPos();
EntityLoad(run.path..run.filename..".xml",x,y-30);
end;
end;
function dosetting(setting)
if setting.cantoggle==true then
local status=setting.toggled;
if status==true then
setting.name=string.gsub(setting.name," <ON>","");
local func=setting.execOff;
func();
setting.toggled=false;
elseif status==false then
setting.name=setting.name.." <ON>";
local func=setting.execOn;
func();
setting.toggled=true;
end;
elseif setting.cantoggle==false then
local func=setting.execOn;
func();
end;
end;
function animalfunc(animal)
local x,y=localplayerPos();
EntityLoad(animal.path..animal.filename..".xml",x,y-30);
end;
function play(play)
if play.cantoggle==true then
local status=play.toggled;
local placeholder;
if play.isxmlbased==true then
if status==true then
play.name=string.gsub(play.name," <ON>","");
local findKey=EntityGetWithName(play.key);
if findKey~=nil then
EntityKill(findKey);
end;
play.toggled=false;
elseif status==false then
play.name=play.name.." <ON>";
placeholder=EntityLoad(play.path..play.filename..".xml");
EntityAddChild(localplayer(),placeholder);
play.toggled=true;
end;
elseif play.isxmlbased==false then
if status==true then
play.name=string.gsub(play.name," <ON>","");
local func=play.execOff;
func();
play.toggled=false;
elseif status==false then
play.name=play.name.." <ON>";
local func=play.execOn;
func();
play.toggled=true;
end;
end;
end;
end;
function clone(theTable)
local newOne={};
if type(theTable)=="table" then
for i,v in ipairs(theTable) do
newOne[i]=v;
end;
else
newOne=theTable;
end;
return newOne;
end;
function quickGui(dave,x,y,func)
local parent=dave;
begin(parent,x,y);
local buttons=func;
buttons();
endit(parent);
end;
function getAllMaterial(theTable)
for _,v in ipairs{"Fires","Solids","Gases","Sands","Liquids"} do
local material=getfenv()["CellFactory_GetAll"..v]();
table.sort(material);
for i,v in ipairs(material) do
table.insert(theTable,{name=v});
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
function cap(theTable)
for i,v in ipairs(theTable) do
local first=v:sub(1,1);
local rest=v:sub(2);
theTable[i]=first:upper()..rest;
end;
end;
function editCIP(component,inside,value)
local cip=EntityGetComponent(localplayer(),component);
if cip~=nil then
for i,v in pairs(cip) do
ComponentSetValue(v,inside,value);
end;
end;
end;
function editMIP(component,inside,value)
local cip=EntityGetComponent(localplayer(),component);
if cip~=nil then
for i,v in pairs(cip) do
ComponentSetMetaCustom(v,inside,value);
end;
end;
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
function attract(entity,attractionTag,theDistance,strengthX,strengthY)
local ex,ey=EntityGetTransform(entity);
local allWithTag=EntityGetWithTag(attractionTag);
if allWithTag~=nil then
for _,v in ipairs(allWithTag) do
local ix,iy=EntityGetTransform(v);
local distance=math.abs(ex-ix)+math.abs(ey-iy);
local maxDistance=theDistance;
if distance<maxDistance*1.25 then
distance=math.sqrt((ex-ix)^2+(ey-iy)^2);
direction=0-math.atan2((ey-iy),(ex-ix));
if distance<maxDistance then
local getPhysicsComp=EntityGetComponent(v,"PhysicsBodyComponent");
if getPhysicsComp~=nil then
local xVel=math.cos(direction)*strengthX;
local yVel=0-math.sin(direction)*strengthY;
PhysicsApplyForce(v,xVel,yVel);
end;
end;
end;
end;
end;
end;
function addAction(TABLE,ID,NAME,DESCRIPTION,SPRITE,TYPE,MANA,XML,ACTION)
table.insert(TABLE,{
id          = ID,
name 		= NAME,
description = DESCRIPTION,
sprite 		= SPRITE,
type 		= TYPE,
mana = MANA,
custom_xml_file = XML,
action 		= ACTION,
});
end;
function spell(spell)
local x,y=localplayerPos();
CreateItemActionEntity(spell.id:lower(),x,y);
end;
function cspell(cspell)
local x,y=localplayerPos();
CreateItemActionEntity(cspell.spellname:lower(),x,y);
end;
function perk(perk)
local x,y=localplayerPos();
perk_spawn(x,y-5,perk.id);
end;
function flask(flask)
local x,y=localplayerPos();
local stock=EntityLoad("data/clockwork_xml/entities/potion_stock.xml",x,y);
AddMaterialInventoryMaterial(stock,flask.name:lower(),1000);
end;
function object(object)
local x,y=localplayerPos();
local stock=EntityLoad(object.path..object.filename..".xml",x,y-30);
end;
function btf(btf)
setTime(btf.timeofday);
end;
function convertField(entity,attractionTag,theDistance,material)
local ex,ey=EntityGetTransform(entity);
local allWithTag=EntityGetWithTag(attractionTag);
if allWithTag~=nil then
for _,v in ipairs(allWithTag) do
local ix,iy=EntityGetTransform(v);
local distance=math.abs(ex+-ix)+math.abs(ey-iy);
local maxDistance=theDistance;
if distance<maxDistance*1.25 then
EntityConvertToMaterial(v,material);
EntityKill(v);
end;
end;
end;
end;
function attackCore(entity,attackTag,distanceTo,maxAttack,projectiles)
local ex,ey=EntityGetTransform(entity);
local enemies=EntityGetWithTag(attackTag);
local tempTable={};
local range=0;
if enemies~=nil then
for _,v in ipairs(enemies) do
local ix,iy=EntityGetTransform(v);
local distance=math.sqrt(((ex-ix)*(ex-ix))+((ey-iy)*(ey-iy)));
if distance<distanceTo and range<maxAttack then
tempTable[range]={X=ix,Y=iy};
range=range+1;
end;
end;
end;
if range>0 then
for _,v in ipairs(tempTable) do
local ix=v.X;
local iy=v.Y;
shoot_projectile(entity,projectiles,ex,ey,ix-ex,iy-ey);
end;
end;
end;
function attackOffset(entity,attackTag,distanceTo,offsetX,offsetY,maxAttack,projectiles)
local ex,ey=EntityGetTransform(entity);
local enemies=EntityGetWithTag(attackTag);
local tempTable={};
local range=0;
if enemies~=nil then
for _,v in ipairs(enemies) do
local ix,iy=EntityGetTransform(v);
local distance=math.sqrt(((ex-ix)*(ex-ix))+((ey-iy)*(ey-iy)));
if distance<distanceTo and range<maxAttack then
tempTable[range]={X=ix,Y=iy};
range=range+1;
end;
end;
end;
if range>0 then
for _,v in ipairs(tempTable) do
local ix=v.X;
local iy=v.Y;
shoot_projectile(entity,projectiles,ex+offsetX,ey+offsetY,ix-ex,iy-ey);
end;
end;
end;
function attackRaw(entity,offsetX,offsetY,specialX,specialY,projectiles)
local ex,ey=EntityGetTransform(entity);
shoot_projectile(entity,projectiles,ex+offsetX,ey+offsetY,specialX*ex,specialY*ey);
end;
function addFeet(entity,numberOfFeet,typeOf)
local x,y=EntityGetTransform(entity);
if typeOf==1 then
for i=1,numberOfFeet do
local feet=EntityLoad("data/entities/misc/perks/attack_foot/limb_walker.xml",x,y);
EntityAddChild(entity,feet);
end;
elseif typeOf==2 then
for i=1,numberOfFeet do
local feet=EntityLoad("data/milk_edited/green_legs.xml",x,y);
EntityAddChild(entity,feet);
end;
elseif typeOf==3 then
for i=1,numberOfFeet do
local feet=EntityLoad("data/milk_edited/boss_leg.xml",x,y);
EntityAddChild(entity,feet);
end;
elseif typeOf==4 then
for i=1,numberOfFeet do
local feet=EntityLoad("data/milk_edited/unknown_leg.xml",x,y);
EntityAddChild(entity,feet);
end;
end;
end;
function removeFeet(entity,numberOfFeet)
for i=1,numberOfFeet do
local spiderleg=EntityGetWithName("WE_ALL_FLOAT_DOWN_HERE");
if spiderleg~= nil then
EntityKill(spiderleg);
else
GamePrint("Spider leg not found!");
end;
end;
end;
