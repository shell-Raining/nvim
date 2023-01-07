local options = require("core.options")

require("mason").setup({
	ui = {
		border = options.float_border and "double" or "none",
		icons = {
			package_installed = "",
			package_pending = "",
			package_uninstalled = "",
		},
	},
})
require("mason-lspconfig").setup({})

-- require'lspconfig'.setup{}
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
})

require("lspconfig").yamlls.setup({})
require("lspconfig").clangd.setup({})
require("lspconfig").pyright.setup({})
require("lspconfig").volar.setup({
	filetypes = { "typescript", "javascript", "javascriptreact", "typescriptreact", "vue", "json" },
})
-- require('lspconfig').marksman.setup {}
