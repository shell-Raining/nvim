return {
    adapters = {
        lldb = {
            type = "executable",
            command = "/opt/homebrew/Cellar/llvm/14.0.6_1/bin/lldb-vscode", -- adjust as needed, must be absolute path
            name = "lldb",
        },
    },
    configurations = {
        cpp = {
            {
                name = "Launch",
                type = "lldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {},
            },
        },
        c = {
            {
                name = "Launch",
                type = "lldb",
                request = "launch",
                program = function()
                    return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
                end,
                cwd = "${workspaceFolder}",
                stopOnEntry = false,
                args = {},
            },
        },
    },
}
