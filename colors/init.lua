-- nb this will move into the pax file when it is in lua
local colors = {
	-- Colors
	midnight = "#19191f",
	cream = "#e9e7dd",
	hibiscus = "#ff007b",
	red = "#e61919",
	orange = "#e68019",
	green = "#14b814",

	-- Shade ramp
	grey20 = "#333333",
	grey30 = "#4d4d4d",
	grey60 = "#999999",
	grey70 = "#b3b3b3",
	grey80 = "#cccccc",
	grey90 = "#e6e6e6",
}

local theme = {
	dark = {
		bg = colors.midnight,
		bg_plus = colors.grey20,
		bg_plus_plus = colors.grey30,
		mg = colors.grey60,
		fg_minus_minus = colors.grey70,
		fg_minus = colors.grey80,
		fg = colors.grey90,
		cursor_bg = colors.hibiscus,
		error = colors.red,
		warning = colors.orange,
		success = colors.green,
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
