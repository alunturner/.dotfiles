vim.g.mapleader = " "
vim.g.maplocalleader = " "
vim.keymap.set({ "n", "v" }, " ", "<nop>", { silent = true })

-- PLUGIN CONFIGURATION
require("plugin_config.fzf-lua")
require("plugin_config.nvim-lspconfig")
require("plugin_config.other")

-- KEYBINDS
local ERROR = { severity = vim.diagnostic.severity.ERROR }
vim.keymap.set("n", "<Esc><Esc>", "<cmd>noh<cr>", { silent = true })
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { silent = true })
vim.keymap.set("n", "[e", function()
	vim.diagnostic.goto_prev(ERROR)
end, { silent = true })
vim.keymap.set("n", "]e", function()
	vim.diagnostic.goto_next(ERROR)
end, { silent = true })
vim.keymap.set("i", "<C-j>", "<C-x><C-o>", { silent = true }) -- Lsp completion
vim.keymap.set("n", "<C-q>", "<cmd>close<cr>", { silent = true }) -- General purpose quit
vim.api.nvim_create_user_command("Tsc", function()
	-- TODO figure out making this a watcher type thing using pipes.
	-- previous implementation was a bind that called:
	-- "<cmd>compiler tsc | echo 'Building TypeScript...' | silent make! --noEmit | echo 'TypeScript built.' | copen<cr>"
	-- See https://github.com/jellydn/typecheck.nvim/blob/main/lua/typecheck/utils.lua

	-- STEPS
	-- try and use this example: https://www.reddit.com/r/neovim/comments/t9e546/run_external_process_from_neovim_with_lua/
	-- to run a single command line thing, then output that into the qf list
	print("WIP - run tsc in watch mode")
	local stdout = vim.uv.new_pipe()
	local stderr = vim.uv.new_pipe()

	local function on_read(err, data)
		assert(not err, err)
		print(data)
	end
	local function on_error(err, data)
		assert(not err, err)
		if data then
			print(data)
		end
	end
	local handle
	handle, _ = vim.uv.spawn(
		"echo",
		{ args = { "hello there" }, stdio = { nil, stdout, stderr }, cwd = "~/" },
		vim.schedule_wrap(function()
			stdout:read_stop()
			stderr:read_stop()
			stdout:close()
			stderr:close()
			handle:close()
		end)
	)

	vim.uv.read_start(stdout, on_read)
	vim.uv.read_start(stderr, on_error)
	vim.uv.run("once")

	-- here try and get a detached tmux session running with something (can be tsc in future)
	vim.cmd("!tmux list-keys")
end, {})

-- OPTIONS
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

vim.diagnostic.config({
	float = { border = "rounded", severity_sort = true },
	severity_sort = true,
	virtual_text = false,
	jump = { float = true }, -- see https://github.com/neovim/neovim/pull/29067
})

function WinBar()
	local icon = vim.bo.modified and "" or ""
	return "%=%#Normal# " .. icon .. " %t %*%="
end
vim.opt.winbar = "%{%v:lua.WinBar()%}"

function Ruler()
	local has_errors = vim.diagnostic.count(0)[vim.diagnostic.severity.ERROR] or 0 > 0
	return has_errors and "%#DiagnosticError#███" or ""
end
vim.opt.rulerformat = "%3(%=%{%v:lua.Ruler()%}%)"

-- INITIALISE
vim.opt.background = "dark"
vim.cmd("colorscheme pax")
vim.cmd("au VimEnter * FzfLua files")
