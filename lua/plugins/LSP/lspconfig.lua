-- require'lspconfig'.setup{}
local options = require('core.options')

local lsp_hover = function(_, result, ctx, config)
    -- add file type for LSP hover
    local bufnr, winner = vim.lsp.handlers.hover(_, result, ctx, config)

    if bufnr and winner then
        vim.api.nvim_buf_set_option(bufnr, "filetype", config.filetype)
        return bufnr, winner
    end
end

local lsp_signature_help = function(_, result, ctx, config)
    -- add file type for LSP signature help
    local bufnr, winner = vim.lsp.handlers.signature_help(_, result, ctx, config)

    -- put the signature floating window above the cursor
    local current_cursor_line = vim.api.nvim_win_get_cursor(0)[1]
    local ok, win_height = pcall(vim.api.nvim_win_get_height, winner)

    if not ok then
        return
    end

    if current_cursor_line > win_height + 2 then
        ---@diagnostic disable-next-line: param-type-mismatch
        vim.api.nvim_win_set_config(winner, {
            anchor = "SW",
            relative = "cursor",
            row = 0,
            col = -1,
        })
    end

    if bufnr and winner then
        vim.api.nvim_buf_set_option(bufnr, "filetype", config.filetype)
        return bufnr, winner
    end
end

local lsp_handlers = {
    ["textDocument/hover"] = vim.lsp.with(lsp_hover, {
        border = options.float_border and "rounded" or "none",
        filetype = "lsp-hover",
    }),
    ["textDocument/signatureHelp"] = vim.lsp.with(lsp_signature_help, {
        border = options.float_border and "rounded" or "none",
        filetype = "lsp-signature-help",
    }),
}

require("lspconfig").sumneko_lua.setup({
    settings = {
        Lua = {
            runtime = {
                -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
                version = "LuaJIT",
            },
            diagnostics = {
                -- Get the language server to recognize the `vim` global
                globals = { "vim" },
            },
            workspace = {
                -- Make the server aware of Neovim runtime files
                library = vim.api.nvim_get_runtime_file("", true),
            },
            -- Do not send telemetry data containing a randomized but unique identifier
            telemetry = {
                enable = false,
            },
        },
    },
    handlers = vim.tbl_deep_extend("force", lsp_handlers, {})
})

require("lspconfig").yamlls.setup({})
require("lspconfig").clangd.setup({})
require("lspconfig").pyright.setup({})
require("lspconfig").marksman.setup({})
require("lspconfig").volar.setup({
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
})
-- require('lspconfig').marksman.setup {}
