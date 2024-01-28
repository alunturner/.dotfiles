local Explorer = { "SidOfc/carbon.nvim" }

Explorer.config = function()
	require("carbon").setup()

	vim.keymap.set("n", "<leader>e", "<cmd>Fcarbon<CR>")
end

return { Explorer }
