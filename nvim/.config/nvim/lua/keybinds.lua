vim.keymap.set("n", "<Esc><Esc>", "<cmd>noh<cr>", { silent = true }) -- Remove search hls
vim.keymap.set("n", "J", "mzJ`z", { silent = true }) -- Don't move the cursor when using J
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { silent = true })
-- can be removed when https://github.com/neovim/neovim/pull/29067 available
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { silent = true })
vim.keymap.set("n", "[c", "<cmd>cprev<cr>", { silent = true })
vim.keymap.set("n", "]c", "<cmd>cnext<cr>", { silent = true })
vim.keymap.set("n", "<Tab>", "<C-6>", { silent = true }) -- Easy alternate file access
vim.keymap.set("i", "<C-j>", "<C-x><C-o>", { silent = true }) -- Lsp completion
vim.keymap.set("i", "<C-f>", "<C-x><C-f>", { silent = true }) -- Filepath completion
