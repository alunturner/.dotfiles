-- STEP 0 - INSTALL PACKAGE MANAGER AND SET LEADER KEY (SPACE)
-- Install lazy if not installed
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

-- Set the leader key before loading plugins
local leader = " "
vim.g.mapleader = leader
vim.g.maplocalleader = leader
vim.keymap.set({ "n", "v" }, leader, "<nop>")

-- STEP 1 - INSTALL EXTERNAL DEPENDENCIES
require("lazy").setup("plugins")

-- STEP 2 - KEY REMAPS
local function map(mode, lhs, rhs)
	vim.keymap.set(mode, lhs, rhs, { silent = true })
end
