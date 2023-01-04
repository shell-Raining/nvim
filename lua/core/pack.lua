local global = require('core.global')
local settings = require('core.settings')
local logM = require('log.log')


local fn, loop, api = vim.fn, vim.loop, vim.api
local log = logM.log
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
		local subtmp = vim.split(fn.globpath(modulesDir, '*/user/plugins.lua'), '\n')

		-- get plugins with the path "*/user/plugins.lua", and insert into tmp
		for _, v in ipairs(subtmp) do
			if v ~= "" then
				table.insert(tmp, v)
			end
		end
		for _, f in ipairs(tmp) do
			-- TODO: what is the meaning of len
			list[#list+1] = f:sub(#modulesDir - 6, -1)
		end

		return list
	end

	local pluginsFile = getPlugins()
	for _, m in ipairs(pluginsFile) do
		if m ~= '' then
			-- TODO: what is the meaning of len
			local repos = require(m:sub(0, #m-4))
			for repo, conf in pairs(repos) do
				self.repos[#self.repos + 1] = vim.tbl_extend('force', {repo}, conf)
			end
		end
	end
end

function Packer:loadPacker()
	if not packer then
		api.nvim_command('packeradd packer.nvim')
		packer = require('packer')
	end
end

