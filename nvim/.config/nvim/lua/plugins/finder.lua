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
	require("fzf-lua").setup({})

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
end

return { Finder }
