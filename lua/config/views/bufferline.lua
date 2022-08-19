-- https://github.com/akinsho/bufferline.nvim

local api = require("utils.api")
local public = require("utils.public")
local icons = public.get_icons("diagnostic", true)

local M = {
    requires = {
        "bufferline",
    },
}

function M.before()
    M.register_key()
end

function M.load()
    M.bufferline.setup({
        options = {
            themable = true,
            show_close_icon = true,
            -- ordinal
            numbers = "none",
            indicator_icon = "▎",
            buffer_close_icon = "",
            modified_icon = "●",
            close_icon = "",
            left_trunc_marker = "",
            right_trunc_marker = "",
            diagnostics = "nvim_lsp",
            separator_style = "thin",
            ---@diagnostic disable-next-line: unused-local
            diagnostics_indicator = function(count, level, diagnostics_dict, context)
                local message
                if diagnostics_dict.error then
                    message = string.format("%s%s", icons.Error, diagnostics_dict.error)
                elseif diagnostics_dict.warning then
                    message = string.format("%s%s", icons.Warn, diagnostics_dict.warning)
                elseif diagnostics_dict.info then
                    message = string.format("%s%s", icons.Info, diagnostics_dict.info)
                elseif diagnostics_dict.hint then
                    message = string.format("%s%s", icons.Hint, diagnostics_dict.hint)
                else
                    message = ""
                end
                return message
            end,
            -- custom_areas = {
            --     right = function()
            --         return {
            --             { text = "  ", guifg = "#f28fad", guibg = "#1A1826" },
            --         }
            --     end,
            -- },
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
end

function M.after()
    vim.api.nvim_create_user_command("BufferDelete", function()
        ---@diagnostic disable-next-line: missing-parameter
        local file_exists = vim.fn.filereadable(vim.fn.expand("%p"))
        local modified = vim.api.nvim_buf_get_option(0, "modified")

        if file_exists == 0 and modified then
            vim.notify("The file is not saved", "WARN", { title = "Buffer" })
            return
        end

        local force = not vim.bo.buflisted or vim.bo.buftype == "nofile"

        vim.cmd(force and "bd!" or string.format("bp | bd! %s", vim.api.nvim_get_current_buf()))
    end, {})
end

function M.register_key()
    api.map.bulk_register({
        {
            mode = { "n" },
            lhs = "<c-q>",
            rhs = "<cmd>BufferDelete<cr>",
            options = { silent = true },
            description = "Close current buffer",
        },
        {
            mode = { "n" },
            lhs = "<c-h>",
            rhs = "<cmd>BufferLineCyclePrev<cr>",
            options = { silent = true },
            description = "Go to left buffer",
        },
        {
            mode = { "n" },
            lhs = "<c-l>",
            rhs = "<cmd>BufferLineCycleNext<cr>",
            options = { silent = true },
            description = "Go to right buffer",
        },
        {
            mode = { "n" },
            lhs = "<c-e>",
            rhs = "<cmd>BufferLineMovePrev<cr>",
            options = { silent = true },
            description = "Move current buffer to left",
        },
        {
            mode = { "n" },
            lhs = "<c-y>",
            rhs = "<cmd>BufferLineMoveNext<cr>",
            options = { silent = true },
            description = "Move current buffer to right",
        },
        {
            mode = { "n" },
            lhs = "<leader>bn",
            rhs = "<cmd>enew<cr>",
            options = { silent = true },
            description = "Create new buffer",
        },
        {
            mode = { "n" },
            lhs = "<leader>bh",
            rhs = "<cmd>BufferLineCloseLeft<cr>",
            options = { silent = true },
            description = "Close all left buffers",
        },
        {
            mode = { "n" },
            lhs = "<leader>bl",
            rhs = "<cmd>BufferLineCloseRight<cr>",
            options = { silent = true },
            description = "Close all right buffers",
        },
        {
            mode = { "n" },
            lhs = "<leader>bo",
            rhs = function()
                vim.cmd("BufferLineCloseLeft")
                vim.cmd("BufferLineCloseRight")
            end,
            options = { silent = true },
            description = "Close all other buffers",
        },
        {
            mode = { "n" },
            lhs = "<leader>ba",
            rhs = function()
                vim.cmd("BufferLineCloseLeft")
                vim.cmd("BufferLineCloseRight")
                vim.cmd("BufferDelete")
            end,
            options = { silent = true },
            description = "Close all buffers",
        },
        {
            mode = { "n" },
            lhs = "<leader>bt",
            rhs = "<cmd>BufferLinePick<cr>",
            options = { silent = true },
            description = "Go to buffer *",
        },
        {
            mode = { "n" },
            lhs = "<leader>bs",
            rhs = "<cmd>BufferLineSortByExtension<cr>",
            options = { silent = true },
            description = "Buffers sort (by extension)",
        },
        {
            mode = { "n" },
            lhs = "<leader>b1",
            rhs = "<cmd>BufferLineGoToBuffer 1<cr>",
            options = { silent = true },
            description = "Go to buffer 1",
        },
        {
            mode = { "n" },
            lhs = "<leader>b2",
            rhs = "<cmd>BufferLineGoToBuffer 2<cr>",
            options = { silent = true },
            description = "Go to buffer 2",
        },
        {
            mode = { "n" },
            lhs = "<leader>b3",
            rhs = "<cmd>BufferLineGoToBuffer 3<cr>",
            options = { silent = true },
            description = "Go to buffer 3",
        },
        {
            mode = { "n" },
            lhs = "<leader>b4",
            rhs = "<cmd>BufferLineGoToBuffer 4<cr>",
            options = { silent = true },
            description = "Go to buffer 4",
        },
        {
            mode = { "n" },
            lhs = "<leader>b5",
            rhs = "<cmd>BufferLineGoToBuffer 5<cr>",
            options = { silent = true },
            description = "Go to buffer 5",
        },
        {
            mode = { "n" },
            lhs = "<leader>b6",
            rhs = "<cmd>BufferLineGoToBuffer 6<cr>",
            options = { silent = true },
            description = "Go to buffer 6",
        },
        {
            mode = { "n" },
            lhs = "<leader>b7",
            rhs = "<cmd>BufferLineGoToBuffer 7<cr>",
            options = { silent = true },
            description = "Go to buffer 7",
        },
        {
            mode = { "n" },
            lhs = "<leader>b8",
            rhs = "<cmd>BufferLineGoToBuffer 8<cr>",
            options = { silent = true },
            description = "Go to buffer 8",
        },
        {
            mode = { "n" },
            lhs = "<leader>b9",
            rhs = "<cmd>BufferLineGoToBuffer 9<cr>",
            options = { silent = true },
            description = "Go to buffer 9",
        },
    })
end

return M
