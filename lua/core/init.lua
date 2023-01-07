-- this is not a lua module, but a init script, about core function about plugin, options, mapping and so on

local loadCore = function()
    require('core.settings')
    require('core.options')
    require('core.mapping')
    require('core.autocmd')
    require('core.plugin')

    require('plugins')
end

loadCore()
