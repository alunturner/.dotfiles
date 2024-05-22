local Lsp = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
}

Lsp.config = function()
	local lspconfig = require("lspconfig")
	-- See https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#configurations
	lspconfig.tsserver.setup({})
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
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>c", vim.lsp.buf.code_action, opts)
		end,
	})
end

-- Make lsp and diagnostics look a little nicer
local _border = "rounded"
-- this shouldn't be here, can contain the diagnostic characters too
vim.diagnostic.config({ float = { border = _border }, virtual_text = false })
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = _border,
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = _border,
})

return { Lsp }
