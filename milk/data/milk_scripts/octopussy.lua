dofile( "data/scripts/lib/utilities.lua" )

local player=GetUpdatedEntityID();
local px,py=EntityGetTransform(player);
local enemies=EntityGetWithTag("destruction_target");

local closeTo=0;
local closeEnemies={};

if enemies~=nil then
for i,v in ipairs(enemies) do
local ix,iy=EntityGetTransform(v);
local distance=math.sqrt(((px-ix)*(px-ix))+((py-iy)*(py-iy)));
if distance<65 and closeTo<10 then
closeEnemies[closeTo]={x=ix,y=iy};
closeTo=closeTo+1;
end;
end;   
end;
if closeTo>0 then
for i,enemy in pairs(closeEnemies) do
local ix=enemy.x;
local iy=enemy.y;
shoot_projectile(player,"data/entities/projectiles/tentacle.xml",px,py,ix-px,iy-py);
end;
end;