vim.opt_local.colorcolumn = ""
vim.opt_local.cursorcolumn = false
vim.keymap.set("n", "<C-n>", "<cmd>cnext | wincmd p<cr>", { remap = true, buffer = true })
vim.keymap.set("n", "<C-p>", "<cmd>cprev | wincmd p<cr>", { remap = true, buffer = true })
vim.keymap.set("n", "x", function()
	-- use x to filter __highlighted__ entries from the qf list
	local qf = vim.fn.getqflist({ idx = 0, items = 0 })
	local current_idx = qf.idx

	local new_qf_list = {}

	for k, v in pairs(qf.items) do
		if k ~= current_idx then
			table.insert(new_qf_list, v)
		end
	end

	vim.fn.setqflist(new_qf_list)
end, { remap = true, buffer = true })
vim.cmd("wincmd K")
