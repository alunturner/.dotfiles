-- taken from https://github.com/catppuccin/wezterm/blob/main/plugin/init.lua
local catpuccin = {
	latte = {
		rosewater = "#dc8a78",
		flamingo = "#dd7878",
		pink = "#ea76cb",
		mauve = "#8839ef",
		red = "#d20f39",
		maroon = "#e64553",
		peach = "#fe640b",
		yellow = "#df8e1d",
		green = "#40a02b",
		teal = "#179299",
		sky = "#04a5e5",
		sapphire = "#209fb5",
		blue = "#1e66f5",
		lavender = "#7287fd",
		text = "#4c4f69",
		subtext1 = "#5c5f77",
		subtext0 = "#6c6f85",
		overlay2 = "#7c7f93",
		overlay1 = "#8c8fa1",
		overlay0 = "#9ca0b0",
		surface2 = "#acb0be",
		surface1 = "#bcc0cc",
		surface0 = "#ccd0da",
		crust = "#dce0e8",
		mantle = "#e6e9ef",
		base = "#eff1f5",
	},
	mocha = {
		rosewater = "#f5e0dc",
		flamingo = "#f2cdcd",
		pink = "#f5c2e7",
		mauve = "#cba6f7",
		red = "#f38ba8",
		maroon = "#eba0ac",
		peach = "#fab387",
		yellow = "#f9e2af",
		green = "#a6e3a1",
		teal = "#94e2d5",
		sky = "#89dceb",
		sapphire = "#74c7ec",
		blue = "#89b4fa",
		lavender = "#b4befe",
		text = "#cdd6f4",
		subtext1 = "#bac2de",
		subtext0 = "#a6adc8",
		overlay2 = "#9399b2",
		overlay1 = "#7f849c",
		overlay0 = "#6c7086",
		surface2 = "#585b70",
		surface1 = "#45475a",
		surface0 = "#313244",
		base = "#1e1e2e",
		mantle = "#181825",
		crust = "#11111b",
	},
}

-- this is an edited function to slim it down to the parts I'm using
local function select(isLatte)
	local c = isLatte and catpuccin.latte or catpuccin.mocha

	-- this gives an idea for how it's mapped in wezterm
	return {
		foreground = c.text,
		background = c.base,

		cursor_fg = isLatte and c.base or c.crust,
		cursor_bg = c.rosewater,
		cursor_border = c.rosewater,

		selection_fg = c.text,
		selection_bg = c.surface2,

		scrollbar_thumb = c.surface2,

		split = c.overlay0,

		ansi = {
			isLatte and c.subtext1 or c.surface1,
			c.red,
			c.green,
			c.yellow,
			c.blue,
			c.pink,
			c.teal,
			isLatte and c.surface2 or c.subtext1,
		},

		brights = {
			isLatte and c.subtext0 or c.surface2,
			c.red,
			c.green,
			c.yellow,
			c.blue,
			c.pink,
			c.teal,
			isLatte and c.surface1 or c.subtext0,
		},

		indexed = { [16] = c.peach, [17] = c.rosewater },
	}
end
