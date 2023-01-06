-- this file is not a lua module, but a lua script to set mapping for nvim
local bind = require('utils.keyBind')
local mapCR = bind.mapCR
local mapCmd = bind.mapCmd

local function leaderMap()
	vim.g.mapleader = ' '
	vim.keymap.set('n', ' ', '', {noremap = true})
	vim.keymap.set('x', ' ', '', {noremap = true})
end

-- basic mapping without plugin
local basicMap = {
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
	["n|;"] = mapCmd(":"),
	["n|:"] = mapCmd(";"),
}

local telescopeMap = {
	['n|<leader>ff'] = mapCR('Telescope find_files'):withSilent(),
	['n|<leader>fg'] = mapCR('Telescope live_grep'):withSilent(),
	['n|<leader>fb'] = mapCR('Telescope buffers'):withSilent(),
	['n|<leader>fh'] = mapCR('Telescope help_tags'):withSilent(),
	['n|<leader>fo'] = mapCR('Telescope oldfiles'):withSilent(),
	['n|<leader>fd'] = mapCmd( function() require("telescope").extensions["todo-comments"].todo() end):withSilent(),
}

local nvimTreeMap = {
	['n|<leader>1'] = mapCR('NvimTreeToggle'):withSilent(),
}

local cmpMap = {
	['is|<tab>'] = mapCmd(function() return vim.api.nvim_eval("vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<tab>'") end):withSilent(),
	['is|<s-tab>'] = mapCmd(function() return vim.api.nvim_eval("vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<s-tab>'") end):withSilent(),
}

local lspMap = {
	['n|<leader>ca'] = mapCmd(vim.lsp.buf.code_action):withSilent(),
	['n|<leader>cn'] = mapCmd(vim.lsp.buf.rename):withSilent(),
	['n|<leader>cf'] = mapCmd(function() vim.lsp.buf.format({ async = true }) end):withSilent(),
	['n|<leader>ch'] = mapCmd(vim.lsp.buf.hover):withSilent(),
}


leaderMap()
bind.nvimLoadMapping(basicMap)
bind.nvimLoadMapping(telescopeMap)
bind.nvimLoadMapping(nvimTreeMap)
bind.nvimLoadMapping(lspMap)
