local Treesitter = {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
}

Treesitter.config = function()
    require("nvim-treesitter.configs").setup({
        ensure_installed = {
            "css",
            "javascript",
            "lua",
            "typescript",
            "tsx",
            "vim",
            "vimdoc",
        },
        sync_install = false,
        auto_install = false,
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        }
    })
end

return { Treesitter }
