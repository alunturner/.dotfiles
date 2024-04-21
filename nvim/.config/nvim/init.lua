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
set({ "n", "v" }, " ", "<nop>")

-- STEP 1 - INSTALL EXTERNAL DEPENDENCIES
require("lazy").setup("plugins")

-- STEP 2 - KEY REMAPS
-- Quick way to remove highlighting
set("n", "<Esc>", "<cmd>nohl<cr>")
-- Make Y act like C and D
set("n", "Y", "y$")
-- Don't move the cursor when using J
set("n", "J", "mzJ`z")
-- File Browser
set("n", "<leader>e", "<cmd>Ex<cr>")
-- Completion - see :h ins-completion
set("i", "<C-j>", "<C-x><C-o>")
set("i", "<C-f>", "<C-x><C-f>")
-- Prev/next movements
set("n", "[d", vim.diagnostic.goto_prev)
set("n", "]d", vim.diagnostic.goto_next)

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
o.showcmd = false

function GetErrorIndicator()
	local err_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })

	if err_count > 0 then
		return "%#CustomRulerError# "
	else
		return ""
	end
end

function GetRulerIcon()
	local modified = vim.bo.modified
	local icon = ""

	if modified then
		icon = ""
	end

	return "%#CustomRulerSeparator#%#CustomRulerIcon#" .. icon .. " "
end
o.rulerformat = "%30(%=%{%v:lua.GetErrorIndicator()%}%{%v:lua.GetRulerIcon()%}%#CustomRulerFile# %t %)"
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
vim.cmd("colorscheme pax-mono")
set("n", "<leader>i", "<cmd>Inspect<cr>")

-- colorschemes generally want to do this
vim.cmd("highlight clear")
vim.cmd("let g:colors_name='pax'")
vim.diagnostic.config({ virtual_text = false })

-- STEP 6 - ABBREVIATIONS
vim.cmd("iab tbitd toBeInTheDocument()")

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

