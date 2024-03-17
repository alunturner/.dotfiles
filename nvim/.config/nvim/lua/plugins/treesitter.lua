local Treesitter = {
	"nvim-treesitter/nvim-treesitter",
	lazy = false,
	build = ":TSUpdate",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
	},
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
					-- You can use the capture groups defined in textobjects.scm
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["at"] = "@tag.outer",
					["it"] = "@tag.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]f"] = "@function.outer",
				},
				goto_previous_start = {
					["[f"] = "@function.outer",
				},
			},
		},
	})
end

return { Treesitter }
