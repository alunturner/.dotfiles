vim.o.guicursor = vim.o.guicursor .. ",a:Cursor" -- append hl-Cursor to all modes
vim.opt.breakindent = true
vim.opt.colorcolumn = "80"
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fillchars = { eob = " ", wbr = "▀", vert = "█" } -- see unicode block
vim.opt.ignorecase = true
vim.opt.jumpoptions = "stack"
vim.opt.laststatus = 0
vim.opt.number = true
vim.opt.rulerformat = "%3(%=%{%v:lua.Ruler()%}%)"
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
vim.opt.winbar = "%{%v:lua.WinBar()%}"

vim.opt.background = "dark"
vim.cmd("colorscheme pax_zero")

vim.diagnostic.config({
	float = { border = "rounded", severity_sort = true },
	severity_sort = true,
	virtual_text = false,
	jump = { float = true }, -- see https://github.com/neovim/neovim/pull/29067
})

function WinBar()
	local icon_and_path = vim.bo.filetype == "netrw" and " %f" or " %t"
	local display_icon_and_path = vim.bo.modified and " %t" or icon_and_path
	return "%=%#Normal# " .. display_icon_and_path .. " %*%="
end

function Ruler()
	local has_errors = vim.diagnostic.count(0)[vim.diagnostic.severity.ERROR] or 0 > 0
	return has_errors and "%#DiagnosticError#███" or ""
end
