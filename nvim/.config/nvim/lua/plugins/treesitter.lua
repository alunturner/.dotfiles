local parsers = { "css", "javascript", "lua", "typescript", "tsx", "vim", "vimdoc" }

require("nvim-treesitter").configs.setup({
	ensure_installed = parsers,
	sync_install = false,
	auto_install = false,
	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
})
