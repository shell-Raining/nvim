local config = require("plugins.LSP.lspconfig")

require("lspconfig").yamlls.setup({
    handlers = vim.tbl_deep_extend("force", config.lsp_handlers, {})
})
