local icons   = require('utils.icons').diagnostic
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

local basic_quick_set = function()
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

    local capabilities = vim.lsp.protocol.make_client_capabilities()

    capabilities.textDocument.completion.completionItem = {
        documentationFormat = { "markdown", "plaintext" },
        snippetSupport = true,
        preselectSupport = true,
        insertReplaceSupport = true,
        labelDetailsSupport = true,
        deprecatedSupport = true,
        commitCharactersSupport = true,
        tagSupport = { valueSet = { 1 } },
        resolveSupport = {
            properties = {
                "documentation",
                "detail",
                "additionalTextEdits",
            },
        },
    }
end

local diagnostic_quick_set = function()
    -- set diagnostic style
    vim.diagnostic.config({
        signs = true,
        underline = true,
        severity_sort = true,
        update_in_insert = false,
        float = { source = "always" },
        virtual_text = { prefix = "●", source = "always" },
    })

    for _type, icon in pairs(icons) do
        local hl = "DiagnosticSign" .. _type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end
end

local lspconfig_ui_quick_set = function()
    require("lspconfig.ui.windows").default_options.border = options.float_border and "double" or "none"
end

function get_headlers(settings)
    return vim.tbl_deep_extend("force", lsp_handlers, settings.handlers or {})
end

local entry = function()
    basic_quick_set()
    diagnostic_quick_set()
    lspconfig_ui_quick_set()
end

entry()
