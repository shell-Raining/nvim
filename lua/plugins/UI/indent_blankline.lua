vim.opt.list = true
-- vim.opt.listchars:append("space:⋅")
-- vim.opt.listchars:append "eol:↴"

vim.g.indent_blankline_filetype_exclude = {
    "NvimTree",
    "aerial",
    "undotree",
    "spectre_panel",
    "dbui",
    "toggleterm",
    "notify",
    "startuptime",
    "packer",
    "lsp-installer",
    "help",
    "terminal",
    "lspinfo",
    "TelescopePrompt",
    "TelescopeResults",
    "",
}

require("indent_blankline").setup({
    show_current_context_start = true,
    show_current_context = true,
    show_end_of_line = true,
})
