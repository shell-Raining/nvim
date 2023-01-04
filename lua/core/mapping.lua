-- this file is not a lua module, but a lua script to set mapping for nvim
local bind = require('utils.keyBind')
local mapCR = bind.mapCR
local mapCmd = bind.mapCmd

function leaderMap()
	vim.g.mapleader = ' '
	vim.keymap.set('n', ' ', '', {noremap = true})
	vim.keymap.set('x', ' ', '', {noremap = true})
end

-- basic mapping without plugin
local defMap = {
	['n|<leader><esc>'] = mapCR('wqa!'):withNoremap():withSilent(),
	['i|jj'] = mapCmd('<esc>'):withSilent(),
	['n|<esc>'] = mapCR('noh'):withSilent(),
	['n|<c-u>'] = mapCR("normal! " .. math.ceil(vim.api.nvim_win_get_height(0) / 4) .. "k"):withSilent(),
	['n|<c-d>'] = mapCR("normal! " .. math.ceil(vim.api.nvim_win_get_height(0) / 4) .. "j"):withSilent(),
	['n|<leader>cs'] = mapCR('set spell!'):withSilent(),
	['c|<m-p>'] = mapCmd('<up>'):withSilent(),
	['c|<m-n>'] = mapCmd('<down>'):withSilent(),
	['nx|k'] = mapCmd(function() return vim.v.count > 0 and "k" or "gk" end):withSilent():withExpr(),
	['nx|j'] = mapCmd(function() return vim.v.count > 0 and "j" or "gj" end):withSilent():withExpr(),
	['nx|H'] = mapCmd(function() return vim.v.count > 0 and "^" or "g^" end):withSilent():withExpr(),
	['nx|L'] = mapCmd(function() return vim.v.count > 0 and "$" or "g$" end):withSilent():withExpr(),
	['ict|<m-k>'] = mapCmd("<up>"),
	['ict|<m-j>'] = mapCmd("<down>"),
	['ict|<m-h>'] = mapCmd("<left>"),
	['ict|<m-l>'] = mapCmd("<right>"),
	["v|<"] = mapCmd("<gv"),
	["v|>"] = mapCmd(">gv"),
}

leaderMap()
bind.nvimLoadMapping(defMap)
