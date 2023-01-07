-- this module contains some serial function (from other structure to string)

local M = {}

--[[
serializeTable can make a table to string
name is just a string to convenient to distinguishing name
skipNewLines configure whether use \n to split items 
depth maybe you can not set, or use 0
]] --
function M.serializeTable(val, name, skipNewLines, depth)
    skipNewLines = skipNewLines or false
    depth = depth or 0

    local tmp = string.rep(" ", depth)

    if name then tmp = tmp .. name .. " = " end

    if type(val) == "table" then
        tmp = tmp .. "{" .. (not skipNewLines and "\n" or "")

        for k, v in pairs(val) do
            tmp = tmp .. M.serializeTable(v, k, skipNewLines, depth + 1) .. "," .. (not skipNewLines and "\n" or "")
        end

        tmp = tmp .. string.rep(" ", depth) .. "}"
    elseif type(val) == "number" then
        tmp = tmp .. tostring(val)
    elseif type(val) == "string" then
        tmp = tmp .. string.format("%q", val)
    elseif type(val) == "boolean" then
        tmp = tmp .. (val and "true" or "false")
    else
        tmp = tmp .. "\"[inserializeable datatype:" .. type(val) .. "]\""
    end

    return tmp
end

return M
