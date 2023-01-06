local ensure_packer = function()
	local fn = vim.fn
	local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
	if fn.empty(fn.glob(install_path)) > 0 then
		fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
		vim.cmd [[packadd packer.nvim]]
		return true
	end
	return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
	-- basic
	use { 'wbthomason/packer.nvim' }
	use { "nvim-lua/plenary.nvim" }
	use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
	use { 'nvim-tree/nvim-web-devicons' }

	-- UI
	use { "catppuccin/nvim", as = "catppuccin" }
	use { 'nvim-tree/nvim-tree.lua', requires = { 'nvim-tree/nvim-web-devicons' }, }
	use { 'akinsho/bufferline.nvim', requires = 'nvim-tree/nvim-web-devicons' }
	use { 'nvim-lualine/lualine.nvim', requires = { 'kyazdani42/nvim-web-devicons', opt = true } }
	use { "lukas-reineke/indent-blankline.nvim" }
	use { "p00f/nvim-ts-rainbow" }

	-- telescope
	use { 'nvim-telescope/telescope.nvim', tag = '0.1.0', requires = { { 'nvim-lua/plenary.nvim' } } }
	use { "nvim-telescope/telescope-fzf-native.nvim", run = "make" }
	use { "folke/todo-comments.nvim" }

	-- edit enhance
	use { "windwp/nvim-ts-autotag", after = { "nvim-treesitter" } }
	use { "windwp/nvim-autopairs" }
	use { "numToStr/Comment.nvim" }
	use { "RRethy/vim-illuminate" }

	-- cmp
	use { "rafamadriz/friendly-snippets" }
	use { "hrsh7th/vim-vsnip" }
	use { "hrsh7th/nvim-cmp" }
	use { "hrsh7th/cmp-vsnip" }
	use { "hrsh7th/cmp-nvim-lsp" }
	use { "hrsh7th/cmp-buffer" }
	use { "hrsh7th/cmp-path" }
	use { "hrsh7th/cmp-cmdline" }
	use { "tzachar/cmp-tabnine" }

	-- LSP
	use { "williamboman/mason.nvim" }
	use { "williamboman/mason-lspconfig.nvim" }
	use { "SmiteshP/nvim-navic" }
	use { "neovim/nvim-lspconfig" }



	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
