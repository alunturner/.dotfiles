vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, " ", "<nop>", { silent = true })

-- PLUGIN CONFIGURATION
require("plugin_config.fzf-lua")
require("plugin_config.nvim-lspconfig")
require("plugin_config.other")

-- KEYBINDS
local ERROR = { severity = vim.diagnostic.severity.ERROR }
vim.keymap.set("n", "<Esc><Esc>", "<cmd>noh<cr>", { silent = true })
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { silent = true })
vim.keymap.set("n", "[e", function()
	vim.diagnostic.goto_prev(ERROR)
end, { silent = true })
vim.keymap.set("n", "]e", function()
	vim.diagnostic.goto_next(ERROR)
end, { silent = true })
vim.keymap.set("i", "<C-j>", "<C-x><C-o>", { silent = true }) -- Lsp completion
vim.keymap.set("n", "<C-q>", "<cmd>close<cr>", { silent = true }) -- General purpose quit
vim.api.nvim_create_user_command("Tsc", function()
	local ts_root = vim.fs.root(0, "tsconfig") -- may need updating in a TS proj at work
	if ts_root == nil then
		return print("Unable to find tsconfig")
	end
	vim.cmd("compiler tsc | echo 'Building TypeScript...' | silent make! --noEmit | echo 'TypeScript built.' | copen")
end, {})

-- OPTIONS
vim.o.guicursor = vim.o.guicursor .. ",a:Cursor" -- append hl-Cursor to all modes
vim.opt.breakindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "80"
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fillchars = { eob = " ", wbr = "▀", vert = "█" } -- see unicode block
vim.opt.ignorecase = true
vim.opt.jumpoptions = "stack"
vim.opt.laststatus = 0
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.showcmd = false
vim.opt.sidescrolloff = 7
vim.opt.signcolumn = "no"
vim.opt.smartcase = true
vim.opt.smartindent = true
vim.opt.softtabstop = 4
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.swapfile = false
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.undofile = true

vim.diagnostic.config({
	float = { border = "rounded", severity_sort = true },
	severity_sort = true,
	virtual_text = false,
	jump = { float = true }, -- see https://github.com/neovim/neovim/pull/29067
})

function WinBar()
	local icon = vim.bo.modified and "" or ""
	return "%=%#Normal# " .. icon .. " %t %*%="
end
vim.opt.winbar = "%{%v:lua.WinBar()%}"

function Ruler()
	local has_errors = vim.diagnostic.count(0)[vim.diagnostic.severity.ERROR] or 0 > 0
	return has_errors and "%#DiagnosticError#███" or ""
end
vim.opt.rulerformat = "%3(%=%{%v:lua.Ruler()%}%)"

-- INITIALISE
vim.opt.background = "dark"
vim.cmd("colorscheme pax")
vim.cmd("au VimEnter * FzfLua files")
