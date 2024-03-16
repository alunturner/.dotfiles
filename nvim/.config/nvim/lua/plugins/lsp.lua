local Lsp = {
	"neovim/nvim-lspconfig",
	event = { "BufReadPre", "BufNewFile" },
}

Lsp.config = function()
	local lspconfig = require("lspconfig")

	-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#tsserver
	lspconfig.tsserver.setup({})
	-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#eslint
	lspconfig.eslint.setup({
		on_attach = function(_, bufnr)
			vim.api.nvim_create_autocmd("BufWritePre", {
				buffer = bufnr,
				command = "EslintFixAll",
			})
		end,
	})
	-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md#lua_ls
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
			vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
			vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
			vim.keymap.set("n", "<leader>r", vim.lsp.buf.rename, opts)
			vim.keymap.set("n", "<leader>c", vim.lsp.buf.code_action, opts)
		end,
	})
end

return { Lsp }
