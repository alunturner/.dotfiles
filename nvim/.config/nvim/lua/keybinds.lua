vim.keymap.set("n", "<Esc><Esc>", "<cmd>noh<cr>", { silent = true }) -- Remove search hls
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { silent = true }) -- NetRW
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { silent = true })
vim.keymap.set("n", "[e", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.keymap.set("n", "]e", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.keymap.set("i", "<C-j>", "<C-x><C-o><C-p>", { silent = true }) -- Lsp completion
vim.keymap.set("n", "<C-q>", "<cmd>close<cr>", { silent = true }) -- General purpose quit
vim.keymap.set(
	"n",
	"<leader>m",
	"<cmd>compiler tsc | echo 'Building TypeScript...' | silent make! --noEmit | echo 'TypeScript built.' | copen<cr>"
)
