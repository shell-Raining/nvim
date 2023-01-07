local options = {}

options.transparent = true
options.float_border = true
options.show_winbar = true

options.download_source = "https://github.com/"
-- options.download_source = "https://hub.fastgit.xyz/"

-- options.lint_directory = api.path.join(vim.fn.stdpath("config"), "lint")
-- options.snippets_directory = api.path.join(vim.fn.stdpath("config"), "snippets")

-- auto command manager
options.autoSave = true
options.autoReload = false
options.autoSwitchInput = true
options.autoRestoreCursePostion = true
options.autoRemoveNewLineComment = true

-- cmp UI
options.floatBorder = true

options.unloadPlugins = {
	"init",
}

return options
