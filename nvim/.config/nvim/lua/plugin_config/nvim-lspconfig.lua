require("lspconfig.ui.windows").default_options = { border = "rounded" }
local lspconfig = require("lspconfig")

-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#configurations
lspconfig.ts_ls.setup({})
lspconfig.eslint.setup({
	on_attach = function(_, bufnr)
		vim.api.nvim_create_autocmd("BufWritePre", {
			buffer = bufnr,
			command = "EslintFixAll",
		})
	end,
})
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
lspconfig.css_variables.setup({})
lspconfig.cssls.setup({})
lspconfig.cssmodules_ls.setup({})

-- Use LspAttach to set mapping after the language server attaches
vim.api.nvim_create_autocmd("LspAttach", {
	callback = function(args)
		-- these could potentially be guarded, see :h lsp-config
		local opts = { buffer = args.buf }
		vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
		vim.keymap.set("n", "<leader>c", vim.lsp.buf.code_action, opts)
		vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
	end,
})

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})
