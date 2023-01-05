local logM = require('log.log')
local pathUtil = require('utils.path')

local pwd = pathUtil.getPwd()
local pluginList = vim.split(vim.fn.globpath(pwd, '*.lua'), '\n')

starts_with = function(str, start)
  return str:sub(1, #start) == start
end

ends_with = function(str, ending)
  return ending == "" or str:sub(- #ending) == ending
end

setup = function()
	local unload_plugins = {
		"init"
	}

	local helper_set = {}
	for _, v in pairs(unload_plugins) do
		helper_set[v] = true
	end
	for _, fname in pairs(vim.fn.readdir(pwd)) do
		if ends_with(fname, ".lua") then
			local cut_suffix_fname = fname:sub(1, #fname - #'.lua')
			if helper_set[cut_suffix_fname] == nil then
				local file = "plugins.UI." .. cut_suffix_fname
				require(file)
			end
		end
	end
end

setup()
