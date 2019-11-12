dofile("data/functions.lua");
script_log(function()
function runScript(file)
return assert(loadfile(file))();
end;
runScript("data/milk.lua");
end);

-- very basic logger that works on non dev-builds to reduce the need of checking logger.txt

