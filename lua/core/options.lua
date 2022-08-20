local api = require("utils.api")

local options = {}

options.transparent = false
options.float_border = true

-- The use of winbar is temporarily deprecated,
-- it may cause errors due to the version

-- Painful questions
options.show_winbar = false
--[[ options.download_source = "https://github.com/" ]]
options.download_source = "https://hub.fastgit.xyz/"

options.lint_directory = api.path.join(vim.fn.stdpath("config"), "lint")
options.snippets_directory = api.path.join(vim.fn.stdpath("config"), "snippets")

options.database_connect = {
    {
        name = "pg",
        url = "postgres://postgres:123456@localhost:5430/ktbl",
    },
    {
        name = "dev",
        url = "mysql://askfiy@192.168.0.120/db1",
    },
    {
        name = "local",
        url = "mysql://root@localhost:3306/test",
    },
}

return options
