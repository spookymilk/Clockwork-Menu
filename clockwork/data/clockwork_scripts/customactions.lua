dofile("data/clockwork_scripts/functions.lua");

addAction(actions,"PAGE_MXXXII","Page MXXXII",[[Page MXXXII of the Necronomicon. Its use is unknown.]],"data/clockwork_gfx/spells/necronomicon/necropage.png",ACTION_TYPE_PROJECTILE,600600600,"data/clockwork_gfx/spells/necronomicon/page_mxxxii.xml",
function()
for i=1,6 do
c.spread_degrees=c.spread_degrees+i+0.5;
add_projectile("data/clockwork_gfx/spells/necronomicon/projectile/page_mxxxii.xml");
end;
c.extra_entities=c.extra_entities.."data/entities/misc/homing.xml,";
draw_actions(1,true);
c.fire_rate_wait=c.fire_rate_wait+7;
end);
addAction(actions,"PAGE_DCCLVI","Page DCCLVI",[[Page DCCLVI of the Necronomicon. Flood the world with blood.]],"data/clockwork_gfx/spells/necronomicon/necropage.png",ACTION_TYPE_PROJECTILE,600600600,"data/clockwork_gfx/spells/necronomicon/page_dcclvi.xml",
function()
add_projectile("data/clockwork_gfx/spells/necronomicon/projectile/page_dcclvi.xml");
c.fire_rate_wait=c.fire_rate_wait+13;
end);
addAction(actions,"PAGE_XVI","Page XVI",[[Page XVI of the Necronomicon. Projects a few lasers.]],"data/clockwork_gfx/spells/necronomicon/necropage.png",ACTION_TYPE_PROJECTILE,106106106,"data/clockwork_gfx/spells/necronomicon/page_xvi.xml",
function()
add_projectile("data/clockwork_gfx/spells/necronomicon/projectile/page_xvi.xml");
c.fire_rate_wait=c.fire_rate_wait-22;
c.game_effect_entities=c.game_effect_entities.."data/entities/misc/effect_apply_on_fire.xml,";
current_reload_time=current_reload_time-280;
end);