if not async then
  dofile("data/scripts/lib/coroutines.lua");
end;
dofile("data/scripts/lib/utilities.lua");
dofile("data/scripts/perks/perk.lua");
dofile("data/scripts/gun/gun_actions.lua" );
dofile("data/clockwork_scripts/functions.lua"); -- yeah yeah.
dofile("data/clockwork_scripts/tables.lua");
local gui=GuiCreate();
local clockwork=nil;
local closed,main,spawnables,player,scripts,items,weapon,cobj,timed,obj,cspells,cperks,spells,tp,settings,choiceofanimal,friendlyanimals,enemyanimals;
local back;
local page=1;
local XSET=0;
local lastUpdate="Updated for 'Build Dec 20 2019 - 13:20:30'";
local BH=EntityLoad("data/clockwork_xml/entities/teleken.xml",99999,99999);

local function list(tab,func)
local totalperpage=math.sqrt(math.deg(math.pi/2)+10)+10;
local total=math.ceil(#tab/totalperpage);
local set=(page-math.exp(0))*totalperpage;
begin(gui,1,12);
for i=1,totalperpage do
local yivo=tab[i+set];
if yivo==nil then break end;
if button(gui,0,0,yivo.name or yivo.ui_name,1) then
if func~=nil then func(yivo) elseif yivo.func~=nil then yivo.func(yivo) end;
end;
end;
endit(gui);
if total>1 then
begin(gui,3.5,71.5)
GuiText(gui,2.5,4,tostring(page).."/"..tostring(total))
endit(gui)
end;
if page==1 then
begin(gui,1,73);
if button(gui,0,0,"Back",1) then
clockwork=back;
end;
endit(gui);
end;
if page==1 and back==closed then
begin(gui,1,95);
GuiText(gui,0,0,lastUpdate);
endit(gui);
end;
if page>1 then
begin(gui,1,73);
if button(gui,0,0,"Back",1) then
page=page-1;
end;
if button(gui,0,0,"First",1) then
page=1;
end;
endit(gui);
end;
if page<total then
begin(gui,8,73);
if page>9 then
XSET=4;
else
XSET=0;
end;
if button(gui,XSET,0,"Next",1) then
page=page+1;
end;
if button(gui,XSET,0,"Last",1) then
page=total;
end;
endit(gui);
end;
end;

closed=function()
quickGui(gui,45,0,function()if button(gui,0,0,"Open",1) then clockwork=main;end;end);
end;
main=function()
list({
{name="Player",func=function()clockwork=player;end;},
{name="Scripts",func=function()clockwork=scripts;end;},
{name="Items",func=function()clockwork=items;end;},
{name="Weapons",func=function()clockwork=weapon;end;},
{name="World",func=function()clockwork=world;end;},
{name="Animals",func=function()clockwork=animals;end;},
{name="Settings",func=function()clockwork=settings;end;}});
back=closed;
end;
items=function()
list({
{name="Objects",func=function()clockwork=obj;end;},
{name="Custom Objects",func=function()clockwork=cobj;end;},
{name="Spells",func=function()clockwork=spells;end;},
{name="Custom Spells",func=function()clockwork=cspells;end;},
{name="Perks",func=function()clockwork=perks;end;},
{name="Custom Perks",func=function()clockwork=cperks;end;},
{name="Flasks",func=function()clockwork=flasks;end;},
});
back=main;
end;
obj=function()
list(objects,object);
back=items;
end;
weapon=function()
list(weapons,object);
back=main;
end;
cobj=function()
list(customobjects,object);
back=items;
end;
spells=function()
list(actions,spell);
back=items;
end;
cspells=function()
list(customspells,cspell);
back=items;
end;
cperks=function()
list(customperks,cperk);
back=items;
end;
perks=function()
list(perk_list,perk);
back=items;
end;
flasks=function()
list(materials,flask);
back=items;
end;
choiceofanimal=function()
list({
{name="Friendly Animals",func=function()clockwork=friendlyanimals;end;},
{name="Mean Animals",func=function()clockwork=enemyanimals;end;},
});
back=animals;
end;
enemyanimals=function()
list(allanimals,enemy);
back=choiceofanimal;
end;
friendlyanimals=function()
list(allanimals,friendly);
back=choiceofanimal;
end;
animals=function()
list({
{name="Animals",func=function()clockwork=choiceofanimal;end;},
{name="Custom Animals",func=function()clockwork=customanim;end;},
});
back=main;
end;
customanim=function()
list(customanimal,animalfunc);
back=animals;
end;
world=function()
list({
{name="Weather",func=function()clockwork=weather;end;},
{name="Time",func=function()clockwork=timed;end;},
{name="Teleport",func=function()clockwork=tp;end;},
--{name="Disasters",func=function()clockwork=disaster;end;}, some time
});
back=main;
end;
tp=function()
list(locations,teleport);
back=world;
end;
scripts=function()
list(script,run);
back=main;
end;
--disaster=function()
--list(disasters,dis);
--back=world;
--end;
player=function()
list(playerset,play);
back=main;
end;
timed=function()
list(times,btf);
back=world;
end;
settings=function()
list(setting,dosetting);
back=main;
end;
weather=function()
list(weath,er);
back=world;
end;

clockwork=closed;

async_loop(function()
if gui~=nil then
GuiStartFrame(gui);
end;
if clockwork~=nil then
clockwork();
end;
wait(0);
end);