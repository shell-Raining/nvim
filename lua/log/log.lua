-- this is a lua module that used to print log
local glob = require('core.global')
local vimPath = glob.vimPath
local pathSeq = glob.pathSeq

local M = {}

local logInfoPath = vimPath .. pathSeq .. 'log'

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

-- write log info into default dir and file ( tag with date )
function M.log(info)
	local filename = os.date("%Y%m%d.log")
	local path = logInfoPath .. pathSeq .. 'default' .. pathSeq .. filename
	M.writeLog(path, info)
end

return M
