local Autocomplete = {
	"echasnovski/mini.completion",
	version = false,
}

Autocomplete.config = function()
	require("mini.completion").setup({
		-- search MiniCompletionSetup for help
		delay = { completion = 1000, info = 1000, signature = 1000 },
		window = {
			info = { height = 7, width = 80, border = "double" },
			signature = { height = 7, width = 80, border = "none" },
		},
		lsp_completion = {
			-- we use omnifunc and attach it manually in lsp initialisation
			source_func = "omnifunc",
			auto_setup = false,
		},
		fallback_action = function() end,
		mappings = {
			force_twostep = "<C-Space>", -- Force two-step completion
			force_fallback = "<A-Space>", -- Force fallback completion
		},
		-- Whether to set Vim's settings for better experience (modifies
		-- `shortmess` and `completeopt`)
		set_vim_settings = true,
	})
end

return { Autocomplete }
