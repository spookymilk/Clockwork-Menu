dofile( "data/scripts/lib/utilities.lua" )

-- this is just an edited attract_items, serves the same purpose.
-- unlike attract_items, gathers components such as tables, chairs, crates, oil containers, skulls, bones, and probably a heap of other things.
-- more of a curse?

local entity_id = GetUpdatedEntityID()

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

attract(entity_id,"item_physics",250,45,45);
attract(entity_id,"mortal",250,45,45);
--attract(entity_id,"helpless_animal",250,45,45);
attract(entity_id,"teleportable_NOT",250,45,45);