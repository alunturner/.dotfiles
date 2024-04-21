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
					-- You can use the capture groups defined in textobjects.scm
					["ax"] = "@attribute.outer",
					["ix"] = "@attribute.inner",
					["ac"] = "@call.outer",
					["ic"] = "@call.inner",
					["a/"] = "@comment.outer",
					["i/"] = "@comment.inner",
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["aa"] = "@parameter.outer",
					["ia"] = "@parameter.inner",
					["ar"] = "@regex.outer",
					["ir"] = "@regex.inner",
				},
			},
			swap = {
				enable = true,
				swap_next = {
					["<leader>x"] = "@attribute.inner",
					["<leader>a"] = "@parameter.inner",
				},
				swap_prev = {
					["<leader>X"] = "@attribute.inner",
					["<leader>A"] = "@parameter.inner",
				},
			},
			move = {
				enable = true,
				set_jumps = true, -- whether to set jumps in the jumplist
				goto_next_start = {
					["]x"] = "@attribute.outer",
					["]c"] = "@call.outer",
					["]/"] = "@comment.outer",
					["]f"] = "@function.outer",
					["]a"] = "@parameter.outer",
					["]r"] = "@regex.outer",
				},
				goto_previous_start = {
					["[x"] = "@attribute.outer",
					["[c"] = "@call.outer",
					["[/"] = "@comment.outer",
					["[f"] = "@function.outer",
					["[a"] = "@parameter.outer",
					["[r"] = "@regex.outer",
				},
			},
		},
	})

	-- Make moves repeatable
	local repeat_move = require("nvim-treesitter.textobjects.repeatable_move")
	-- vim way: ; goes to the direction you were moving.
	vim.keymap.set({ "n", "x", "o" }, ";", repeat_move.repeat_last_move)
	vim.keymap.set({ "n", "x", "o" }, ",", repeat_move.repeat_last_move_opposite)
	-- Optionally, make builtin f, F, t, T also repeatable with ; and ,
	vim.keymap.set({ "n", "x", "o" }, "f", repeat_move.builtin_f)
	vim.keymap.set({ "n", "x", "o" }, "F", repeat_move.builtin_F)
	vim.keymap.set({ "n", "x", "o" }, "t", repeat_move.builtin_t)
	vim.keymap.set({ "n", "x", "o" }, "T", repeat_move.builtin_T)
end

return { Treesitter }
