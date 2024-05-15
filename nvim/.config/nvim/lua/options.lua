-- Tabs/spaces
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.smartindent = true
-- Clipboard
vim.opt.clipboard = "unnamedplus"
-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
-- New windows
vim.opt.splitbelow = true
vim.opt.splitright = true
-- Text display
vim.opt.breakindent = true
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.cursorcolumn = true
vim.opt.signcolumn = "yes"
vim.opt.number = true
-- Other
vim.opt.termguicolors = true
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
-- Custom Ruler
function GetIndicators()
	local error_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })
	local warn_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN })

	local warn_string = warn_count > 0 and "%#DiagnosticWarn# " or ""
	local error_string = error_count > 0 and "%#DiagnosticError# " or ""

	return warn_string .. error_string
end
function GetRulerIcon()
	local modified = vim.bo.modified
	local icon = ""

	if modified then
		icon = ""
	end

	return "%#CustomRulerSeparator#%#CustomRulerIcon#" .. icon .. " "
end
vim.opt.rulerformat = "%40(%=%{%v:lua.GetIndicators()%}%{%v:lua.GetRulerIcon()%}%#CustomRulerFile# %t %)"
