vim.o.guicursor = vim.o.guicursor .. ",a:Cursor" -- append hl-Cursor to all modes
vim.opt.background = "dark"
vim.opt.breakindent = true
vim.opt.clipboard = "unnamedplus"
vim.opt.colorcolumn = "80"
vim.opt.completeopt = "longest,menu"
vim.opt.cursorcolumn = true
vim.opt.cursorline = true
vim.opt.expandtab = true
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
vim.opt.undofile = true
vim.opt.wildmode = "longest:full,full"

vim.cmd("colorscheme pax_zero")

vim.diagnostic.config({
	float = { border = "rounded", severity_sort = true },
	severity_sort = true,
	virtual_text = false,
	jump = { float = true }, -- see https://github.com/neovim/neovim/pull/29067
})

function GetErrorFlag()
	local errors = vim.diagnostic.count(0)[vim.diagnostic.severity.ERROR] or 0
	return errors > 0 and "%#DiagnosticError#" or " "
end
function GetModifiedFlag()
	local icon = vim.bo.modified and "" or ""
	return icon
end

vim.opt.winbar = "%=▜ %{%v:lua.GetModifiedFlag()%} %t ▛%="
vim.opt.fillchars = { eob = " ", wbr = "▀", vert = "█", stlnc = "▀" }
vim.opt.rulerformat = "%=%{%v:lua.GetErrorFlag()%}"
vim.opt.cmdheight = 0
--up    ▀
--down  ▄
--full  █
--left  ▌
--right ▐
--
-- utils: nvim_win_get_position, fillchars

vim.api.nvim_create_autocmd({ "WinEnter", "VimEnter" }, {
	-- TODO exclude netrw somehow
	callback = function(_)
		vim.opt_local.colorcolumn = "80"
		vim.opt_local.cursorcolumn = true
		vim.opt_local.cursorline = true
	end,
})
--
vim.api.nvim_create_autocmd({ "WinLeave" }, {
	callback = function(_)
		vim.opt_local.colorcolumn = ""
		vim.opt_local.cursorcolumn = false
		vim.opt_local.cursorline = false
	end,
})
