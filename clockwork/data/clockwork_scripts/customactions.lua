dofile("data/clockwork_scripts/functions.lua");
dofile("data/clockwork_scripts/tables.lua");

addAction(actions,"PAGE_MXXXII","Page MXXXII",[[Page MXXXII of the Necronomicon. Its use is unknown.]],"data/clockwork_gfx/spells/necronomicon/necropage.png",ACTION_TYPE_PROJECTILE,19060,"data/clockwork_gfx/spells/necronomicon/page_mxxxii.xml",
function()
for i=1,6 do
c.spread_degrees=c.spread_degrees+i+0.5;
add_projectile("data/clockwork_gfx/spells/necronomicon/projectile/page_mxxxii.xml");
end;
c.extra_entities=c.extra_entities.."data/entities/misc/homing.xml,";
draw_actions(1,true);
c.fire_rate_wait=c.fire_rate_wait+7;
end);
addAction(actions,"PAGE_DCCLVI","Page DCCLVI",[[Page DCCLVI of the Necronomicon. Flood the world with blood.]],"data/clockwork_gfx/spells/necronomicon/necropage.png",ACTION_TYPE_PROJECTILE,19060,"data/clockwork_gfx/spells/necronomicon/page_dcclvi.xml",
function()
add_projectile("data/clockwork_gfx/spells/necronomicon/projectile/page_dcclvi.xml");
c.fire_rate_wait=c.fire_rate_wait+13;
end);
addAction(actions,"PAGE_XVI","Page XVI",[[Page XVI of the Necronomicon. Projects a few lasers.]],"data/clockwork_gfx/spells/necronomicon/necropage.png",ACTION_TYPE_PROJECTILE,10610,"data/clockwork_gfx/spells/necronomicon/page_xvi.xml",
function()
add_projectile("data/clockwork_gfx/spells/necronomicon/projectile/page_xvi.xml");
c.fire_rate_wait=c.fire_rate_wait-22;
c.game_effect_entities=c.game_effect_entities.."data/entities/misc/effect_apply_on_fire.xml,";
current_reload_time=current_reload_time-280;
end);
addAction(actions,"POWER_STONE","Power Stone",[[A stone as old as the universe. Source of raw power.]],"data/clockwork_gfx/spells/infinity_stones/power_stone.png",ACTION_TYPE_PROJECTILE,900000000,"data/clockwork_gfx/spells/infinity_stones/power_stone.xml",
function()
local DD=math.random(1,500);
if DD>=400 then -- so far this
add_projectile("data/clockwork_gfx/spells/infinity_stones/projectile/power_stone_powerblast.xml");
c.fire_rate_wait=c.fire_rate_wait-25; -- pretty much the global for all stones
current_reload_time=current_reload_time-20; -- pretty much the global for all stones
else
add_projectile("data/clockwork_gfx/spells/infinity_stones/projectile/power_stone_powerball.xml");
c.fire_rate_wait=c.fire_rate_wait-25; -- pretty much the global for all stones
current_reload_time=current_reload_time-20; -- pretty much the global for all stones
end;
end);
addAction(actions,"TIME_STONE","Time Stone",[[A stone as old as the universe. Source of all time.]],"data/clockwork_gfx/spells/infinity_stones/time_stone.png",ACTION_TYPE_PROJECTILE,950000000,"data/clockwork_gfx/spells/infinity_stones/time_stone.xml",
function()
local DD=math.random(1,100);
if DD>=50 then
add_projectile("data/clockwork_gfx/spells/infinity_stones/projectile/time_stone_forwards.xml");
c.fire_rate_wait=c.fire_rate_wait-25; -- pretty much the global for all stones
current_reload_time=current_reload_time-20; -- pretty much the global for all stones
local stime=getTime()+math.random(0.10,0.99);
setTime(stime);
else
add_projectile("data/clockwork_gfx/spells/infinity_stones/projectile/time_stone_backwards.xml");
c.fire_rate_wait=c.fire_rate_wait-25; -- pretty much the global for all stones
current_reload_time=current_reload_time-20; -- pretty much the global for all stones
local stime=getTime()-math.random(0.10,0.99);
setTime(stime);
end;
end);
addAction(actions,"SOUL_STONE","Soul Stone",[[A stone as old as the universe. Source of the living.]],"data/clockwork_gfx/spells/infinity_stones/soul_stone.png",ACTION_TYPE_PROJECTILE,940000000,"data/clockwork_gfx/spells/infinity_stones/soul_stone.xml",
function()
local DD=math.random(1,100);
if DD>=50 then
add_projectile("data/clockwork_gfx/spells/infinity_stones/projectile/soul_stone_necro.xml");
c.fire_rate_wait=c.fire_rate_wait-25; -- pretty much the global for all stones
current_reload_time=current_reload_time-20; -- pretty much the global for all stones
else
add_projectile("data/clockwork_gfx/spells/infinity_stones/projectile/soul_stone_charm.xml");
c.fire_rate_wait=c.fire_rate_wait-25; -- pretty much the global for all stones
current_reload_time=current_reload_time-20; -- pretty much the global for all stones
end;
end);
addAction(actions,"REALITY_STONE","Reality Stone",[[A stone as old as the universe. Source of reality.]],"data/clockwork_gfx/spells/infinity_stones/reality_stone.png",ACTION_TYPE_PROJECTILE,970000000,"data/clockwork_gfx/spells/infinity_stones/reality_stone.xml",
function()
local DD=math.random(1,1000);
if DD>=1000 then
ConvertEverythingToGold(); -- this should be rare.
GameScreenshake(100);
elseif DD>=875 and DD<=999 then
add_projectile("data/clockwork_gfx/spells/infinity_stones/projectile/reality_stone_xml/reality_crumble.xml");
GameScreenshake(60);
add_projectile("data/clockwork_gfx/spells/infinity_stones/projectile/reality_stone_item.xml");
elseif DD>=100 and DD<=874 then
add_projectile("data/clockwork_gfx/spells/infinity_stones/projectile/reality_stone_enemy.xml");
local randomMat=math.random(1,#materials);
local mat=materials[randomMat].name;
convertFromMouse("enemy",150,tostring(mat:lower()));
convertFromMouse("helpless_animal",150,tostring(mat:lower()));
GameScreenshake(50);
elseif DD<=99 then
add_projectile("data/clockwork_gfx/spells/infinity_stones/projectile/reality_stone_particle.xml");
local randomMat=math.random(1,#materials);
local mat=materials[randomMat].name;
GameCreateParticle(tostring(mat:lower()),math.random(-45000,45000),math.random(-45000,45000),900000,math.random(-5000,5000),math.random(-5000,5000),false,false) -- this is actually really dangerous
GameScreenshake(75);
end;
end);
addAction(actions,"MIND_STONE","Mind Stone",[[A stone as old as the universe. Source of all energy.]],"data/clockwork_gfx/spells/infinity_stones/mind_stone.png",ACTION_TYPE_PROJECTILE,50000,"data/clockwork_gfx/spells/infinity_stones/mind_stone.xml",
function()
add_projectile("data/clockwork_gfx/spells/infinity_stones/projectile/mind_stone_beam.xml");
c.fire_rate_wait=c.fire_rate_wait-999; 
current_reload_time=current_reload_time-999;
end);
addAction(actions,"RED_LASER","Red Laser",[[The weakest of lasers.]],"data/clockwork_gfx/spells/lasers/redlaser.png",ACTION_TYPE_PROJECTILE,15,"data/clockwork_gfx/spells/lasers/redlaser.xml",
function()
add_projectile("data/clockwork_gfx/spells/lasers/proj/redlaser.xml")
c.fire_rate_wait = c.fire_rate_wait - 12
shot_effects.recoil_knockback = shot_effects.recoil_knockback + 10.0
end);