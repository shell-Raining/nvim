local logM = require('log.log')

require('telescope').setup {
    defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        entry_prefix = " ",
        multi_icon = " ",
        color_devicons = true,
        file_ignore_patterns = { "node_modules" },
        layout_strategy = "bottom_pane",
        layout_config = {
            bottom_pane = {
                height = 15,
                preview_cutoff = 100,
                prompt_position = "bottom",
            },
        },
    },
    pickers = {
        buffers = {
            mappings = {
                i = {
                    ["<c-d>"] = "delete_buffer",
                },
                n = {
                    ["dd"] = "delete_buffer",
                },
            },
        },
    },
    extensions = {
        fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = "smart_case",
        },
    },
}

require('telescope').load_extension('fzf')
vim.api.nvim_create_autocmd({ "BufEnter" }, {
    pattern = { "*" },
    command = "normal zx",
})
