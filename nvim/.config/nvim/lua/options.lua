vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
vim.opt.clipboard = "unnamedplus"
-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- New windows
vim.opt.splitbelow = true
vim.opt.splitright = true
-- Text display
vim.opt.breakindent = true
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.signcolumn = "no"
vim.opt.number = true
-- Other
vim.opt.wildmode = "longest:full,full"
-- ,a:Cursor means in all modes hl group Cursor is applied
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:Cursor"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.updatetime = 500
vim.opt.timeoutlen = 500
vim.opt.jumpoptions = "stack"
vim.opt.sidescrolloff = 7
-- Lines
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
