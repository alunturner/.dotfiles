local Finder = {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.5",
	dependencies = { "nvim-lua/plenary.nvim" },
}

Finder.config = function()
	require("telescope").setup()
	local builtin = require("telescope.builtin")

	-- File Pickers
	vim.keymap.set("n", "<leader>ff", builtin.find_files)
	vim.keymap.set("n", "<leader>fs", builtin.live_grep)
	vim.keymap.set("n", "<leader>fc", builtin.grep_string)

	-- Vim Pickers
	vim.keymap.set("n", "<leader>fh", builtin.help_tags)

	-- LSP Pickers
	vim.keymap.set("n", "<leader>d", builtin.diagnostics)
	vim.keymap.set("n", "<leader>fo", builtin.lsp_document_symbols)
	vim.keymap.set("n", "<leader>fO", builtin.lsp_dynamic_workspace_symbols)
	vim.keymap.set("n", "gr", builtin.lsp_references)
	vim.keymap.set("n", "gd", builtin.lsp_definitions)
	vim.keymap.set("n", "gt", builtin.lsp_type_definitions)
	vim.keymap.set("n", "gi", builtin.lsp_implementations)
end

return { Finder }
