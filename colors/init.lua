-- nb this will move into the pax file when it is in lua
local colors = {
	-- Colors
	midnight = "#19191f",
	cream = "#e9e7dd",
	hibiscus = "#ff007b",

	-- Shade ramp
	dark = "",
	dark_plus = "",
	dark_plus_plus = "",
	mid = "",
	bright_minus_minus = "",
	bright_minus = "",
	bright = "",
}

local theme = {
	dark = {
		bg = "",
		bg_plus = "",
		bg_plus_plus = "",
		mg = "",
		fg_minus_minus = "",
		fg_minus = "",
		fg = "",
		cursor_bg = "",
		cursor_fg = "",
		error = "",
		warning = "",
		success = "",
		higlights = {},
	},
	light = {
		bg = "",
		bg_plus = "",
		bg_plus_plus = "",
		mg = "",
		fg_minus_minus = "",
		fg_minus = "",
		fg = "",
		cursor_bg = "",
		cursor_fg = "",
		error = "",
		warning = "",
		success = "",
		higlights = {},
	},
}

return { theme, colors }
