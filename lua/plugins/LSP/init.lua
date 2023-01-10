local pluginUtil = require('utils.plugin')

-- pluginUtil.loadCwdPlug('plugins.LSP')

require('plugins.LSP.mason')
require('plugins.LSP.mason-lspconfig')
require('plugins.LSP.lspconfig')
require("plugins.LSP.null-ls")
