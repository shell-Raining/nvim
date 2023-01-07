-- default configuration
require("illuminate").configure({
	-- providers: provider used to get references in the buffer, ordered by priority
	providers = {
		-- "lsp",
		"treesitter",
		"regex",
	},
	-- delay: delay in milliseconds
	delay = 100,
	-- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
	filetypes_denylist = {
		"NvimTree",
		"aerial",
		"undotree",
		"spectre_panel",
		"dbui",
		"toggleterm",
		"notify",
		"startuptime",
		"packer",
		"lsp-installer",
		"help",
		"terminal",
		"lspinfo",
		"TelescopePrompt",
		"TelescopeResults",
		"",
	},
	modes_denylist = {'i'},
	under_cursor = true,
})
