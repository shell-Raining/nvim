require("bufferline").setup({
    options = {
        numbers = "ordinal",
        separator_style = 'slant',
        highlights = require("catppuccin.groups.integrations.bufferline").get(),
        offsets = {
            {
                filetype = "NvimTree",
                text = "File Explorer",
                highlight = "Directory",
                text_align = "center",
            },
            {
                filetype = "aerial",
                text = "Outline Explorer",
                highlight = "Directory",
                text_align = "center",
            },
            {
                filetype = "undotree",
                text = "Undo Explorer",
                highlight = "Directory",
                text_align = "center",
            },
            {
                filetype = "dbui",
                text = "Database Explorer",
                highlight = "Directory",
                text_align = "center",
            },
            {
                filetype = "spectre_panel",
                text = "Project Blurry Search",
                highlight = "Directory",
                text_align = "center",
            },
            {
                filetype = "toggleterm",
                text = "Integrated Terminal",
                highlight = "Directory",
                text_align = "center",
            },
        },
    },
})
