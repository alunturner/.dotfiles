local Formatter = {
	"stevearc/conform.nvim",
	opts = {
		formatters_by_ft = {
			javascript = { "prettierd" },
			typescript = { "prettierd" },
			javascriptreact = { "prettierd" },
			typescriptreact = { "prettierd" },
			css = { "prettierd" },
			html = { "prettierd" },
			json = { "prettierd" },
			yaml = { "prettierd" },
			markdown = { "prettierd" },
			lua = { "stylua" },
		},
		format_on_save = {
			lsp_fallback = true,
			timeout_ms = 500,
		},
	},
}

return { Formatter }
