local w = require("wezterm")

local config = w.config_builder()

-- COLOR SCHEMES
config.color_schemes = {
	["light"] = w.get_builtin_color_schemes()["Catppuccin Latte (Gogh)"],
	["dark"] = w.get_builtin_color_schemes()["Catppuccin Mocha (Gogh)"],
}
config.color_scheme = "dark"

-- FONT
config.font = w.font("JetBrainsMonoNL Nerd Font")
config.font_size = 15

-- COMMAND PALETTE, ADD ENTRY FOR THEME TOGGLE PLUS HANDLER
config.command_palette_font_size = 18
w.on("augment-command-palette", function()
	return {
		{
			brief = "Toggle light/dark mode",
			action = w.action.EmitEvent("toggle-colorscheme"),
		},
	}
end)
w.on("toggle-colorscheme", function(window)
	local overrides = window:get_config_overrides() or {}
	if not overrides.color_scheme then
		overrides.color_scheme = "light"
	else
		overrides.color_scheme = nil
	end
	window:set_config_overrides(overrides)
end)

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
