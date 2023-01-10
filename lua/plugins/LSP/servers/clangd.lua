local config = require("plugins.LSP.lspconfig")

require("lspconfig").clangd.setup({
    handlers = vim.tbl_deep_extend("force", config.lsp_handlers, {})
})
