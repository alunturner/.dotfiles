local Linter = {
	"mfussenegger/nvim-lint",
	pin = true,
}

Linter.config = function()
	require("lint").linters_by_ft = {
		javascript = { "eslint_d" },
		typescript = { "eslint_d" },
		javascriptreact = { "eslint_d" },
		typescriptreact = { "eslint_d" },
	}
end

vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
	callback = function()
		require("lint").try_lint()
	end,
})

return { Linter }
