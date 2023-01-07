-- this is a lua module that used to print log
local glob = require('core.global')
local serial = require('utils.serial')
local vimPath = glob.vimPath
local pathSeq = glob.pathSeq

local M = {}

local logInfoDir = vimPath .. pathSeq .. 'log'

function M.writeLog(path, info)
    local fd = io.open(path, 'a')
    if not fd then
        print(string.format('fd %s not opened because not have this dir', path))
        return
    end

    fd:write(os.date("%Y-%m-%d %H:%M:%S ", os.time()))
    if not info then
        fd:write('nil info, please check\n')
        return
    end
    fd:write(info .. '\n')
    fd:close()
end

--[[
write log info into default dir and file ( tag with date )
note: you need add \n manually
]] --
function M.log(info)
    local filename = os.date("%Y%m%d.log")
    local defaultPath = logInfoDir .. pathSeq .. 'default' .. pathSeq .. filename
    M.writeLog(defaultPath, info)
end

--[[ 
logTable can write a table info into log
name is just a string to convenient to distinguishing name
skipNewLine is a boolean value to configure whether use \n to split items 
note: logTable will add \n automatically
]] --
function M.logTable(table, name, skipNewLine)
    local info = serial.serializeTable(table, name, skipNewLine)
    M.log(info)
end

return M
