local function configure_finder(title, opts)
	return vim.tbl_deep_extend("keep", opts or {}, {
		prompt = title .. "  ",
		winopts = {
			title = "┤ " .. title .. " ├",
			title_pos = "center",
		},
	})
end

local Finder = {
	"ibhagwan/fzf-lua",
	pin = true,
	opts = {
		defaults = {
			file_icons = false,
			git_icons = false,
		},
		keymap = {
			builtin = {
				["<C-d>"] = "preview-page-down",
				["<C-u>"] = "preview-page-up",
			},
			fzf = {
				["ctrl-q"] = "select-all+accept",
			},
		},
		fzf_opts = {
			["--info"] = "default",
			["--pointer"] = "",
			["--marker"] = "",
		},
		fzf_colors = {
			["fg"] = { "fg", { "Comment" } },
			["hl"] = { "fg", { "Normal" } },
			["fg+"] = { "fg", { "PmenuSel" } },
			["bg+"] = { "bg", { "PmenuSel" } },
			["gutter"] = "-1",
			["hl+"] = { "fg", { "PmenuSel" }, "italic", "underline" },
			["query"] = { "fg", { "Cursor" } },
			["info"] = { "fg", { "Comment" } },
			["border"] = { "fg", { "Normal" } },
			["separator"] = { "fg", { "Comment" } },
			["prompt"] = { "fg", { "Normal" } },
			["pointer"] = { "fg", { "PmenuSel" } },
			["marker"] = { "fg", { "Pmenu" } },
			["header"] = { "fg", { "Normal" } },
		},
		files = configure_finder("Finder", { cwd_prompt = false }),
		buffers = configure_finder("Buffers"),
		quickfix = configure_finder("Quickfix"),
		grep = configure_finder(
			"Ripgrep",
			{ rg_opts = "--column --line-number --no-heading --color=never --smart-case --max-columns=4096 -e" }
		),
		diagnostics = configure_finder("Diagnostics", {
			severity_limit = "error",
			actions = {
				["ctrl-g"] = function()
					print("TODO hook up severity filter")
				end,
			},
		}),
		lsp = {
			jump_to_single_result = true,
			prompt_postfix = "  ",
			symbols = configure_finder("Symbol"),
		},
		helptags = configure_finder("Help"),
	},
}

local pre = "<cmd>lua require('fzf-lua')."
local post = "()<cr>"
vim.keymap.set("n", "<leader>f", pre .. "files" .. post)
vim.keymap.set("n", "<leader>q", pre .. "quickfix" .. post)
vim.keymap.set("n", "<leader>s", pre .. "grep_project" .. post)
vim.keymap.set("n", "<leader>d", pre .. "lsp_document_diagnostics" .. post)
vim.keymap.set("n", "<leader>o", pre .. "lsp_document_symbols" .. post)
vim.keymap.set("n", "<leader>O", pre .. "lsp_live_workspace_symbols" .. post)
vim.keymap.set("n", "gr", pre .. "lsp_references" .. post)
vim.keymap.set("n", "gd", pre .. "lsp_definitions" .. post)
vim.keymap.set("n", "<leader>h", pre .. "helptags" .. post)
vim.keymap.set("n", "<leader><leader>", pre .. "resume" .. post)

return { Finder }
