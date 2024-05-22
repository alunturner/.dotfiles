local set = vim.keymap.set
set("n", "<Esc>", "<cmd>nohl<cr>", { silent = true }) -- Quick way to remove highlighting
set("n", "Y", "y$", { silent = true }) -- Make Y act like C and D
set("n", "J", "mzJ`z", { silent = true }) -- Don't move the cursor when using J
set("n", "<leader>e", "<cmd>Ex<cr>", { silent = true }) -- netrw
-- Prev/next movements (can't drop diagnostics, popup doesn't open with the default bind)
set("n", "[d", vim.diagnostic.goto_prev, { silent = true })
set("n", "]d", vim.diagnostic.goto_next, { silent = true })
set("n", "[c", "<cmd>cprev<cr>", { silent = true })
set("n", "]c", "<cmd>cnext<cr>", { silent = true })
set("n", "<Tab>", "<C-6>", { silent = true })
-- Experimental tmux test runner bind, WIP
set("n", "<leader>tt", "<cmd>!tmux split-window -h 'echo %:t | less'<cr>", { silent = true })
-- Insertion mode completion
set("i", "<C-j>", "<C-x><C-o>", { silent = true }) -- lsp
set("i", "<C-f>", "<C-x><C-f>", { silent = true }) -- filepath
