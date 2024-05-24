local Finder = {
	"ibhagwan/fzf-lua",
}

local function fzf_set(bind, picker)
	-- see https://github.com/ibhagwan/fzf-lua?tab=readme-ov-file#commands
	local prefix = "<cmd>lua require('fzf-lua')."
	local suffix = "()<cr>"
	vim.keymap.set("n", bind, prefix .. picker .. suffix)
end

local function configure_finder(title, opts)
	return vim.tbl_deep_extend("keep", opts or {}, {
		prompt = title .. "  ",
		winopts = {
			title = "┤ " .. title .. " ├",
			title_pos = "center",
		},
	})
end

Finder.config = function()
	require("fzf-lua").setup({
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
		diagnostics = configure_finder("Diagnostics"),
		lsp = {
			prompt_postfix = "  ",
			symbols = configure_finder("Symbol"),
		},
	})
	fzf_set("<leader>f", "files")
	fzf_set("<leader>q", "quickfix")
	fzf_set("<leader>s", "grep_project")
	fzf_set("<leader>d", "lsp_document_diagnostics")
	fzf_set("<leader>o", "lsp_document_symbols")
	fzf_set("<leader>O", "lsp_live_workspace_symbols")
	fzf_set("gr", "lsp_references")
	fzf_set("gd", "lsp_definitions")
	fzf_set("<leader>h", "helptags")
end

return { Finder }
