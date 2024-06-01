local HighlightColors = {
	"brenoprata10/nvim-highlight-colors",
	pin = true,
	version = "*",
	config = function()
		local plugin = require("nvim-highlight-colors")
		plugin.setup({ enable_tailwind = true })
		plugin.turnOff()
	end,
}

return { HighlightColors }
