vim.keymap.set("n", "<Esc><Esc>", "<cmd>noh<cr>", { silent = true }) -- Remove search hls
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { silent = true })
-- can be removed when https://github.com/neovim/neovim/pull/29067 available
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { silent = true })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { silent = true })
vim.keymap.set("i", "<C-j>", "<C-x><C-o>", { silent = true }) -- Lsp completion
vim.keymap.set("i", "<C-f>", "<C-x><C-f>", { silent = true }) -- Filepath completion
vim.keymap.set("n", "<C-q>", "<cmd>close<cr>", { silent = true }) -- General purpose quit

-- list add - add a file and increment the pointer
vim.keymap.set("n", "<leader>la", function()
	if pcall(vim.cmd, "argadd | next | argdedupe") then
		vim.print("File added to: arglist")
	end
end, { silent = true })

-- list delete -  remove a file and and point at prev file (or list start)
vim.keymap.set("n", "<leader>ld", function()
	local first_or_prev = vim.fn.argidx() == 0 and "first" or "prev"
	local command = string.format("argdelete %% | %s", first_or_prev)
	if pcall(vim.cmd, command) then
		vim.print("File removed from: arglist")
	end
end, { silent = true })

-- Clear the qflist or argslist
vim.keymap.set("n", "<leader>lD", function()
	local qf = vim.fn.getqflist({ size = 0, idx = 0 })
	local arg_count = vim.fn.argc()

	local command = ""

	if qf.size > 0 then
		command = "call setqflist([]) | cclose | echo 'Qf list cleared'"
	elseif arg_count > 0 then
		command = "%argdelete | echo 'Args list cleared'"
	else
		command = "echo 'No lists to clear'"
	end

	pcall(vim.cmd, command)
end, { silent = true })
-- TODO tidy up the logic and status messages, FIX this clobbers <C-i> and will
-- always do so in tmux. May need to move this to another key. I like being able
-- to trigger it with a single press though. Perhaps S-Tab could work.
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
