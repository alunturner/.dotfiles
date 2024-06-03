local pax_colors = {
	hibiscus = "#ff007b",
	red = "#e61919",
	orange = "#e68019",
	green = "#14b814",
	grey10 = "#1a1a1a",
	grey20 = "#333333",
	grey30 = "#4d4d4d",
	grey60 = "#999999",
	grey70 = "#b3b3b3",
	grey80 = "#cccccc",
	grey90 = "#e6e6e6",
}

local pax_theme = {
	dark = {
		bg = pax_colors.grey10,
		bg_plus = pax_colors.grey20,
		bg_plus_plus = pax_colors.grey30,
		mg = pax_colors.grey60,
		fg_minus_minus = pax_colors.grey70,
		fg_minus = pax_colors.grey80,
		fg = pax_colors.grey90,
		cursor_bg = pax_colors.hibiscus,
		error = pax_colors.red,
		warning = pax_colors.orange,
		success = pax_colors.green,
		highlights = {},
	},
	light = {
		bg = "",
		bg_plus = "",
		bg_plus_plus = "",
		mg = "",
		fg_minus_minus = "",
		fg_minus = "",
		fg = "",
		cursor_bg = "",
		cursor_fg = "",
		error = "",
		warning = "",
		success = "",
		highlights = {},
	},
}

