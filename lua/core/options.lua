local global = require('core.global')

local function loadOptions()
	local globalLocal = {
		-- ui
		ruler = false,
		showmode = false,
		cursorline = true,
		numberwidth = 2,
		number = true,
		relativenumber = true,
		termguicolors = true,
		errorbells = true,
		visualbell = true,
		foldmethod = 'indent',
		foldcolumn = '0',

		-- edit
		smarttab = true,
		spell = true,
		spelllang = 'en_us,cjk',
		backspace = 'indent,eol,start',
		ignorecase = true,
		smartcase = true,
		
		-- buffer
		hidden = true,
		backup = false,
		swapfile = false,

		-- setting
		encoding = 'utf-8',
		scrolloff = 21,
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
