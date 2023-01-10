local options = require("core.options")

require("mason").setup({
    ui = {
        border = options.float_border and "double" or "none",
        icons = {
            package_installed = "",
            package_pending = "",
            package_uninstalled = "",
        },
    },
})