-- TODO
-- consolidate as much as practicable
-- add fzf groups
-- consolidate tree-sitter groups
-- help topics to check all the highlights:
-- :h group-name
-- :h highlight-groups
-- :h treesitter-highlight-groups
-- :h diagnostic-highlights
-- :h lsp-highlight
-- :h lsp-semantic-highlight
local function get_highlight_groups(theme)
	return {
		-- NEOVIM
		ColorColumn = { bg = theme.bg_plus },
		Conceal = { fg = theme.bg, bg = theme.bg },
		CurSearch = { fg = theme.fg, bg = theme.bg, reverse = true },
		Cursor = { fg = theme.fg, bg = theme.cursor_bg },
		CursorLine = { bg = theme.bg_plus_plus },
		CursorLineNr = { fg = theme.fg, bg = theme.bg_plus_plus },
		Directory = { fg = theme.fg },
		EndOfBuffer = { fg = theme.bg, bg = theme.bg },
		ErrorMsg = { fg = theme.error },
		FloatBorder = { fg = theme.fg },
		IncSearch = { fg = theme.fg, bg = theme.bg, reverse = true },
		LineNr = { fg = theme.mg },
		MatchParen = { fg = theme.fg, bg = theme.bg, reverse = true },
		Normal = { fg = theme.fg, bg = theme.bg },
		Pmenu = { fg = theme.fg_minus, bg = theme.bg_plus },
		PmenuSbar = { bg = theme.bg_plus },
		PmenuSel = { fg = theme.fg_minus, bg = theme.bg_plus, reverse = true },
		PmenuThumb = { bg = theme.fg_minus },
		SignColumn = {}, -- deliberately blank
		StatusLineNC = { fg = theme.bg, bg = theme.bg },
		TermCursor = { bg = theme.cursor_bg },
		Visual = { fg = theme.bg_plus_plus, bg = theme.fg_minus_minus },
		WarningMsg = { fg = theme.warning },
		-- TODO WIP ETC
		WinSeparator = { fg = theme.fg, bg = theme.fg },
		WinBar = { fg = theme.cursor_bg, bg = theme.fg },
		WinBarNC = { link = "WinSeparator" },
		-- NEOVIM LINKED
		CursorColumn = { link = "CursorLine" },
		CursorIM = { link = "Cursor" },
		CursorLineFold = { link = "CursorLine" },
		CursorLineSign = { link = "CursorLine" },
		FloatTitle = { link = "Normal" },
		LineNrAbove = { link = "LineNr" },
		LineNrBelow = { link = "LineNr" },
		ModeMsg = { link = "Normal" },
		MoreMsg = { link = "ModeMsg" },
		MsgArea = { link = "ModeMsg" },
		MsgSeparator = { link = "ModeMsg" },
		NormalFloat = { link = "Normal" },
		NormalNC = { link = "Normal" },
		PmenuExtra = { link = "Pmenu" },
		PmenuExtraSel = { link = "PmenuSel" },
		PmenuKind = { link = "Pmenu" },
		PmenuKindSel = { link = "PmenuSel" },
		Question = { link = "ModeMsg" },
		QuickFixLine = { link = "PmenuSel" },
		Search = { link = "IncSearch" },
		SpecialKey = { link = "Normal" },
		SpellBad = { link = "Normal" },
		SpellCap = { link = "Normal" },
		SpellLocal = { link = "Normal" },
		SpellRare = { link = "Normal" },
		StatusLine = { link = "Normal" },
		Substitute = { link = "CurSearch" },
		Title = { link = "Normal" },
		VisualNOS = { link = "Visual" },
		Whitespace = { link = "Normal" },
		WildMenu = { link = "PmenuSel" },
		lCursor = { link = "Cursor" },
		-- LSP
		LspCodeLens = { link = "Normal" },
		LspCodeLensSeparator = { link = "Normal" },
		LspReferenceRead = { link = "Normal" },
		LspReferenceText = { link = "Normal" },
		LspReferenceWrite = { link = "Normal" },
		LspSignatureActiveParameter = { link = "IncSearch" },
		-- DIAGNOSTIC
		DiagnosticError = { fg = theme.error },
		DiagnosticUnderlineError = { fg = theme.error, underline = true },
		DiagnosticWarn = { fg = theme.warning },
		DiagnosticUnderlineWarn = { fg = theme.warning, underline = true },
		DiagnosticHint = { fg = theme.mg },
		DiagnosticInfo = { fg = theme.mg },
		DiagnosticOk = { fg = theme.mg },
		DiagnosticUnnecessary = { italic = true, underline = true },
		-- SYNTAX
		Comment = { fg = theme.mg, italic = true },
		Constant = { fg = theme.fg },
		Delimiter = { fg = theme.fg },
		Function = { fg = theme.fg_minus_minus },
		Identifier = { fg = theme.fg },
		PreProc = { fg = theme.fg, bold = true },
		Special = { fg = theme.fg },
		Statement = { fg = theme.fg, bold = true },
		String = { link = "Constant" },
		Type = { fg = theme.fg_minus },
		Underlined = { underline = true },
		Ignore = { link = "Normal" },
		Error = { link = "Normal" },
		Todo = { fg = theme.bg, bg = theme.fg },
		-- TREESITTER/SYNTAX
		["@lsp.type.comment"] = {}, -- required to prevent below being overridden
		["@comment.error"] = { link = "Todo" },
		["@comment.todo"] = { link = "Todo" },
		["@comment.warning"] = { link = "Todo" },
		["@comment.note"] = { link = "Todo" },
		-- TREESITTER/JSX
		["@boolean.javascript"] = { fg = theme.fg_minus, bold = true },
		["@constant.builtin.javascript"] = { fg = theme.fg_minus, bold = true },
		["@constructor.javascript"] = { link = "Function" },
		["@function.builtin.javascript"] = { link = "Statement" },
		["@none.javascript"] = { link = "Constant" },
		["@tag.attribute.javascript"] = { fg = theme.fg_minus, italic = true },
		["@tag.builtin.javascript"] = { fg = theme.fg_minus, italic = true },
		["@tag.delimiter.javascript"] = { fg = theme.fg, bold = true },
		["@tag.javascript"] = { fg = theme.fg_minus, italic = true },
		-- TREESITTER/TS
		["@boolean.typescript"] = { fg = theme.fg_minus, bold = true },
		["@constant.builtin.typescript"] = { fg = theme.fg_minus, bold = true },
		["@constructor.typescript"] = { link = "Function" },
		-- TREESITTER/TSX
		["@boolean.tsx"] = { fg = theme.fg_minus, bold = true },
		["@constant.builtin.tsx"] = { fg = theme.fg_minus, bold = true },
		["@constructor.tsx"] = { link = "Function" },
		["@none.tsx"] = { link = "Constant" },
		["@tag.attribute.tsx"] = { fg = theme.fg_minus, italic = true },
		["@tag.builtin.tsx"] = { fg = theme.fg_minus, italic = true },
		["@tag.delimiter.tsx"] = { fg = theme.fg, bold = true },
		["@tag.tsx"] = { fg = theme.fg_minus, italic = true },
		-- TREESITTER/Lua
		["@boolean.lua"] = { fg = theme.fg_minus, bold = true },
		["@constructor.lua"] = { link = "Delimiter" },
		-- CUSTOM
		CustomRulerFile = { link = "ModeMsg" },
		CustomRulerIcon = { fg = theme.fg, bg = theme.bg, reverse = true },
		CustomRulerSeparator = { link = "ModeMsg" },
		-- FZF
		FzfLuaHeaderBind = { fg = theme.fg },
		FzfLuaHeaderText = { link = "FzfLuaHeaderBind" },
		FzfLuaPathColNr = { link = "LineNr" },
		FzfLuaPathLineNr = { link = "LineNr" },
		FzfLuaBufNr = { link = "LineNr" },
		FzfLuaBufFlagCur = { link = "LineNr" },
		FzfLuaBufFlagAlt = { link = "LineNr" },
		-- NETRW
	}
end

local function get_theme_colors()
	local background = vim.o.background

	if background == "light" then
		return pax_theme.light
	end

	return pax_theme.dark
end

local function load()
	vim.cmd("highlight clear")
	vim.cmd("set t_Co=256")
	vim.cmd("let g:colors_name='pax_zero'")

	local theme_colors = get_theme_colors()
	local highlight_groups = get_highlight_groups(theme_colors)

	for group, attrs in pairs(highlight_groups) do
		vim.api.nvim_set_hl(0, group, attrs)
	end
end

return { load = load }
