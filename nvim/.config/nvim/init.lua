-- Install lazy if not installed
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
local leader = " "
vim.g.mapleader = leader
vim.g.maplocalleader = leader
vim.keymap.set({ "n", "v" }, leader, "<nop>")

-- STEP 1 - INSTALL EXTERNAL DEPENDENCIES
require("lazy").setup("plugins")

-- STEP 2 - KEY REMAPS
local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

-- VSCode style shifting around of lines in visual mode
map("v", "J", ":m '>+1<CR>gv=gv")
map("v", "K", ":m '<-2<CR>gv=gv")

-- Quick way to remove highlighting
map("n", "<Esc>", "<cmd>nohl<cr>")

-- Keep cursor centred when moving the screen
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

-- Window navigation
map("n", "<Left>", "<C-w>h")
map("n", "<Down>", "<C-w>j")
map("n", "<Up>", "<C-w>k")
map("n", "<Right>", "<C-w>l")

-- When pasting over a selection, maintain the original paste register
map("v", "p", '"_dP')

-- Make Y act like C and D
map("n", "Y", "y$")

-- STEP 4 - SETTINGS
local o = vim.opt

-- Tabs/spaces
o.expandtab = true
o.shiftwidth = 4
o.tabstop = 4
o.softtabstop = 4
o.smartindent = true
-- Clipboard
o.clipboard = "unnamedplus"
-- Search
o.ignorecase = true
o.smartcase = true
o.showmatch = true
-- New windows
o.splitbelow = true
o.splitright = true
-- Text display
o.breakindent = true
o.scrolloff = 5
o.sidescrolloff = 5
o.colorcolumn = "80"
o.cursorline = true
o.signcolumn = "yes"
o.number = true
-- Other
o.termguicolors = true
o.undofile = true
o.updatetime = 500
o.timeoutlen = 500
o.jumpoptions = "stack"
-- Lines
o.laststatus = 0
o.winbar = "%=%m %f"
