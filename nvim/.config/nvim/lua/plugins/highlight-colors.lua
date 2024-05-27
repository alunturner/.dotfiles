local HighlightColors = {
	"brenoprata10/nvim-highlight-colors",
	version = "*",
	event = "VeryLazy",
	config = function()
		local plugin = require("nvim-highlight-colors")
		plugin.setup({ enable_tailwind = true })
		plugin.turnOff()
	end,
}

vim.keymap.set("n", "<leader>th", "<cmd>HighlightColors Toggle<cr>", { silent = true })

return { HighlightColors }
