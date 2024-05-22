local Treesitter = {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	dependencies = { "nvim-treesitter/nvim-treesitter-textobjects" },
	build = ":TSUpdate",
}

Treesitter.config = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"css",
			"javascript",
			"lua",
			"typescript",
			"tsx",
			"vim",
			"vimdoc",
		},
		sync_install = false,
		auto_install = false,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
		textobjects = {
			select = {
				enable = true,
				lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
				keymaps = {
					["ac"] = "@call.outer",
					["ic"] = "@call.inner",
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["aa"] = "@parameter.outer",
					["ia"] = "@parameter.inner",
				},
			},
		},
	})
end

return { Treesitter }
