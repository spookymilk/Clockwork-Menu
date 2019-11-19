if not async then
  dofile("data/scripts/lib/coroutines.lua");
end;
dofile("data/scripts/lib/utilities.lua")
dofile("data/clockwork_scripts/functions.lua");


async_loop(function()
wait(0);
local x,y=localplayerPos();
local rando=math.random(-500,500);
GameCreateParticle("blood",x+rando,y-500,2,0,100,false,false);
GameCreateParticle("blood",x+rando,y-500,5,0,100,false,false);
GameCreateParticle("blood",x+rando,y-500,3,0,100,false,false);
GameCreateParticle("blood",x+rando,y-500,1,0,100,false,false);
setTime(0.47752);
end);