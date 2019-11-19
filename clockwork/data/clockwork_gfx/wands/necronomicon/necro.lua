dofile("data/scripts/lib/utilities.lua")
dofile("data/scripts/gun/procedural/gun_action_utils.lua")

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )
SetRandomSeed( x, y )

local ability_comp = EntityGetFirstComponent( entity_id, "AbilityComponent" )

local gun = { }
gun.name = {"Necronomicon"}
gun.deck_capacity = 1
gun.actions_per_round = 1
gun.reload_time = 3
gun.shuffle_deck_when_empty = 0
gun.fire_rate_wait = 3
gun.spread_degrees = 3
gun.speed_multiplier = 2
gun.mana_charge_speed = 901901901
gun.mana_max = 601601601
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