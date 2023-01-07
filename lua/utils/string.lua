local M = {}

M.startWith = function(str, start)
    return str:sub(1, #start) == start
end

M.endWith = function(str, ending)
    return ending == "" or str:sub(- #ending) == ending
end

return M
