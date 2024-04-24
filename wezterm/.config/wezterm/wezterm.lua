-- Pull in the wezterm API
local wezterm = require("wezterm")

-- This will hold the configuration.
local config = wezterm.config_builder()

-- This is where you actually apply your config choices
-- For example, changing the color scheme:
config.color_scheme = "cyberpunk"
config.font = wezterm.font("JetBrainsMonoNL Nerd Font")
-- >>> TODO add colour configuration
-- https://wezfurlong.org/wezterm/config/appearance.html#defining-your-own-colors

-- and finally, return the configuration to wezterm
return config
