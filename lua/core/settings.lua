-- this file is not a module, but a script to set options for nvim

local global = require("core.global")

local function loadOptions()
    local globalLocal = {
        ruler = false,
        showmode = false,
        swapfile = false,
        signcolumn = "yes:1",
        --[[ signcolumn = "number", ]]
        completeopt = "menuone,noselect",
        pumheight = 10,
        updatetime = 500,
        timeoutlen = 500,
        termguicolors = true,
        cursorline = true,
        numberwidth = 2,
        number = true,
        relativenumber = true,
        scrolloff = 21,
        mouse = "a",
        list = true,
        spell = false,
        spelllang = "en_us,cjk",
        ignorecase = true,
        smartcase = true,
        filetype = "plugin",
        foldmethod = "indent",
        foldlevel = 100,
        foldcolumn = "0",
        -- clipboard = "unnamedplus",
        smartindent = true,
        iskeyword = "@,48-57,_,192-255",
        laststatus = 3,
        linebreak = true,
        fillchars = "eob: ",
        fileencodings = "ucs-bom,utf-8,gbk,big5,gb18030,latin1",
        sessionoptions = "buffers,curdir,folds,help,tabpages,winsize,globals",
    }

    local function isEmpty(s)
        return s == nil or s == ""
    end

    local condaPrefix = os.getenv("CONDA_PREFIX")
    if not isEmpty(condaPrefix) then
        vim.g.python_host_prog = condaPrefix .. "/bin/python"
        vim.g.python3_host_prog = condaPrefix .. "/bin/python"
    elseif global.isMac then
        vim.g.python_host_prog = "/usr/bin/python"
        vim.g.python3_host_prog = "/usr/local/bin/python3"
    else
        vim.g.python_host_prog = "/usr/bin/python"
        vim.g.python3_host_prog = "/usr/bin/python3"
    end

    for name, value in pairs(globalLocal) do
        vim.o[name] = value
    end
end

loadOptions()
