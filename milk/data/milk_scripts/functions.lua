function attract(entity,attractionTag,theDistance,strengthX,strengthY)
local ex,ey=EntityGetTransform(entity);
local allWithTag=EntityGetWithTag(attractionTag);
if allWithTag~=nil then
for _,v in pairs(allWithTag) do
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
function convertField(entity,attractionTag,theDistance,material)
local ex,ey=EntityGetTransform(entity);
local allWithTag=EntityGetWithTag(attractionTag);
if allWithTag~=nil then
for _,v in pairs(allWithTag) do
local ix,iy=EntityGetTransform(v);
local distance=math.abs(ex-ix)+math.abs(ey-iy);
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
for _,v in pairs(enemies) do
local ix,iy=EntityGetTransform(v);
local distance=math.sqrt(((ex-ix)*(ex-ix))+((ey-iy)*(ey-iy)));
if distance<distanceTo and range<maxAttack then
tempTable[range]={X=ix,Y=iy};
range=range+1;
end;
end;
end;
if range>0 then
for _,v in pairs(tempTable) do
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
for _,v in pairs(enemies) do
local ix,iy=EntityGetTransform(v);
local distance=math.sqrt(((ex-ix)*(ex-ix))+((ey-iy)*(ey-iy)));
if distance<distanceTo and range<maxAttack then
tempTable[range]={X=ix,Y=iy};
range=range+1;
end;
end;
end;
if range>0 then
for _,v in pairs(tempTable) do
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
function addFeet(entity,numberOfFeet)
local x,y=EntityGetTransform(entity);
for i=1,numberOfFeet do
local feet=EntityLoad("data/entities/misc/perks/attack_foot/limb_walker.xml",x,y);
EntityAddChild(entity,feet);
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
