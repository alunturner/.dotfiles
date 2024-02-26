local Layout = {
    "shortcuts/no-neck-pain.nvim",
}

Layout.config = function()
    require("no-neck-pain").setup({
        buffers = {
            wo = {
                fillchars = "eob: "
            }
        }
    })
end

return { Layout }
