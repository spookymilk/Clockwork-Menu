dofile( "data/scripts/lib/utilities.lua" )

-- this is just an edited attract_items, serves the same purpose.
-- unlike attract_items, gathers components such as tables, chairs, crates, oil containers, skulls, bones, and probably a heap of other things.
-- more of a curse?

local entity_id = GetUpdatedEntityID()
local x, y = EntityGetTransform( entity_id )

local items = EntityGetWithTag( "item_physics" )
local more_items=EntityGetWithTag("mortal"); -- this may be a curse..

if ( items ~= nil) then
	for i,item_id in ipairs(items) do	
		local px, py = EntityGetTransform( item_id )
		
		local distance = math.abs( x - px ) + math.abs( y - py )
		local distance_full=250; -- aa huh.
		
		if ( distance < distance_full * 1.25 ) then
			distance = math.sqrt( ( x - px ) ^ 2 + ( y - py ) ^ 2 )
			direction = 0 - math.atan2( ( y - py ), ( x - px ) )
	
			if ( distance < distance_full ) then
				local physicscomponents = EntityGetComponent( item_id, "PhysicsBodyComponent" )
				
				if ( physicscomponents ~= nil ) then
					local vel_x = math.cos( direction ) * 45; -- aa huh.
					local vel_y = 0 - math.sin( direction ) * 45; -- aa huh.
					
					PhysicsApplyForce( item_id, vel_x, vel_y )
				end
			end
		end
	end
end

if ( more_items ~= nil) then
	for i,more_items_id in ipairs(more_items) do	
		local px, py = EntityGetTransform( more_items_id )
		
		local distance = math.abs( x - px ) + math.abs( y - py )
		local distance_full=250; -- aa huh.
		
		if ( distance < distance_full * 1.25 ) then
			distance = math.sqrt( ( x - px ) ^ 2 + ( y - py ) ^ 2 )
			direction = 0 - math.atan2( ( y - py ), ( x - px ) )
	
			if ( distance < distance_full ) then
				local physicscomponents = EntityGetComponent( more_items_id, "PhysicsBodyComponent" )
				
				if ( physicscomponents ~= nil ) then
					local vel_x = math.cos( direction ) * 45; -- aa huh.
					local vel_y = 0 - math.sin( direction ) * 45; -- aa huh.
					
					PhysicsApplyForce( more_items_id, vel_x, vel_y )
				end
			end
		end
	end
end
