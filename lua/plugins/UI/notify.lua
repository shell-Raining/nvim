local options = require('core.options')
local icons = require('utils.icons')
local notify = require('notify')

local notify_options = {
    stages = "fade",
    timeout = 3000,
    fps = 120,
    icons = {
        ERROR = icons.Error,
        WARN = icons.Warn,
        INFO = icons.Hint,
    },
}

local echo_message = {
    -- DAP
    "could not find file",
    "Debug adapter disconnected",
    "No stopped threads. Cannot move",
    -- TODO-command
    "Invalid buffer id: %d*",
    -- LSP
    "method textDocument/codeAction is not supported by any of the servers registered for the current buffer",
    "method textDocument/signatureHelp is not supported by any of the servers registered for the current buffer",
    "method textDocument/documentSymbol is not supported by any of the servers registered for the current buffer",
}

local ignore_message = {
    -- LSP
    "%[LSP%]%[.+%] timeout",
    "LSP%[id=%d*%] client has shut down after sending Log",
    "LSP%[id=%d*%] client has shut down during progress update",
    "LSP%[id=%d*%] client has shut down while creating progress report",
    "LSP%[%d*%] client has shut down after sending a workspace/configuration request",
    "method textDocument/signatureHelp is not supported by any of the servers registered for the current buffer",
    "method textDocument/documentSymbol is not supported by any of the servers registered for the current buffer",
    "warning: multiple different client offset_encodings detected for buffer, this is not supported yet",
    'Server "emmet_ls" does not support documentSymbols.',
}

if options.transparent then
    notify_options.background_colour = "#1E1E2E"
end

notify.setup(notify_options)

vim.notify = setmetatable({}, {
    ---@diagnostic disable-next-line: unused-local
    __call = function(self, message, ...)
        for _, v in ipairs(ignore_message) do
            if message:match(v) then
                return
            end
        end

        for _, v in ipairs(echo_message) do
            if message:match(v) then
                vim.api.nvim_echo({ { message, "MoreMsg" } }, false, {})
                return
            end
        end

        return notify(message, ...)
    end,

    __index = notify,
})
