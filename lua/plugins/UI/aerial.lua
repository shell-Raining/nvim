local icons = require("utils.icons")
local aerial = require('aerial')

aerial.setup({
    icons = icons,
    show_guides = true,
    backends = { "lsp", "treesitter", "markdown" },
    update_events = "TextChanged,InsertLeave",
    layout = {
        min_width = 30,
        max_width = { 40, 0.2 },
    },
    lsp = {
        diagnostics_trigger_update = false,
        update_when_errors = true,
        update_delay = 300,
    },
    guides = {
        mid_item = "├─",
        last_item = "└─",
        nested_top = "│ ",
        whitespace = "  ",
    },
    filter_kind = {
        "Module",
        "Struct",
        "Interface",
        "Class",
        "Constructor",
        "Enum",
        "Function",
        "Method",
    },
})
