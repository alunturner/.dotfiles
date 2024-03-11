local Finder = {
    "ibhagwan/fzf-lua",
}

local function fzf_set(bind, picker)
    -- see https://github.com/ibhagwan/fzf-lua?tab=readme-ov-file#commands
    local prefix = "<cmd>lua require('fzf-lua')."
    local suffix = "()<cr>"

    vim.keymap.set("n", bind, prefix .. picker .. suffix);
end

Finder.config = function()
    require("fzf-lua").setup({})

    -- Buffers and Files
    fzf_set("<leader>ff", "files")
    fzf_set("<leader>fb", "buffers")
    fzf_set("<leader>fc", "quickfix")
    fzf_set("<leader>fl", "loclist")

    -- Search
    fzf_set("<leader>fs", "grep_project")
    fzf_set("<leader>fw", "grep_cword")
    fzf_set("<leader>fW", "grep_cWORD")

    -- LSP/Diagnostics
    fzf_set("<leader>fd", "lsp_document_diagnostics")
    fzf_set("<leader>fD", "lsp_workspace_diagnostics")
    fzf_set("<leader>fo", "lsp_document_symbols")
    fzf_set("<leader>fO", "lsp_workspace_symbols")
    fzf_set("<leader>gr", "lsp_references")
    fzf_set("<leader>gd", "lsp_definitions")
    fzf_set("<leader>gD", "lsp_declarations")
    fzf_set("<leader>gt", "lsp_typedefs")
    fzf_set("<leader>gd", "lsp_definitions")

    -- Misc
    fzf_set("<leader>fh", "help_tags")
    fzf_set("<leader>fco", "highlights")
end

return { Finder }
