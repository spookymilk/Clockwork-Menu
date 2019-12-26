dofile("data/scripts/lib/utilities.lua");
dofile("data/scripts/gun/procedural/gun_action_utils.lua")

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
function buttondown(button)
local test=EntityGetComponent(localplayer(),"ControlsComponent");
if test~=nil then
for i,yuh in pairs(test) do		
local dah=ComponentGetValue(yuh,button);
if dah=="1" then
return true;
else
return false;
end;
end;
end;
end;
function run(run)
if run.isspecial==true then
if run.cantoggle==true then
local status=run.toggled;
if status==true then
run.name=string.gsub(run.name," <ON>","");
local func=run.specialOff;
func();
run.toggled=false;
elseif status==false then
run.name=run.name.." <ON>";
local x,y=localplayerPos();
local func=run.specialOn;
func();
run.toggled=true;
end;
end;
elseif run.isspecial==false then
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
function createGun(name,entity,fp,mcs,mm,maii,rf,irm,sraii,spa,tai,ugs,atca,atcap,apr,sdwe,rt,dc,frw,sd)
local px,py=localplayerPos();
local jj=sd; -- palceholder for now
local gun=EntityLoad("data/clockwork_gfx/wands/blank_wand/blank_wand.xml",px,py);
local gac=EntityGetComponent(gun,"AbilityComponent");
local ghc=EntityGetComponent(gun,"HotspotComponent");
local glc=EntityGetComponent(gun,"LuaComponent");
if gac~=nil then
for i,v in ipairs(gac) do
ComponentSetValue(v,"entity_file",entity);
ComponentSetValue(v,"fast_projectile",fp);
ComponentSetValue(v,"mana_charge_speed",mcs);
ComponentSetValue(v,"mana_max",mm);
ComponentSetValue(v,"max_amount_in_inventory",maii);
ComponentSetValue(v,"reload_time_frames",rf);
ComponentSetValue(v,"item_recoil_max",irm);
ComponentSetValue(v,"shooting_reduces_amount_in_inventory",sraii);
--ComponentSetValue(v,"sprite_file",sprite);
ComponentSetValue(v,"swim_propel_amount",spa);
ComponentSetValue(v,"throw_as_item",tai);
ComponentSetValue(v,"ui_name",name);
ComponentSetValue(v,"use_gun_script",ugs);
ComponentObjectSetValue(v,"gun_config","actions_per_round",apr);
ComponentObjectSetValue(v,"gun_config","shuffle_deck_when_empty",sdwe);
ComponentObjectSetValue(v,"gun_config","reload_time",rt);
ComponentObjectSetValue(v,"gun_config","deck_capacity",dc);
ComponentObjectSetValue(v,"gunaction_config","fire_rate_wait",frw);
--ComponentObjectSetValue(v,"gunaction_config","spread_degrees",sd);
end;
end;
for b,v in ipairs(atca) do
AddGunAction(gun,v);
end;
for pb,v in ipairs(atcap) do
AddGunActionPermanent(gun,v);
end;
if glc~=nil then
for i,v in ipairs(glc) do
ComponentSetValue(v,"_enabled","1");
end;
end;
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
else
GamePrint("KEY ERROR: "..play.key.." not found for "..play.name);
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
if play.cantoggle==false and play.key=="IS_STATIC_NO_CHILD" then
play.count=play.count+1;
play.name="Spawn Clone ("..play.count.." Active)";
local placeholder=EntityLoad(play.path..play.filename..".xml");
EntitySetTransform(placeholder,localplayerPos());
end;
if play.cantoggle==false and play.key=="SPIDERLEGS_SPECIAL" then
if play.type=="none" then
play.type="normal";
play.name="Spider <"..play.type..">";
addFeet(localplayer(),8,play.type);
elseif play.type=="normal" then
play.type="lukki_tiny";
play.name="Spider <"..play.type..">";
removeFeet(localplayer(),8);
addFeet(localplayer(),8,play.type);
elseif play.type=="lukki_tiny" then
play.type="lukki_normal";
play.name="Spider <"..play.type..">";
removeFeet(localplayer(),8);
addFeet(localplayer(),8,play.type);
elseif play.type=="lukki_normal" then
play.type="lukki_long";
play.name="Spider <"..play.type..">";
removeFeet(localplayer(),8);
addFeet(localplayer(),8,play.type);
elseif play.type=="lukki_long" then
play.type="lukki_long2";
play.name="Spider <"..play.type..">";
removeFeet(localplayer(),8);
addFeet(localplayer(),8,play.type);
elseif play.type=="lukki_long2" then
play.type="boss";
play.name="Spider <"..play.type..">";
removeFeet(localplayer(),8);
addFeet(localplayer(),8,play.type);
elseif play.type=="boss" then
play.type="none";
play.name="Spider <"..play.type..">";
removeFeet(localplayer(),8);
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
function send(text)
GamePrint(text);
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
function editCIP(component,inside,value)
local cip=EntityGetComponent(localplayer(),component);
if cip~=nil then
for i,v in pairs(cip) do
ComponentSetValue(v,inside,value);
end;
end;
end;
function editCIE(entity,component,inside,value)
local cip=EntityGetComponent(entity,component);
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
function editCIR(component,inside,value,other)
local cip=EntityGetComponent(other,component);
if cip~=nil then
for i,v in pairs(cip) do
ComponentSetValue(v,inside,value);
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
id=ID,
name=NAME,
description=DESCRIPTION,
sprite=SPRITE,
type=TYPE,
mana=MANA,
price=0,
custom_xml_file=XML,
action=ACTION,
});
end;
function addPerk(TABLE,ID,UI_NAME,UI_DESC,UI_ICON,PERK_ICON,STACKABLE,GAME_EFFECT,FUNC)
table.insert(TABLE,{
id=ID;
ui_name=UI_NAME;
ui_description=UI_DESC;
ui_icon=UI_ICON;
perk_icon=PERK_ICON;
stackable=STACKABLE;
game_effect=GAME_EFFECT;
func=FUNC;
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
function cperk(cperk)
local x,y=localplayerPos();
perk_spawn(x,y-5,cperk.perkname);
end;
function flask(flask)
local x,y=localplayerPos();
local stock=EntityLoad("data/clockwork_xml/entities/potion_stock.xml",x,y);
AddMaterialInventoryMaterial(stock,flask.name:lower(),1000);
end;
function enemy(enemy)
local x,y=localplayerPos();
local monster=EntityLoad("data/entities/animals/"..enemy.filename..".xml",x,y-30);
end;
function friendly(friendly)
local x,y=localplayerPos();
local monster=EntityLoad("data/entities/animals/"..friendly.filename..".xml",x,y-30);
GetGameEffectLoadTo(monster,"CHARM",true);
end;
function object(object)
local x,y=localplayerPos();
if object.isweapon==true then
if object.scripted==true then
local func=object.script;
func();
else
local stock=EntityLoad(object.path..object.filename..".xml",x,y);
end;
else
local stock=EntityLoad(object.path..object.filename..".xml",x,y-30);
end;
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
function kill(entity,attractionTag,theDistance)
local ex,ey=EntityGetTransform(entity);
local allWithTag=EntityGetWithTag(attractionTag);
if allWithTag~=nil then
for _,v in ipairs(allWithTag) do
local ix,iy=EntityGetTransform(v);
local distance=math.abs(ex+-ix)+math.abs(ey-iy);
local maxDistance=theDistance;
if distance<maxDistance*1.25 then
for i=1,8 do
shoot_projectile(entity,"data/entities/projectiles/buckshot.xml",ix,iy,1,1);
end;
end;
end;
end;
end;
function shootMaterial(entity,material)
local ex,ey=EntityGetTransform(entity);
local mx,my=DEBUG_GetMouseWorld();
local xDis=math.abs(ex+-mx);
if mx>=ex then
GameCreateParticle(material,ex+5,ey,1,ex*xDis*7,0,false)
elseif mx<=ex then
GameCreateParticle(material,ex+5,ey,1,ex*xDis*7,0,false)
end;
end;
function killMouse(attractionTag,theDistance)
local ex,ey=DEBUG_GetMouseWorld();
local allWithTag=EntityGetWithTag(attractionTag);
if allWithTag~=nil then
for _,v in ipairs(allWithTag) do
local ix,iy=EntityGetTransform(v);
local distance=math.abs(ex+-ix)+math.abs(ey-iy);
local maxDistance=theDistance;
if distance<maxDistance*1.25 then
shoot_projectile(entity,"data/entities/projectiles/buckshot.xml",ix,iy,1,1);
end;
end;
end;
end;
function grab(attractionTag,theDistance)
local ex,ey=DEBUG_GetMouseWorld();
local px,py=localplayerPos();
local allWithTag=EntityGetWithTag(attractionTag);
if allWithTag~=nil then
for _,v in ipairs(allWithTag) do
local ix,iy,ir,isx,isy=EntityGetTransform(v);
local distance=math.abs(ex+-ix)+math.abs(ey-iy);
local maxDistance=theDistance*math.sqrt(isx,isy);
if distance<maxDistance*1.25 then
PhysicsSetStatic(v,false);
local neutral=45*math.sqrt(isx*isy);
if ix>=ex then
PhysicsApplyForce(v,neutral*-0.25,0);
elseif ix<=ex then
PhysicsApplyForce(v,neutral*0.25,0);
end;
if iy>=ey then
PhysicsApplyForce(v,0,neutral*-0.25);
elseif iy<=ey then
PhysicsApplyForce(v,0,neutral*0.25);
end;
end;
end;
end;
end;
function grabAnimal(attractionTag,theDistance)
local ex,ey=DEBUG_GetMouseWorld();
local px,py=localplayerPos();
local allWithTag=EntityGetWithTag(attractionTag);
if allWithTag~=nil then
for _,v in ipairs(allWithTag) do
local ix,iy,ir,isx,isy=EntityGetTransform(v);
local distance=math.abs(ex+-ix)+math.abs(ey-iy);
local maxDistance=theDistance*math.sqrt(isx,isy);
if distance<maxDistance*1.25 then
PhysicsSetStatic(v,false);
EntitySetTransform(v,ex,ey);
end;
end;
end;
end;
function chunk()
local ex,ey=DEBUG_GetMouseWorld();
LooseChunk(ex,ey, "data/collapse_masks/big/3.png");
end;
function move(entity,x,y)
EntitySetTransform(entity,x,y);
end;
function addLight(entity,radi,red,green,blue)
local light=EntityAddComponent(entity,"LightComponent",{radius=radi,r=red,g=green,b=blue});
end;
function removeLight(entity)
local light=EntityGetFirstComponent(entity,"LightComponent");
if light~=nil then
EntityRemoveComponent(entity,light);
end;
end;
function convertFromMouse(attractionTag,theDistance,material)
local ex,ey=DEBUG_GetMouseWorld();
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
function shootToMouse(entity,proj,x,y)
local ex,ey=EntityGetTransform(entity);
shoot_projectile(entity,proj,ex,ey-5,x-ex,y-ey);
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
if typeOf=="normal" then
for i=1,numberOfFeet do
local feet=EntityLoad("data/entities/misc/perks/attack_foot/limb_walker.xml",x,y);
EntityAddChild(entity,feet);
end;
elseif typeOf=="lukki_tiny" then
for i=1,numberOfFeet do
local feet=EntityLoad("data/entities/animals/lukki/lukki_feet/lukki_limb_tiny.xml",x,y);
EntityAddChild(entity,feet);
end;
elseif typeOf=="lukki_normal" then
for i=1,numberOfFeet do
local feet=EntityLoad("data/entities/animals/lukki/lukki_feet/lukki_limb.xml",x,y);
EntityAddChild(entity,feet);
end;
elseif typeOf=="lukki_long" then
for i=1,numberOfFeet do
local feet=EntityLoad("data/entities/animals/lukki/lukki_feet/lukki_limb_long.xml",x,y);
EntityAddChild(entity,feet);
end;
elseif typeOf=="lukki_long2" then
for i=1,numberOfFeet do
local feet=EntityLoad("data/entities/animals/lukki/lukki_feet/lukki_limb_long2.xml",x,y);
EntityAddChild(entity,feet);
end;
elseif typeOf=="boss" then
for i=1,numberOfFeet do
local feet=EntityLoad("data/entities/animals/boss_centipede/limbs/limb_long.xml",x,y);
EntityAddChild(entity,feet);
end;
end;
end;
function removeFeet(entity,numberOfFeet)
for i=1,numberOfFeet do
local spiderleg=EntityGetWithName("CLOCKWORK_SPIDER_LEGS");
if spiderleg~= nil then
EntityKill(spiderleg);
else
GamePrint("Spider leg not found!");
end;
end;
end;
