local M = {}

--[[
Before using this method, first understand the concept of the stack layer in lua.
A stack level is a number that represents an active function at a certain moment,
that is, a function that is calling and has not yet returned. The function that 
calls the debug library is layer 1, and the function that calls this function is
layer 2

This function get the path who calling it, such as a file '~/test/main.lua' called
it, the result is '~/test/main.lua', notice this result is absolute path, ~ will 
expand into your home path

Warning: this path if longer than 60 chars, will lead to err
]] --
M.getCwd = function(stackIndex)
	-- default function arguments is 2
	stackIndex = stackIndex or 2
	return string.gsub(debug.getinfo(stackIndex).short_src, "^(.+\\)[^\\]+$", "%1")
end

--[[
this function return the parent path of the file which calling it, and please notice
in the end, it contains character '/'
]] --
M.getPwd = function(stackIndex)
	stackIndex = stackIndex or 2
	return string.match(string.sub(debug.getinfo(stackIndex).source, 2, -1), "^.*/")
end

return M
