local Theme = {
	"Mofiqul/vscode.nvim",
}

Theme.config = function()
	local vscode = require("vscode")

	vscode.setup({ style = "dark" })

	vscode.load()
end

return { Theme }
