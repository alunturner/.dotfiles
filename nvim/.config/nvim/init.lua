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
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, " ", "<nop>")

-- STEP 1 - INSTALL EXTERNAL DEPENDENCIES
require("lazy").setup("plugins")

-- STEP 2 - KEY REMAPS
-- Quick way to remove highlighting
set("n", "<Esc>", "<cmd>nohl<cr>")
-- Centre cursor on screen scroll (always)
set("n", "<C-d>", "<C-d>zz")
set("n", "<C-u>", "<C-u>zz")
-- Centre cursor on search (always)
set("n", "n", "nzz")
set("n", "N", "Nzz")
vim.keymap.set("c", "<cr>", function()
	local cmd = vim.fn.getcmdtype()
	local is_search = cmd == "/" or cmd == "?"
	return is_search and "<cr>zz" or "<cr>"
end, { expr = true })
-- Centre cursor on entering insert mode (optional)
set("n", "<leader>i", "zzi")
set("n", "<leader>I", "zzI")
set("n", "<leader>a", "zza")
set("n", "<leader>A", "zzA")
set("n", "<leader>o", "zzo")
set("n", "<leader>O", "zzO")
-- Centre cursor on line jump (nb :LineNr still only moves cursor)
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
-- Prev/next movements
set("n", "[d", vim.diagnostic.goto_prev)
set("n", "]d", vim.diagnostic.goto_next)
set("n", "[a", "<cmd>prev<cr>")
set("n", "]a", "<cmd>next<cr>")
set("n", "[A", "<cmd>first<cr>")
set("n", "]A", "<cmd>last<cr>")
set("n", "[c", "<cmd>cprev<cr>")
set("n", "]c", "<cmd>cnext<cr>")
set("n", "[C", "<cmd>cfirst<cr>")
set("n", "]C", "<cmd>clast<cr>")
set("n", "[b", "<cmd>bprev<cr>")
set("n", "]b", "<cmd>bnext<cr>")
set("n", "[B", "<cmd>bfirst<cr>")
set("n", "]B", "<cmd>blast<cr>")

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
o.fillchars = "eob: "
o.rulerformat = "%20(%=%m %t%)"
-- Completion
o.completeopt = "menu"
-- Netrw
vim.g.netrw_banner = 0
vim.api.nvim_create_autocmd("filetype", {
	pattern = "netrw",
	desc = "Netrw specific mappings",
	callback = function()
		local netrw_set = function(lhs, rhs)
			vim.keymap.set("n", lhs, rhs, { remap = true, buffer = true })
		end
		netrw_set("<esc>", "<cmd>Rex<cr>")
		netrw_set("h", "-")
		netrw_set("l", "<cr>")
	end,
})

-- STEP 5 - COLORSCHEME AND CUSTOMISATION
vim.cmd("colorscheme pax")
set("n", "<leader>j", "<cmd>Inspect<cr>")
vim.diagnostic.config({ virtual_text = false })

-- STEP 6 - ABBREVIATIONS
vim.cmd("iab tbitd toBeInTheDocument()")
