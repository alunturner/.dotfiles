-- https://vonheikemen.github.io/devlog/tools/using-netrw-vim-builtin-file-explorer/
vim.g.netrw_banner = 0
vim.g.netrw_winsize = 30
vim.g.netrw_altfile = 1 -- make <C-6> go back to prev file, not netrw
vim.g.netrw_localcopydircmd = "cp -r" -- allow whole file copying
vim.opt_local.colorcolumn = ""
vim.opt_local.cursorcolumn = false
function NetrwWinBar()
	return "%#Normal#  %t %*%=%#Normal# 󰋞 " .. vim.fn.getcwd() .. " "
end
vim.opt_local.winbar = "%{%v:lua.NetrwWinBar()%}"
vim.keymap.set("n", "h", "-", { remap = true, buffer = true })
vim.keymap.set("n", "l", "<cr>", { remap = true, buffer = true })
vim.keymap.set("n", "dd", "D", { remap = true, buffer = true })
vim.keymap.set("n", "<C-l>", "<cmd>TmuxNavigateRight<cr>", { remap = true, buffer = true })
vim.keymap.set("n", "<C-q>", "<cmd>Rex<cr>", { remap = true, buffer = true })
