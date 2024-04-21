-- STEP 0 - Install plugin manager (lazy)
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Set the leader key before loading plugins
local function set(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end

vim.g.mapleader = " "
vim.g.maplocalleader = " "
set({ "n", "v" }, " ", "<nop>")

-- STEP 1 - INSTALL EXTERNAL DEPENDENCIES
require("lazy").setup("plugins")

-- STEP 2 - KEY REMAPS
-- Quick way to remove highlighting
set("n", "<Esc>", "<cmd>nohl<cr>")
-- Make Y act like C and D
set("n", "Y", "y$")
-- Don't move the cursor when using J
set("n", "J", "mzJ`z")
-- File Browser
set("n", "<leader>e", "<cmd>Ex<cr>")
-- Completion - see :h ins-completion
set("i", "<C-j>", "<C-x><C-o>")
set("i", "<C-f>", "<C-x><C-f>")
-- Prev/next movements
set("n", "[d", vim.diagnostic.goto_prev)
set("n", "]d", vim.diagnostic.goto_next)

-- STEP 4 - SETTINGS
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
o.undofile = true
o.swapfile = false
o.updatetime = 500
o.timeoutlen = 500
o.jumpoptions = "stack"
-- Lines
o.laststatus = 0
o.fillchars = "eob: "
o.showcmd = false

function GetErrorIndicator()
	local err_count = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR })

	if err_count > 0 then
		return "%#CustomRulerError# "
	else
		return ""
	end
end

function GetRulerIcon()
	local modified = vim.bo.modified
	local icon = ""

	if modified then
		icon = ""
	end

	return "%#CustomRulerSeparator#%#CustomRulerIcon#" .. icon .. " "
end

o.rulerformat = "%50(%=%{%v:lua.GetErrorIndicator()%}%{%v:lua.GetRulerIcon()%}%#CustomRulerFile# %t %)"
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

