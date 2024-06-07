local Lsp = {
	"neovim/nvim-lspconfig",
	pin = true,
}

Lsp.config = function()
	require("lspconfig.ui.windows").default_options = { border = "rounded" }
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
end

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
	border = "rounded",
})
vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
	border = "rounded",
})

vim.ui.input = function(opts, on_confirm)
	local float_opts = vim.lsp.util.make_floating_popup_options(20, 1, { anchor_bias = "above", border = "rounded" })
	local win_opts = vim.tbl_deep_extend("force", float_opts, { title = opts.prompt })
	local buffer = vim.api.nvim_create_buf(false, true)
	local window = vim.api.nvim_open_win(buffer, true, win_opts)
	vim.cmd("startinsert")

	-- Enter to confirm
	vim.keymap.set({ "n", "i", "v" }, "<cr>", function()
		local lines = vim.api.nvim_buf_get_lines(buffer, 0, 1, false)
		if on_confirm then
			on_confirm(lines[1])
		end
		vim.api.nvim_win_close(window, true)
		vim.cmd("stopinsert")
	end, { buffer = buffer })

	-- Esc or q to close
	vim.keymap.set("n", "<esc>", function()
		vim.api.nvim_win_close(window, true)
	end, { buffer = buffer })
	vim.keymap.set("n", "q", function()
		vim.api.nvim_win_close(window, true)
	end, { buffer = buffer })
end

return { Lsp }
