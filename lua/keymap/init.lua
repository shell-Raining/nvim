-- this is not a lua module, but a plugin mapping lua script

local bind = require('keymap.bind')
require('keymap.config')

local plugMap = {}

bind.nvimLoadMapping(plugMap)
