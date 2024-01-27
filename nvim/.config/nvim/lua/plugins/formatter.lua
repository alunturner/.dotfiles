local Formatter = {
	"stevearc/conform.nvim",
	event = { "BufReadPre", "BufNewFile" },
}

Formatter.config = function()
	local conform = require("conform")
	local format_on_save_config = {
		lsp_fallback = true,
		async = false,
		timeout_ms = 500,
	}

	conform.setup({
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
		format_on_save = format_on_save_config,
	})

	vim.keymap.set("n", "<leader>p", function()
		conform.format(format_on_save_config)
	end)
end

return { Formatter }
