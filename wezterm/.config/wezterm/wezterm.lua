local w = require("wezterm")

local config = w.config_builder()

-- COLOR SCHEME
-- See https://wezfurlong.org/wezterm/config/lua/wezterm/get_builtin_color_schemes.html
-- for details of how these thees can be altered (like we do the cursor)
local hibiscus = "hsl:330 100 50"
local tempWhite = "#e9e7dd"
local d = w.get_builtin_color_schemes()["Github Dark (Gogh)"]
d.cursor_bg = hibiscus
d.foreground = tempWhite

local l = w.get_builtin_color_schemes()["Github Light (Gogh)"]
l.cursor_bg = hibiscus

config.color_schemes = {
	["light"] = l,
	["dark"] = d,
}

config.color_scheme = "dark"

-- FONT
config.font = w.font("JetBrainsMonoNL Nerd Font")
config.font_size = 15

-- COMMAND PALETTE
config.command_palette_font_size = 18

-- OTHER
config.enable_tab_bar = false
config.window_decorations = "RESIZE"
config.window_padding = {
	left = 0,
	top = 0,
	right = 0,
	bottom = 0,
}
return config
