local Finder = {
	"ibhagwan/fzf-lua",
}

local function fzf_set(bind, picker)
	-- see https://github.com/ibhagwan/fzf-lua?tab=readme-ov-file#commands
	local prefix = "<cmd>lua require('fzf-lua')."
	local suffix = "()<cr>"
	vim.keymap.set("n", bind, prefix .. picker .. suffix)
end

Finder.config = function()
	require("fzf-lua").setup({
		defaults = {
			file_icons = false,
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
		fzf_colors = {
			["fg"] = { "fg", { "Comment" } },
			["hl"] = { "fg", { "Normal" } },
			["fg+"] = { "fg", { "PmenuSel" } },
			["bg+"] = { "bg", { "PmenuSel" } },
			["gutter"] = "-1",
			["hl+"] = { "fg", { "PmenuSel" }, "italic", "underline" },
			["query"] = { "fg", { "Normal" } },
			["info"] = { "fg", { "Comment" } },
			["border"] = { "fg", { "Normal" } },
			["separator"] = { "fg", { "Comment" } },
			["prompt"] = { "fg", { "Normal" } },
			["pointer"] = { "fg", { "PmenuSel" } },
			["marker"] = { "fg", { "Pmenu" } },
			["header"] = { "fg", { "Normal" } },
		},
		files = {
			git_icons = false,
			cwd_prompt = false,
			prompt = "Files  ",
			winopts = { title = "┤ Files ├", title_pos = "center" },
		},
		buffers = {
			git_icons = false,
			prompt = "Buffers  ",
			winopts = { title = "┤ Buffers ├", title_pos = "center" },
		},
		quickfix = {
			git_icons = false,
			prompt = "Quickfix  ",
			winopts = { title = "┤ Quickfix ├", title_pos = "center" },
		},
		grep = {
			git_icons = false,
			prompt = "Ripgrep  ",
			rg_opts = "--column --line-number --no-heading --color=never --smart-case --max-columns=4096 -e",
			winopts = { title = "┤ Ripgrep ├", title_pos = "center" },
		},
		diagnostics = {
			git_icons = false,
			prompt = "Diagnostics  ",
			winopts = { title = "┤ Diagnostics ├", title_pos = "center" },
		},
		lsp = {
			prompt_postfix = "  ",
			symbols = {
				prompt = "Symbol  ",
				winopts = { title = "┤ LSP Symbols ├", title_pos = "center" },
			},
		},
	})
	-- Buffers and Files
	fzf_set("<leader>b", "buffers")
	fzf_set("<leader>f", "files")
	fzf_set("<leader>q", "quickfix")
	-- Search
	fzf_set("<leader>s", "grep_project")
	-- LSP/Diagnostics
	fzf_set("<leader>d", "lsp_document_diagnostics")
	fzf_set("<leader>o", "lsp_document_symbols")
	fzf_set("gr", "lsp_references")
	fzf_set("gd", "lsp_definitions")
	-- TO DELETE
	fzf_set("<leader>h", "highlights")
end

return { Finder }
