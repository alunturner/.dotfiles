local Layout = {
    "shortcuts/no-neck-pain.nvim",
}

Layout.config = function()
    require("no-neck-pain").setup({})
end

return { Layout }
