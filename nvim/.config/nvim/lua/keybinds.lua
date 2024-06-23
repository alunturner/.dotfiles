vim.keymap.set("n", "<Esc><Esc>", "<cmd>noh<cr>", { silent = true }) -- Remove search hls
vim.keymap.set("n", "J", "mzJ`z", { silent = true }) -- Don't move the cursor when using J
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { silent = true })
-- can be removed when https://github.com/neovim/neovim/pull/29067 available
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { silent = true })
vim.keymap.set("i", "<C-j>", "<C-x><C-o>", { silent = true }) -- Lsp completion
vim.keymap.set("i", "<C-f>", "<C-x><C-f>", { silent = true }) -- Filepath completion

-- List add
vim.keymap.set("n", "<leader>la", function()
	-- add a file and increment the pointer
	pcall(vim.cmd, "argadd | next")

	-- get the position and show status message
	local arg_count = vim.fn.argc()
	local arg_idx = vim.fn.argidx()
	local one_based_idx = arg_idx + 1
	local location = string.format("[%i|%i]", one_based_idx, arg_count)
	local message = string.format("[A]%s File added to end of args list", location)
	vim.print(message)
end, { silent = true })
-- delete from args list and point at the previous arg or the beginning of the list
vim.keymap.set("n", "<leader>ld", function()
	-- remove the file and decrement pointer
	local first_or_prev = vim.fn.argidx() == 0 and "first" or "prev"
	local command = string.format("argdelete %% | %s", first_or_prev)
	pcall(vim.cmd, command)

	-- get the position and show status message
	local arg_count = vim.fn.argc()
	local arg_idx = vim.fn.argidx()
	local one_based_idx = arg_idx + 1

	local location = string.format("[%i|%i]", one_based_idx, arg_count)
	local message = arg_count == 0 and "[A] Args list empty"
		or string.format("[A]%s File removed from args list", location)
	vim.print(message)
end, { silent = true })
-- Clear the qflist or argslist
vim.keymap.set("n", "<leader>lD", function()
	local qf = vim.fn.getqflist({ size = 0, idx = 0 })
	local arg_count = vim.fn.argc()

	local command = ""

	if qf.size > 0 then
		command = "call setqflist([]) | echo 'Qf list cleared'"
	elseif arg_count > 0 then
		command = "%argdelete | echo 'Args list cleared'"
	else
		command = "echo 'No lists to clear'"
	end

	pcall(vim.cmd, command)
end, { silent = true })
-- TODO tidy up the logic and status messages
-- Rotate through qflist, argslist or alt file
vim.keymap.set("n", "<Tab>", function()
	local qf = vim.fn.getqflist({ size = 0, idx = 0 })
	local arg_count = vim.fn.argc()
	local arg_idx = vim.fn.argidx()

	local command = ""
	local message = ""

	if qf.size > 0 then
		command = qf.idx == qf.size and "cfirst" or "cnext"
	elseif arg_count > 0 then
		command = arg_idx == arg_count - 1 and "first | args" or "next | args"
	else
		command = "e #" -- equivalent of <C-^>
	end

	pcall(vim.cmd, command) -- can have errors if no alt file
end, { silent = true })
-- Rotate backwards through qflist, argslist or alt file
vim.keymap.set("n", "<S-Tab>", function()
	local qf = vim.fn.getqflist({ size = 0, idx = 0 })
	local arg_count = vim.fn.argc()
	local arg_idx = vim.fn.argidx()

	local command = ""

	if qf.size > 0 then
		command = qf.idx == 1 and "clast" or "cprev"
	elseif arg_count > 0 then
		command = arg_idx == 0 and "last | args" or "prev | args"
	else
		command = "e #" -- equivalent of <C-^>
	end

	pcall(vim.cmd, command) -- can have errors if no alt file
end, { silent = true })
