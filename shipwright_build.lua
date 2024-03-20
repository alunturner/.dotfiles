-- shipwright_build.lua

local lushwright = require("shipwright.transform.lush")
run(
	{},
	-- generate lua code
	lushwright.to_lua,
	-- write the lua code into our destination.
	-- you must specify open and close markers yourself to account
	-- for differing comment styles, patchwrite isn't limited to lua files.
	{ patchwrite, "colors/colorscheme.lua", "-- PATCH_OPEN", "-- PATCH_CLOSE" }
)
