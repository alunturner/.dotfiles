vim.o.guicursor = vim.o.guicursor .. ",a:Cursor" -- append hl-Cursor to all modes
vim.opt.background = "dark"
vim.opt.breakindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "80"
vim.opt.completeopt = "longest,menu"
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fillchars = { eob = " ", wbr = "▀", vert = "█" } -- see unicode block
vim.opt.ignorecase = true
vim.opt.jumpoptions = "stack"
vim.opt.laststatus = 0
vim.opt.number = true
vim.opt.ruler = false
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
vim.opt.wildmode = "longest:full,full"
vim.opt.winbar = "%=▜ %{%v:lua.GetModifiedFlag()%} %t ▛%=" -- see unicode quadrant

vim.cmd("colorscheme pax_zero")

vim.diagnostic.config({
	float = { border = "rounded", severity_sort = true },
	severity_sort = true,
	virtual_text = false,
	jump = { float = true }, -- see https://github.com/neovim/neovim/pull/29067
})

function GetModifiedFlag()
	return vim.bo.modified and "" or ""
end
