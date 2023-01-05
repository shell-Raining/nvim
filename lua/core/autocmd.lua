local options = require("core.options")

-- auto save buffer
if options.autoSave then
    vim.api.nvim_create_autocmd({ "InsertLeave", "TextChanged" }, {
        pattern = { "*" },
        command = "silent! wall",
        nested = true,
    })
end

-- auto reload log file
if options.autoReload then
    vim.api.nvim_create_autocmd({ "FocusGained", "BufEnter", "CursorHold", "CursorHoldI" }, {
        pattern = { "*" },
        callback = function()
            if vim.fn.mode() ~= "c" then
                vim.cmd([[checktime]])
            end
        end,
    })
end

-- switch input method
if options.autoSwitchInput then
    vim.api.nvim_create_autocmd({ "InsertLeave" }, {
        pattern = { "*" },
        callback = function()
            local input_status = tonumber(vim.fn.system("fcitx5-remote"))
            if input_status == 2 then
                vim.fn.system("fcitx5-remote -c")
            end
        end,
    })
end

-- auto restore cursor position
if options.autoRestoreCursePostion then
    vim.api.nvim_create_autocmd("BufReadPost", {
        pattern = { "*" },
        callback = function()
            if vim.fn.line("'\"") > 0 and vim.fn.line("'\"") <= vim.fn.line("$") then
                vim.fn.setpos(".", vim.fn.getpos("'\""))
                -- how do I center the buffer in a sane way??
                -- vim.cmd('normal zz')
                -- vim.cmd("silent! foldopen")
            end
        end,
    })
end

-- remove auto-comments
if options.autoRemoveNewLineComment then
    vim.api.nvim_create_autocmd({ "BufEnter" }, {
        pattern = { "*" },
        callback = function()
            vim.opt.formatoptions = vim.opt.formatoptions - { "c", "r", "o" }
        end,
    })
end
