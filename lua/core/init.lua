local global = require('core.global')
local vim = vim

function leaderMap()
	vim.g.mapleader = ' '
	vim.keymap.set('n', ' ', '', {noremap = true})
	vim.keymap.set('x', ' ', '', {noremap = true})
end


local loadCore = function()
	local pack = require('core.pack')
	-- createDir()
	leaderMap()

	-- pack.ensurePlugins()
	-- clipboardConfig()

	require('core.options')
	require('core.mapping')
	require('core.event')
	require('keymap')
	-- pack.loadCompile()

	-- vim.api.nvim_command([[colorscheme catppucccin]])
end

loadCore()
