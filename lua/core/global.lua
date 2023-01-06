local global = {}
local osName = vim.loop.os_uname().sysname

function global:loadVars()
	self.isMac = (osName == "Darwin")
	self.isLinux = (osName == "Linux")
	self.isWindows = (osName == "Windows_NT")
	self.isWSL = (vim.fn.has('wsl') == 1)
	self.vimPath = vim.fn.stdpath('config')

	local pathSeq = self.isWindows and '\\' or '/'
	local home = self.isWindows and os.getenv('USERPROFILE') or os.getenv('HOME')

	self.pathSeq = pathSeq
	self.cacheDir = home .. pathSeq .. ".cache" .. pathSeq .. "nvim" .. pathSeq
	self.modulesDir = self.vimPath .. pathSeq .. "modules"
	self.home = home
	self.dataDir = string.format('%s/site/', vim.fn.stdpath('data')) -- TODO: how to use
end

global:loadVars()

return global
