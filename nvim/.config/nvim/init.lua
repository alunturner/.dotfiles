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
local function set(mode, lhs, rhs)
	-- TODO make it so that this util can combine options into the 4th arg
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

local leader = " "
vim.g.mapleader = leader
vim.g.maplocalleader = leader
vim.keymap.set({ "n", "v" }, leader, "<nop>")

-- STEP 1 - INSTALL EXTERNAL DEPENDENCIES
require("lazy").setup("plugins")

-- STEP 2 - KEY REMAPS
-- Quick way to remove highlighting
set("n", "<Esc>", "<cmd>nohl<cr>")
-- Keep cursor centred when moving the screen and searching
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
set("n", "n", "nzz")
set("n", "N", "Nzz")
vim.keymap.set("c", "<cr>", function()
	local is_search = vim.fn.getcmdtype() == "/" or "?"
	return is_search and "<cr>zz" or "cr"
end, { expr = true })
set("n", "gg", "ggzz")
-- When pasting over a selection, maintain the original paste register
set("v", "p", '"_dP')
-- Make Y act like C and D
set("n", "Y", "y$")
-- Don't move the cursor when using J
set("n", "J", "mzJ`z")
-- File Browser
set("n", "<leader>e", "<cmd>Ex<cr>")
-- Completion - see :h ins-completion
set("i", "<C-o>", "<C-x><C-o>")
set("i", "<C-f>", "<C-x><C-f>")

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
o.colorcolumn = "80"
o.cursorline = true
o.cursorcolumn = true
o.signcolumn = "yes"
o.number = true
-- Other
o.termguicolors = true
o.undofile = true
o.swapfile = false
o.updatetime = 500
o.timeoutlen = 500
o.jumpoptions = "stack"
-- Lines
o.laststatus = 0
o.winbar = "%=%m %f"
o.fillchars = "eob: "
-- Completion
o.completeopt = "menu"

-- STEP 5 - COLORSCHEME AND CUSTOMISATION
vim.cmd("colorscheme pax")
set("n", "<leader>i", "<cmd>Inspect<cr>")
vim.diagnostic.config({ virtual_text = false })

-- STEP 6 - ABBREVIATIONS
vim.cmd("iab tbitd toBeInTheDocument()")
