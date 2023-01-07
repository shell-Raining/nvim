local null_ls = require("null-ls")
null_ls.setup({
	sources = {
		null_ls.builtins.code_actions.gitsigns,
		null_ls.builtins.formatting.stylua,
		-- null_ls.builtins.diagnostics.eslint,
		null_ls.builtins.formatting.codespell,
		null_ls.builtins.formatting.prettier,
		null_ls.builtins.formatting.autopep8,
		null_ls.builtins.formatting.bean_format,
		null_ls.builtins.formatting.clang_format,
	},
})
