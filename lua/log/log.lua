-- this is a lua module that used to print log
local glob = require('core.global')
local vimPath = glob.vimPath
local pathSeq = glob.pathSeq

local M = {}

local logInfoPath = vimPath .. pathSeq .. 'log'

function M:writeLog(path, info)
	local file = io.open(path, 'a')
	file:write(os.date("%Y-%m-%d %H-%M-%S ", os.time()))
	file:write(info .. '\n')
	file:close()
end

function M.log(info)
	local filename = os.date("%Y%m%d")
	local path = logInfoPath .. pathSeq .. 'default' .. pathSeq .. filename
	local fd = io.open(path, 'a')

	if fd then
		fd:write(os.date("%Y-%m-%d %H:%M:%S ", os.time()))
		fd:write(info .. '\n')
		fd:close()
	else
		print(string.format('fd %s not opened', path))
	end
end

return M
