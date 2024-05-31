local set = vim.keymap.set
set("n", "<Esc><Esc>", "<cmd>noh<cr>", { silent = true }) -- Remove search hls
set("n", "J", "mzJ`z", { silent = true }) -- Don't move the cursor when using J
set("n", "<leader>e", "<cmd>Ex<cr>", { silent = true })
-- can be removed when https://github.com/neovim/neovim/pull/29067 available
set("n", "[d", vim.diagnostic.goto_prev, { silent = true })
set("n", "]d", vim.diagnostic.goto_next, { silent = true })
set("n", "[c", "<cmd>cprev<cr>", { silent = true })
set("n", "]c", "<cmd>cnext<cr>", { silent = true })
set("n", "<Tab>", "<C-6>", { silent = true }) -- Easy alternate file access
set("i", "<C-j>", "<C-x><C-o>", { silent = true }) -- Lsp completion
set("i", "<C-f>", "<C-x><C-f>", { silent = true }) -- Filepath completion
set("n", "<leader>th", "<cmd>HighlightColors Toggle<cr>", { silent = true })
set("n", "<leader>ti", function()
	vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
end, { expr = true, silent = true })
