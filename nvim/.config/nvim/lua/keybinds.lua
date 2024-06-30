vim.keymap.set("n", "<Esc><Esc>", "<cmd>noh<cr>", { silent = true }) -- Remove search hls
vim.keymap.set("n", "<leader>e", "<cmd>Ex<cr>", { silent = true })
-- can be removed when https://github.com/neovim/neovim/pull/29067 available
vim.keymap.set("n", "[d", function()
	vim.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.keymap.set("n", "]d", function()
	vim.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, { silent = true })
vim.keymap.set("i", "<C-j>", "<C-x><C-o><C-p>", { silent = true }) -- Lsp completion
vim.keymap.set("n", "<C-q>", "<cmd>close<cr>", { silent = true }) -- General purpose quit

-- list add - add a file and increment the pointer
vim.keymap.set("n", "<leader>la", function()
	if pcall(vim.cmd, "argadd | next | argdedupe") then
		print("File added to: [ARG]")
	end
end, { silent = true })

-- list delete -  remove a file and and point at prev file (or list start)
vim.keymap.set("n", "<leader>ld", function()
	local first_or_prev = vim.fn.argidx() == 0 and "first" or "prev"
	local command = string.format("argdelete %% | %s", first_or_prev)
	if pcall(vim.cmd, command) then
		print("File removed from: [ARG]")
	end
end, { silent = true })

-- list Delete all - empties qflist first, then arglist
vim.keymap.set("n", "<leader>lD", function()
	if vim.fn.getqflist({ size = 0, idx = 0 }).size > 0 then
		if pcall(vim.cmd, "call setqflist([]) | cclose") then
			print("All entries removed from: [QF]")
		end
	elseif vim.fn.argc() > 0 then
		if pcall(vim.cmd, "%argdelete") then
			print("All entries removed from: [ARG]")
		end
	else
		print("No lists to clear")
	end
end, { silent = true })

-- FIX this clobbers <C-i> and will always do so in tmux. May need to move this
-- to another key. I like being able to trigger it with a single press though.
-- Perhaps S-Tab could work.
-- Rotate through qflist, argslist or alt file
vim.keymap.set("n", "<Tab>", function()
	local initial_arg_count = vim.fn.argc()
	local initial_qf = vim.fn.getqflist({ size = 0, idx = 0 })

	if initial_qf.size > 0 then
		if pcall(vim.cmd, initial_qf.idx == initial_qf.size and "cfirst" or "cnext") then
			local current_qf = vim.fn.getqflist({ size = 0, idx = 0 })
			print("[QF] " .. current_qf.idx .. " of " .. current_qf.size)
		end
	elseif initial_arg_count > 0 then
		if pcall(vim.cmd, vim.fn.argidx() == initial_arg_count - 1 and "first" or "next") then
			print("[ARG] " .. vim.fn.argidx() + 1 .. " of " .. vim.fn.argc())
		end
	else
		pcall(vim.cmd, "e #") -- can have errors if no alt file
	end
end, { silent = true })

-- Rotate backwards through qflist or arglist
vim.keymap.set("n", "<S-Tab>", function()
	local initial_arg_count = vim.fn.argc()
	local initial_qf = vim.fn.getqflist({ size = 0, idx = 0 })

	if initial_qf.size > 0 then
		if pcall(vim.cmd, initial_qf.idx == 1 and "clast" or "cprev") then
			local current_qf = vim.fn.getqflist({ size = 0, idx = 0 })
			print("[QF] " .. current_qf.idx .. " of " .. current_qf.size)
		end
	elseif initial_arg_count > 0 then
		if pcall(vim.cmd, vim.fn.argidx() == 0 and "last" or "prev") then
			print("[ARG] " .. vim.fn.argidx() + 1 .. " of " .. vim.fn.argc())
		end
	end
end, { silent = true })
