local Surround = {
	"kylechui/nvim-surround",
	version = "*",
	event = "VeryLazy",
}

Surround.config = function()
	require("nvim-surround").setup()
end

return { Surround }
