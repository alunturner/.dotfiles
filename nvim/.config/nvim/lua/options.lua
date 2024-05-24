vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.breakindent = true
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.signcolumn = "no"
vim.opt.number = true
vim.opt.wildmode = "longest:full,full"
vim.o.guicursor = vim.o.guicursor .. ",a:Cursor" -- append hl-Cursor to all modes
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.jumpoptions = "stack"
vim.opt.sidescrolloff = 7
vim.opt.laststatus = 0
vim.opt.fillchars = "eob: "
vim.opt.completeopt = "longest,menu"
-- Custom Ruler
function GetErrors()
	local errors = vim.diagnostic.count()[vim.diagnostic.severity.ERROR] or 0
	return errors > 0 and "%#DiagnosticError# " or ""
end
function GetIcon()
	local icon = vim.bo.modified and "" or ""
	return "%#CustomRulerSeparator#%#CustomRulerIcon#" .. icon .. " "
end
vim.opt.rulerformat = "%40(%=%{%v:lua.GetErrors()%}%{%v:lua.GetIcon()%}%#CustomRulerFile# %t %)"
