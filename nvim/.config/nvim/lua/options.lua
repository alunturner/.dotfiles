vim.o.guicursor = vim.o.guicursor .. ",a:Cursor" -- append hl-Cursor to all modes
vim.opt.breakindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "80"
vim.opt.completeopt = "longest,menu"
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.expandtab = true
vim.opt.fillchars = "eob: "
vim.opt.ignorecase = true
vim.opt.jumpoptions = "stack"
vim.opt.laststatus = 0
vim.opt.number = true
vim.opt.rulerformat = "%40(%=%{%v:lua.GetErrors()%}%{%v:lua.GetIcon()%}%#CustomRulerFile# %t %)"
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
vim.opt.undofile = true
vim.opt.wildmode = "longest:full,full"

vim.diagnostic.config({
	float = { border = "rounded", severity_sort = true },
	severity_sort = true,
	virtual_text = false,
	jump = { float = true },
})

function GetErrors()
	local errors = vim.diagnostic.count(0)[vim.diagnostic.severity.ERROR] or 0
	return errors > 0 and "%#DiagnosticError# " or ""
end
function GetIcon()
	local icon = vim.bo.modified and "" or ""
	return "%#CustomRulerSeparator#%#CustomRulerIcon#" .. icon .. " "
end
