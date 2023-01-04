local global = require('core.global')
local settings = require('core.settings')


local fn, loop, api = vim.fn, vim.loop, vim.api
local isMac = global.isMac
local vimPath = global.vimPath
local dataDir = global.dataDir
local modulesDir = vimPath .. '/lua/modules'

local packer = nil
local Packer = {}
Packer.__index = Packer

function Packer:loadPlugins()
	self.repos = {}

	local getPlugins = function()
		local list = {}
		local tmp = vim.split(fn.globpath(modulesDir, '*/plugins.lua'), '\n')

		return list
	end
end

