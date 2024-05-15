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
o.wildmode = "longest:full,full"
-- ,a:Cursor means in all modes hl group Cursor is applied
o.guicursor = "n-v-c-sm:block,i-ci-ve:ver25,r-cr-o:hor20,a:Cursor"
o.undofile = true
o.swapfile = false
o.updatetime = 500
o.timeoutlen = 500
o.jumpoptions = "stack"
o.sidescrolloff = 7
-- Lines
o.laststatus = 0
o.fillchars = "eob: "
o.showcmd = false
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
o.rulerformat = "%40(%=%{%v:lua.GetIndicators()%}%{%v:lua.GetRulerIcon()%}%#CustomRulerFile# %t %)"
