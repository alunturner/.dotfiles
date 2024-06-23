local parsers = { "css", "javascript", "lua", "typescript", "tsx", "vim", "vimdoc" }
local Treesitter = {
	"nvim-treesitter/nvim-treesitter",
	pin = true,
	build = ":TSUpdate",
	main = "nvim-treesitter.configs",
	opts = {
		ensure_installed = parsers,
		sync_install = false,
		auto_install = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	},
}

return { Treesitter }
