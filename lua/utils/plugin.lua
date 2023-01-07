local optionsM = require('core.options')
local pathUtil = require('utils.path')
local stringUtil = require('utils.string')
local logM = require('log.log')

local endWith = stringUtil.endWith
local logTable = logM.logTable



local M = {}

M.loadCwdPlug = function(path)
    -- because we do not search util path but caller function location, so use stack level 3
    local pwd = pathUtil.getPwd(3)
    local notLoadPlug = {}

    -- not load configured plugin
    for _, v in pairs(optionsM.unloadPlugins) do
        notLoadPlug[v] = true
    end

    -- load plugin in configured path
    local cwdFileList = vim.fn.readdir(pwd)
    logM.log(pwd)
    logTable(cwdFileList)
    for _, fname in pairs(cwdFileList) do
        if not endWith(fname, ".lua") then goto continue end
        local pluginName = fname:sub(1, #fname - #'.lua')

        if notLoadPlug[pluginName] then goto continue end
        local file = path .. '.' .. pluginName
        require(file)

        ::continue::
    end
end

return M
