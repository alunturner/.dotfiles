local HighlightColors = {
	"brenoprata10/nvim-highlight-colors",
	pin = true,
	version = "*",
	opts = { enable_tailwind = true },
	config = function()
		require("nvim-highlight-colors").turnOff()
	end,
}

return { HighlightColors }