-- STEP 5 - COLORSCHEME AND CUSTOMISATION
local colors = {
	Normal = { fg = "#E9E7DD", bg = "#19191F" },
	Error = { link = "Normal" },
	FloatBorder = { link = "Normal" },
	FloatTitle = { link = "Normal" },
	FoldColumn = { link = "Normal" },
	Folded = { link = "Normal" },
	Ignore = { link = "Normal" },
	LspCodeLens = { link = "Normal" },
	LspCodeLensSeparator = { link = "Normal" },
	LspReferenceRead = { link = "Normal" },
	LspReferenceText = { link = "Normal" },
	LspReferenceWrite = { link = "Normal" },
	ModeMsg = { fg = "#E9E7DD", bg = "#262626" },
	MoreMsg = { link = "ModeMsg" },
	MsgArea = { link = "ModeMsg" },
	MsgSeparator = { link = "Normal" },
	NonText = { link = "Normal" },
	NormalNC = { link = "Normal" },
	Question = { link = "Normal" },
	SignColumn = { link = "Normal" },
	Special = { link = "Normal" },
	SpecialKey = { link = "Normal" },
	SpellBad = { link = "Normal" },
	SpellCap = { link = "Normal" },
	SpellLocal = { link = "Normal" },
	SpellRare = { link = "Normal" },
	StatusLine = { link = "ColorColumn" },
	TabLine = { link = "Normal" },
	TabLineFill = { link = "Normal" },
	TabLineSel = { link = "Normal" },
	Title = { link = "Normal" },
	Todo = { link = "Normal" },
	VertSplit = { link = "Normal" },
	Whitespace = { link = "Normal" },
	Winseparator = { link = "Normal" },
	ColorColumn = { bg = "#262626" },
	Comment = { fg = "#8F8F8F" },
	DiagnosticHint = { link = "Comment" },
	DiagnosticInfo = { link = "Comment" },
	Conceal = { fg = "#19191F", bg = "#19191F" },
	Constant = { fg = "#D98C8C" },
	["@none.javascript"] = { link = "Constant" },
	["@none.tsx"] = { link = "Constant" },
	CurSearch = { fg = "#19191F", bg = "#FF007B" },
	Substitute = { link = "CurSearch" },
	Cursor = { fg = "#E9E7DD", bg = "#FF007B" },
	CursorIM = { link = "Cursor" },
	lCursor = { link = "Cursor" },
	CursorLine = { bg = "#262626" },
	CursorColumn = { link = "CursorLine" },
	CursorLineNr = { fg = "#FF007B", bg = "#262626" },
	CursorLineFold = { link = "CursorLineNr" },
	CursorLineSign = { link = "CursorLineNr" },
	Delimiter = { fg = "#E9E7DD" },
	DiagnosticError = { fg = "#FF0000" },
	DiagnosticOk = { fg = "#8CB2D9" },
	DiagnosticWarn = { fg = "#FF9100" },
	DiffAdd = { fg = "#E9E7DD" },
	DiffChange = { fg = "#E9E7DD" },
	DiffDelete = { fg = "#E9E7DD" },
	DiffText = { fg = "#E9E7DD" },
	Directory = { fg = "#85ADAD" },
	EndOfBuffer = { fg = "#19191F", bg = "#19191F" },
	ErrorMsg = { fg = "#FF0000" },
	Function = { fg = "#D1C794" },
	["@constructor.javascript"] = { link = "Function" },
	["@constructor.tsx"] = { link = "Function" },
	Identifier = { fg = "#85ADAD" },
	IncSearch = { fg = "#19191F", bg = "#E9E7DD" },
	Search = { link = "IncSearch" },
	LineNr = { fg = "#545454", bg = "#19191F" },
	WinBarNC = { link = "LineNr" },
	LineNrAbove = { fg = "#E9E7DD" },
	LineNrBelow = { fg = "#E9E7DD" },
	MatchParen = { fg = "#FF007B" },
	NormalFloat = { fg = "#E9E7DD", bg = "#333333" },
	Pmenu = { link = "NormalFloat" },
	PmenuExtra = { link = "Pmenu" },
	PmenuKind = { link = "Pmenu" },
	PmenuSbar = { bg = "#3D3D3D" },
	PmenuSel = { fg = "#19191F", bg = "#FF007B" },
	LspSignatureActiveParameter = { link = "PmenuSel" },
	PmenuExtraSel = { link = "PmenuSel" },
	PmenuKindSel = { link = "PmenuSel" },
	QuickFixLine = { link = "PmenuSel" },
	WildMenu = { link = "PmenuSel" },
	PmenuThumb = { bg = "#262626" },
	PreProc = { fg = "#AD85AD" },
	Statement = { fg = "#AD85AD" },
	StatusLineNC = { fg = "#19191F", bg = "#19191F" },
	TermCursor = { bg = "#FF007B" },
	TermCursorNC = { fg = "#E9E7DD", bg = "#19191F", reverse = true },
	Type = { fg = "#8CB2D9" },
	["@boolean.javascript"] = { link = "Type" },
	["@boolean.lua"] = { link = "Type" },
	["@boolean.tsx"] = { link = "Type" },
	["@boolean.typescript"] = { link = "Type" },
	["@constant.builtin.javascript"] = { link = "Type" },
	["@constant.builtin.tsx"] = { link = "Type" },
	["@constant.builtin.typescript"] = { link = "Type" },
	["@constructor.lua"] = { link = "Delimiter" },
	["@tag.attribute.tsx"] = { link = "Delimiter" },
	["@tag.builtin.javascript"] = { link = "Type" },
	["@tag.builtin.tsx"] = { link = "Type" },
	["@tag.delimiter.tsx"] = { link = "Delimiter" },
	["@tag.javascript"] = { link = "Type" },
	["@tag.tsx"] = { link = "Type" },
	Underlined = { fg = "#E9E7DD", bg = "#19191F", underline = true },
	Visual = { fg = "#FF007B", bg = "#3D3D3D" },
	VisualNOS = { link = "Visual" },
	WarningMsg = { fg = "#FF9100" },
	WinBar = { fg = "#FF007B", bg = "#19191F" },
	-- CUSTOM THINGS
	CustomRulerSeparator = { fg = "#521452", bg = "#262626" },
	CustomRulerIcon = { fg = "#E9E7DD", bg = "#521452" },
	CustomRulerFile = { fg = "#E9E7DD", bg = "#262626" },
	CustomRulerError = { fg = "#FF0000", bg = "#262626" },
}

-- colorschemes generally want to do this
vim.cmd("highlight clear")
vim.cmd("let g:colors_name='pax'")

-- apply highlight groups
for group, attrs in pairs(colors) do
	vim.api.nvim_set_hl(0, group, attrs)
end
vim.diagnostic.config({ virtual_text = false })

-- STEP 6 - ABBREVIATIONS
vim.cmd("iab tbitd toBeInTheDocument()")

-- STEP 7 - EXPERIMENTAL
-- Example error message from tsc
-- src/features/app/components/AppHeader/AppHeader.tsx(11,19): error TS2552: Cannot find name useAccount. Did you mean account?
local augroup = vim.api.nvim_create_augroup("makers", { clear = true })
-- TODO use the errorformat (see :h errorformat) to try and tidy the qflist
vim.api.nvim_create_autocmd("FileType", {
	pattern = "typescript,typescriptreact",
	group = augroup,
	command = "compiler tsc | setlocal makeprg=tsc",
})
