local w = require("wezterm")

local config = w.config_builder()

-- COLOR SCHEMES
local pax_hibiscus = "#ff007b"
local pax_cream = "#e9e7dd"
local d = w.get_builtin_color_schemes()["Catppuccin Mocha (Gogh)"]
d.cursor_bg = pax_hibiscus
d.foreground = pax_cream

local l = w.get_builtin_color_schemes()["Catppuccin Latte (Gogh)"]
l.cursor_bg = pax_hibiscus

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
config.send_composed_key_when_left_alt_is_pressed = true -- make opt+3 = # on Mac

return config
