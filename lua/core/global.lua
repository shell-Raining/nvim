local global = {}
local osName = vim.loop.os_uname().sysname

function global:loadVars()
	self.isMac = (osName =="Darwin")
	self.isLinux = (osName == "Linux")
	self.isWindows = (osName == "Windows_NT")
	self.isWSL = (vim.fn.has('wsl') == 1)
	self.vimPath = vim.fn.stdpath('config')
end

global:loadVars()

return global
