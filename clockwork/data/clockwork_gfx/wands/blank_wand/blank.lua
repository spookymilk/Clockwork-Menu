dofile("data/scripts/lib/utilities.lua")
dofile("data/scripts/gun/procedural/gun_action_utils.lua")

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )
SetRandomSeed( x, y )

local ability_comp = EntityGetFirstComponent( entity_id, "AbilityComponent" )

local gun = { }
gun.name = gun.name
gun.deck_capacity = gun.deck_capacity
gun.actions_per_round = gun.actions_per_round
gun.reload_time = gun.reload_time
gun.shuffle_deck_when_empty = gun.shuffle_deck_when_empty
gun.fire_rate_wait = gun.fire_rate_wait
gun.spread_degrees = gun.spread_degrees
gun.speed_multiplier = gun.speed_multiplier
gun.mana_charge_speed = gun.mana_charge_speed
gun.mana_max = gun.mana_max
gun.actions = gun.actions

local mana_max = gun.mana_max
local deck_capacity = gun.deck_capacity

ComponentSetValue( ability_comp, "ui_name", gun.name)

ComponentObjectSetValue( ability_comp, "gun_config", "reload_time", gun.reload_time )
ComponentObjectSetValue( ability_comp, "gunaction_config", "fire_rate_wait", gun.fire_rate_wait )
ComponentSetValue( ability_comp, "mana_charge_speed", gun.mana_charge_speed)

ComponentObjectSetValue( ability_comp, "gun_config", "actions_per_round", gun.actions_per_round )
ComponentObjectSetValue( ability_comp, "gun_config", "deck_capacity", deck_capacity )
ComponentObjectSetValue( ability_comp, "gun_config", "shuffle_deck_when_empty", gun.shuffle_deck_when_empty )
ComponentObjectSetValue( ability_comp, "gunaction_config", "spread_degrees", gun.spread_degrees )
ComponentObjectSetValue( ability_comp, "gunaction_config", "speed_multiplier", gun.speed_multiplier )

ComponentSetValue( ability_comp, "mana_max", mana_max )
ComponentSetValue( ability_comp, "mana", mana_max )