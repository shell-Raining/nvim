local config = require("plugins.LSP.lspconfig")

require("lspconfig").volar.setup({
    filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
    handlers = vim.tbl_deep_extend("force", config.lsp_handlers, {})
})
