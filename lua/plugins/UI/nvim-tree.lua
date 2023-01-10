local icons = require "utils.icons"

-- empty setup using defaults
require("nvim-tree").setup({
    disable_netrw = false,
    hijack_netrw = false,
    hijack_cursor = true,
    update_cwd = true,
    ignore_ft_on_setup = { "dashboard" },
    reload_on_bufenter = true,
    notify = {
        threshold = vim.log.levels.WARN,
    },
    update_focused_file = {
        enable = true,
        update_cwd = false,
    },
    view = {
        side = "left",
        width = 30,
        hide_root_folder = false,
        signcolumn = "yes",
        mappings = {
            list = {
                { key = "?", action = "toggle_help" },
            },
        },
    },
    diagnostics = {
        enable = false,
        show_on_dirs = false,
        icons = {
            hint = icons.Hint,
            info = icons.Info,
            warning = icons.Warn,
            error = icons.Error,
        },
    },
    actions = {
        use_system_clipboard = false,
        change_dir = {
            enable = true,
            global = true,
            restrict_above_cwd = false,
        },
        open_file = {
            resize_window = true,
            window_picker = {
                enable = true,
            },
        },
    },
    trash = {
        cmd = "trash",
        require_confirm = true,
    },
    filters = {
        dotfiles = false,
        custom = { "node_modules", "\\.cache", "__pycache__" },
        exclude = {},
    },
    renderer = {
        add_trailing = true,
        highlight_git = true,
        highlight_opened_files = "none",
        icons = {
            show = {
                file = true,
                folder = true,
                folder_arrow = true,
                git = false,
            },
            glyphs = {
                default = "",
                symlink = "",
                git = {
                    unstaged = "",
                    staged = "",
                    unmerged = "",
                    renamed = "凜",
                    untracked = "",
                    deleted = "",
                    ignored = "",
                },
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
            },
        },
    },
})
