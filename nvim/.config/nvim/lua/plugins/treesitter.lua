local parsers = { "css", "javascript", "lua", "typescript", "tsx", "vim", "vimdoc" }
local Treesitter = {
	"nvim-treesitter/nvim-treesitter",
	pin = true,
	dependencies = { { "nvim-treesitter/nvim-treesitter-textobjects", pin = true } },
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
		textobjects = {
			select = {
				enable = true,
				lookahead = true,
				keymaps = {
					-- Treesitter Text Objects
					["ac"] = "@call.outer",
					["ic"] = "@call.inner",
					["af"] = "@function.outer",
					["if"] = "@function.inner",
					["aa"] = "@parameter.outer",
					["ia"] = "@parameter.inner",
					-- Custom WIP
					-- ["ae"] = "@entry.outer",
					-- ["ie"] = "@entry.inner",
					-- ["as"] = "@string.outer",
					-- ["is"] = "@string.inner",
				},
			},
		},
	},
}

return { Treesitter }
