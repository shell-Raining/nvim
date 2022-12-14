-- this file is not a lua module, but a lua script to set mapping for nvim
local bind = require('utils.keyBind')
local options = require('core.options')
local mapCR = bind.mapCR
local mapCmd = bind.mapCmd

local function leaderMap()
    vim.g.mapleader = ' '
    vim.keymap.set('n', ' ', '', { noremap = true })
    vim.keymap.set('x', ' ', '', { noremap = true })
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
    ["n|;"] = mapCmd(":"):withNoremap(),
    ["n|:"] = mapCmd(";"):withNoremap(),
    ["v|Y"] = mapCmd('"+y'),
}

local telescopeMap = {
    ['n|<leader>ff'] = mapCR('Telescope find_files'):withSilent(),
    ['n|<leader>fg'] = mapCR('Telescope live_grep'):withSilent(),
    ['n|<leader>fb'] = mapCR('Telescope buffers'):withSilent(),
    ['n|<leader>fh'] = mapCR('Telescope help_tags'):withSilent(),
    ['n|<leader>fo'] = mapCR('Telescope oldfiles'):withSilent(),
    ['n|<leader>f;'] = mapCR('Telescope command_history'):withSilent(),
    ['n|<leader>f/'] = mapCR('Telescope search_history'):withSilent(),
    ['n|<leader>fd'] = mapCmd(function() require("telescope").extensions["todo-comments"].todo() end):withSilent(),
}

local nvimTreeMap = {
    ['n|<leader>u1'] = mapCR('NvimTreeToggle'):withSilent(),
}

local undoTreeMap = {
    ['n|<leader>u3'] = mapCmd("UndotreeToggle"):withSilent(),
}

local cmpMap = {
    ['is|<tab>'] = mapCmd(function() return vim.api.nvim_eval("vsnip#jumpable(1) ? '<Plug>(vsnip-jump-next)' : '<tab>'") end)
        :withSilent(),
    ['is|<s-tab>'] = mapCmd(function() return vim.api.nvim_eval("vsnip#jumpable(-1) ? '<Plug>(vsnip-jump-prev)' : '<s-tab>'") end)
        :withSilent(),
}

local lspMap = {
    ['n|<leader>ca'] = mapCmd(vim.lsp.buf.code_action):withSilent(),
    ['n|<leader>cn'] = mapCmd(vim.lsp.buf.rename):withSilent(),
    ['n|<leader>cf'] = mapCmd(function() vim.lsp.buf.format({ async = true }) end):withSilent(),
    ['n|gh'] = mapCmd(vim.lsp.buf.hover):withSilent(),
    ['n|gr'] = mapCmd(function() require("telescope.builtin").lsp_references() end):withSilent(),
    ['n|gi'] = mapCmd(function() require("telescope.builtin").lsp_implementations() end):withSilent(),
    ['n|gd'] = mapCmd(function() require("telescope.builtin").lsp_definitions() end):withSilent(),
    ['n|gD'] = mapCmd(function() require("telescope.builtin").lsp_type_definitions() end):withSilent(),
    ['n|go'] = mapCmd(function()
        vim.diagnostic.goto_prev({ float = { border = options.float_border and "rounded" or "none" } })
    end):withSilent(),
    ['n|gO'] = mapCmd(function() require("telescope.builtin").diagnostics() end):withSilent(),
    ['n|<leader>u2'] = mapCR("AerialToggle! right"):withSilent(),
    ['n|[g'] = mapCmd(function()
        vim.diagnostic.goto_prev({ float = { border = options.float_border and "rounded" or "none" } })
    end):withSilent(),
    ['n|g]'] = mapCmd(function()
        vim.diagnostic.goto_next({ float = { border = options.float_border and "rounded" or "none" } })
    end):withSilent(),
}

local bufferlineMap = {
    ['n|<c-q>'] = mapCR("bdelete"):withSilent(),
    ['n|<c-h>'] = mapCR("BufferLineCyclePrev"):withSilent(),
    ['n|<c-l>'] = mapCR("BufferLineCycleNext"):withSilent(),
    ['n|<c-e>'] = mapCR("BufferLineMovePrev"):withSilent(),
    ['n|<c-y>'] = mapCR("BufferLineMoveNext"):withSilent(),
    ['n|<leader>1'] = mapCR("BufferLineGoToBuffer 1"):withSilent(),
    ['n|<leader>2'] = mapCR("BufferLineGoToBuffer 2"):withSilent(),
    ['n|<leader>3'] = mapCR("BufferLineGoToBuffer 3"):withSilent(),
    ['n|<leader>4'] = mapCR("BufferLineGoToBuffer 4"):withSilent(),
    ['n|<leader>5'] = mapCR("BufferLineGoToBuffer 5"):withSilent(),
    ['n|<leader>6'] = mapCR("BufferLineGoToBuffer 6"):withSilent(),
    ['n|<leader>7'] = mapCR("BufferLineGoToBuffer 7"):withSilent(),
    ['n|<leader>8'] = mapCR("BufferLineGoToBuffer 8"):withSilent(),
    ['n|<leader>9'] = mapCR("BufferLineGoToBuffer 9"):withSilent(),
}

local hopMap = {
    ['nv|ss'] = mapCR("HopWord"):withSilent(),
    ['nv|sl'] = mapCR("HopLine"):withSilent(),
}

local transMap = {
    ['nv|<leader>tcf'] = mapCR("Translate ZH -source=EN -output=floating"):withSilent(),
}


leaderMap()
bind.nvimLoadMapping(basicMap)
bind.nvimLoadMapping(telescopeMap)
bind.nvimLoadMapping(nvimTreeMap)
bind.nvimLoadMapping(undoTreeMap)
bind.nvimLoadMapping(lspMap)
bind.nvimLoadMapping(bufferlineMap)
bind.nvimLoadMapping(hopMap)
bind.nvimLoadMapping(transMap)
