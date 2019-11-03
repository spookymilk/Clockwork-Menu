dofile("data/scripts/lib/utilities.lua")
dofile("data/scripts/gun/procedural/gun_action_utils.lua")
dofile("data/milk_cards/god_of_thunder.lua");

function get_random_from( target )
	local rnd = Random(1, #target)
	
	return tostring(target[rnd])
end

function get_multiple_random_from( target, amount_ )
	local amount = amount_ or 1
	
	local result = {}
	
	for i=1,amount do
		local rnd = Random(1, #target)
		
		table.insert(result, tostring(target[rnd]))
	end
	
	return result
end

function get_random_between_range( target )
	local minval = target[1]
	local maxval = target[2]
	
	return Random(minval, maxval)
end

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )
SetRandomSeed( x, y )

local ability_comp = EntityGetFirstComponent( entity_id, "AbilityComponent" )

local gun = { }
gun.name = {"Mjolnir"}
gun.deck_capacity = {1,1}
gun.actions_per_round = 2
gun.reload_time = {6,8}
gun.shuffle_deck_when_empty = 0
gun.fire_rate_wait = {1,3}
gun.spread_degrees = 0
gun.speed_multiplier = 6
gun.mana_charge_speed = {119,120}
gun.mana_max = {10000,10000}
-- Note(Petri): Removed DYNAMITE
gun.actions = {"LIGHTNING","LIGHTNING","ELECTRIC_CHARGE","ARC_ELECTRIC","TORCH_ELECTRIC"}

local mana_max = get_random_between_range( gun.mana_max )
local deck_capacity = get_random_between_range( gun.deck_capacity )

ComponentSetValue( ability_comp, "ui_name", get_random_from( gun.name ) )

ComponentObjectSetValue( ability_comp, "gun_config", "reload_time", get_random_between_range( gun.reload_time ) )
ComponentObjectSetValue( ability_comp, "gunaction_config", "fire_rate_wait", get_random_between_range( gun.fire_rate_wait ) )
ComponentSetValue( ability_comp, "mana_charge_speed", get_random_between_range( gun.mana_charge_speed) )

ComponentObjectSetValue( ability_comp, "gun_config", "actions_per_round", gun.actions_per_round )
ComponentObjectSetValue( ability_comp, "gun_config", "deck_capacity", deck_capacity )
ComponentObjectSetValue( ability_comp, "gun_config", "shuffle_deck_when_empty", gun.shuffle_deck_when_empty )
ComponentObjectSetValue( ability_comp, "gunaction_config", "spread_degrees", gun.spread_degrees )
ComponentObjectSetValue( ability_comp, "gunaction_config", "speed_multiplier", gun.speed_multiplier )

ComponentSetValue( ability_comp, "mana_max", mana_max )
ComponentSetValue( ability_comp, "mana", mana_max )

AddGunActionPermanent( entity_id, gun.actions[1])
AddGunActionPermanent( entity_id, gun.actions[2])
AddGunActionPermanent( entity_id, gun.actions[3])
AddGunActionPermanent( entity_id, gun.actions[4])
AddGunActionPermanent( entity_id, gun.actions[5])
AddGunActionPermanent(entity_id,"THUNDERBALL");

