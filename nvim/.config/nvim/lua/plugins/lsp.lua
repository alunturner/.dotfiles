local Lsp = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
	},
}

Lsp.config = function()
	local lspconfig = require("lspconfig")
	local mason = require("mason")
	local mason_lspconfig = require("mason-lspconfig")

	-- https://github.com/williamboman/mason.nvim/tree/dcd0ea30ccfc7d47e879878d1270d6847a519181?tab=readme-ov-file#configuration
	mason.setup({
		ui = {
			icons = {
				package_installed = "✓",
				package_pending = "➜",
				package_uninstalled = "✗",
			},
		},
	})

	-- https://github.com/williamboman/mason.nvim/tree/dcd0ea30ccfc7d47e879878d1270d6847a519181?tab=readme-ov-file#configuration
	mason_lspconfig.setup({
		ensure_installed = {
			"tsserver",
			"lua_ls",
		},
	})

	-- after setting up mason and mason lsp-config, we can configure lsp
	-- https://github.com/williamboman/mason.nvim/tree/dcd0ea30ccfc7d47e879878d1270d6847a519181?tab=readme-ov-file#configuration
	lspconfig.tsserver.setup({})
	lspconfig.lua_ls.setup({
		-- stop the lua lsp complaining about calling `vim`
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
			},
		},
	})

	-- Global mappings.
	-- See `:help vim.diagnostic.*` for documentation on any of the below functions
	vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
	vim.keymap.set("n", "]d", vim.diagnostic.goto_next)
	vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist)

	-- Use LspAttach autocommand to only map the following keys
	-- after the language server attaches to the current buffer
	vim.api.nvim_create_autocmd("LspAttach", {
		group = vim.api.nvim_create_augroup("UserLspConfig", {}),
		callback = function(ev)
			-- Enable completion triggered by <c-x><c-o>
			vim.bo[ev.buf].omnifunc = "v:lua.vim.lsp.omnifunc"

			-- Buffer local mappings.
			-- See `:help vim.lsp.*` for documentation on any of the below functions
			local opts = { buffer = ev.buf }
			vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
			vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)
		end,
	})
end

return { Lsp }
