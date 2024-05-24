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
vim.opt.showcmd = false
-- Completion
vim.opt.completeopt = "menu"
-- Custom Ruler
function GetIndicators()
	local counts = vim.diagnostic.count()
	local errors = counts[vim.diagnostic.severity.ERROR] or 0
	local warnings = counts[vim.diagnostic.severity.WARN] or 0
	local warn_string = warnings > 0 and "%#DiagnosticWarn# " or "  "
	local error_string = errors > 0 and "%#DiagnosticError# " or "  "
	return warn_string .. error_string
end
function GetRulerIcon()
	local icon = vim.bo.modified and "" or ""
	return "%#CustomRulerSeparator#%#CustomRulerIcon#" .. icon .. " "
end
vim.opt.rulerformat = "%40(%=%{%v:lua.GetIndicators()%}%{%v:lua.GetRulerIcon()%}%#CustomRulerFile# %t %)"
