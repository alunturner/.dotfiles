-- STEP 0 - Install plugin manager (lazy)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Set the leader key before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, " ", "<nop>", { silent = true })

require("lazy").setup("plugins")
require("keybinds")
require("options")

-- STEP 5 - COLORSCHEME AND CUSTOMISATION
local _border = "rounded"
vim.opt.background = "dark"
vim.cmd("colorscheme pax_zero")
vim.diagnostic.config({ float = { border = _border }, virtual_text = false })
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = _border,
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = _border,
})

require("abbreviations")
-- STEP 7 - EXPERIMENTAL
-- Example error message from tsc
-- src/features/app/components/AppHeader/AppHeader.tsx(11,19): error TS2552: Cannot find name useAccount. Did you mean account?
local augroup = vim.api.nvim_create_augroup("makers", { clear = true })
-- TODO use the errorformat (see :h errorformat) to try and tidy the qflist
vim.api.nvim_create_autocmd("FileType", {
	pattern = "typescript,typescriptreact",
	group = augroup,
	command = "compiler tsc | setlocal makeprg=tsc",
})
