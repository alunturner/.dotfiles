vim.opt_local.colorcolumn = ""
vim.opt_local.cursorcolumn = false
vim.keymap.set("n", "<C-n>", "<cmd>cnext | wincmd p<cr>", { remap = true, buffer = true })
vim.keymap.set("n", "<C-p>", "<cmd>cprev | wincmd p<cr>", { remap = true, buffer = true })
vim.cmd("wincmd K")
