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
			["border"] = { "fg", { "Normal" } },
			["fg"] = { "fg", { "Comment" } },
			["fg+"] = { "fg", { "PmenuSel" } },
			["bg+"] = { "bg", { "PmenuSel" } },
			["hl"] = { "fg", { "Normal" } },
			["hl+"] = { "fg", { "PmenuSel" }, "italic", "underline" },
			["query"] = { "fg", { "Normal" } },
			["info"] = { "fg", { "Comment" } },
			["separator"] = { "fg", { "Comment" } },
			["prompt"] = { "fg", { "Normal" } },
			["pointer"] = { "fg", { "PmenuSel" } },
			["marker"] = { "fg", { "Pmenu" } },
			["header"] = { "fg", { "Normal" } },
			["gutter"] = "-1",
		},
		files = {
			prompt = " ",
			winopts = { title = "┤ Files ├", title_pos = "center" },
		},
		buffers = {
			prompt = " ",
			winopts = { title = "┤ Buffers ├", title_pos = "center" },
		},
		quickfix = {
			prompt = " ",
			winopts = { title = "┤ Quickfix ├", title_pos = "center" },
		},
		grep = {
			prompt = " ",
			winopts = { title = "┤ Ripgrep ├", title_pos = "center" },
		},
		diagnostics = {
			prompt = " ",
			winopts = { title = "┤ Diagnostics ├", title_pos = "center" },
		},
		lsp = {
			symbols = {
				prompt = " ",
				winopts = { title = "┤ LSP Symbols ├", title_pos = "center" },
			},
		},
	})
	-- Buffers and Files
	fzf_set("<leader>f", "files")
	fzf_set("<leader>b", "buffers")
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
