vim.keymap.set("n", "<Esc><Esc>", "<cmd>noh<cr>", { silent = true }) -- Remove search hls
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { silent = true })
vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.keymap.set("n", "3", function()
	local qf_start = vim.fn.getqflist({ idx = 0, size = 0 })

	if qf_start.size == 0 then
		return print("[QF] empty")
	elseif qf_start.idx == 1 then
		return print("[QF] 1 of " .. qf_start.size)
	else
		vim.cmd("cprev")
		local qf_end = vim.fn.getqflist({ idx = 0, size = 0 })
		print("[QF] " .. qf_end.idx .. " of " .. qf_end.size)
	end
end)
vim.keymap.set("n", "4", function()
	local qf_start = vim.fn.getqflist({ idx = 0, size = 0 })

	if qf_start.size == 0 then
		return print("[QF] empty")
	elseif qf_start.idx == qf_start.size then
		return print("[QF] " .. qf_start.idx .. " of " .. qf_start.size)
	else
		vim.cmd("cnext")
		local qf_end = vim.fn.getqflist({ idx = 0, size = 0 })
		print("[QF] " .. qf_end.idx .. " of " .. qf_end.size)
	end
end)
vim.keymap.set("n", "6", "<C-6>", { silent = true })
vim.keymap.set("n", "7", function()
	if vim.fn.argc() == 0 then
		return print("[ARG] empty")
	elseif vim.fn.argidx() == 0 then
		return print("[ARG] 1 of " .. vim.fn.argc())
	else
		vim.cmd("prev")
		print("[ARG] " .. vim.fn.argidx() + 1 .. " of " .. vim.fn.argc())
	end
end)
vim.keymap.set("n", "8", function()
	if vim.fn.argc() == 0 then
		return print("[ARG] empty")
	elseif vim.fn.argidx() == vim.fn.argc() - 1 then
		return print("[ARG] " .. vim.fn.argidx() + 1 .. " of " .. vim.fn.argc())
	else
		vim.cmd("next")
		print("[ARG] " .. vim.fn.argidx() + 1 .. " of " .. vim.fn.argc())
	end
end)
-- arglist add - add a file and increment the pointer
vim.keymap.set("n", "9", function()
	if pcall(vim.cmd, "argadd | next | argdedupe") then
		print("File added to: [ARG]")
	end
end, { silent = true })
-- arglist delete -  remove a file and and point at prev file (or list start)
vim.keymap.set("n", "0", function()
	local first_or_prev = vim.fn.argidx() == 0 and "first" or "prev"
	local command = string.format("argdelete %% | %s", first_or_prev)
	if pcall(vim.cmd, command) then
		print("File removed from: [ARG]")
	end
end, { silent = true })
vim.keymap.set("i", "<C-j>", "<C-x><C-o><C-p>", { silent = true }) -- Lsp completion
vim.keymap.set("n", "<C-q>", "<cmd>close<cr>", { silent = true }) -- General purpose quit
vim.keymap.set(
	"n",
	"<leader>m",
	"<cmd>compiler tsc | echo 'Building TypeScript...' | silent make! --noEmit | echo 'TypeScript built.' | copen<cr>"
)
