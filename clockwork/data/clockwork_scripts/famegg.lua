dofile_once("data/scripts/lib/utilities.lua")

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )

local components = EntityGetComponent( entity_id, "VariableStorageComponent" )
local entity_list_name = "monsters"

if ( components ~= nil ) then
	for key,comp_id in pairs(components) do
		local var_name = ComponentGetValue( comp_id, "name" )
		if ( var_name == "entity_list" ) then
			entity_list_name = ComponentGetValue( comp_id, "value_string" )
		end
	end
end

local entity_lists = 
{
monsters = { {"boss_dragon"}},
}

SetRandomSeed( x - 437, y + 235 )

local options = entity_lists[entity_list_name]
local opts = #options
local rnd = 1

for i=1,opts do
	rnd = math.min(rnd + math.min(math.max(Random(1, 8) - 7, 0), 1), opts)
end

local entity_to_spawn = options[rnd][1] or "zombie"
local entity_count = options[rnd][2] or 1

local option = "data/entities/animals/" .. entity_to_spawn .. ".xml"

for j=1,entity_count do
	local eid = EntityLoad( option, x, y )

	if ( entity_list_name ~= "worms" ) then
		GetGameEffectLoadTo( eid, "CHARM", true )

		local damagemodels = EntityGetComponent( eid, "DamageModelComponent" )
		if( damagemodels ~= nil ) then
			for i,damagemodel in ipairs(damagemodels) do
				local max_hp = tonumber( ComponentGetValue( damagemodel, "max_hp" ) )

				max_hp = max_hp * 3
				
				ComponentSetValue( damagemodel, "max_hp", max_hp )
				ComponentSetValue( damagemodel, "hp", max_hp )
			end
		end
	end
end