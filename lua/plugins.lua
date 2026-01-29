local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

function setup_vim_commentary()
	vim.cmd([[autocmd FileType c setlocal commentstring=//\ %s]])
end

plugins = {
	'folke/tokyonight.nvim',
	'tpope/vim-commentary', -- Comment multiple lines with gcc in visual mode

	-- Shows bottom status bar
	{ 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },

	{
		'LuizTrMr/odin.vim',
		branch = 'my_branch',
	},

	{
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                            , branch = '0.1.x',
		dependencies = {
			{ 'nvim-lua/plenary.nvim' },
			{ 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
		}
	},

	'mbbill/undotree',

	{
		'alvarosevilla95/luatab.nvim',
		dependencies = { 'kyazdani42/nvim-web-devicons' }
	},

	{
		'romgrk/barbar.nvim',
		dependencies = {
			'lewis6991/gitsigns.nvim', -- OPTIONAL: for git status
			'nvim-tree/nvim-web-devicons', -- OPTIONAL: for file icons
		},
		init = function() vim.g.barbar_auto_setup = false end,
	},
	
	{
		"hrsh7th/nvim-cmp",
		dependencies = {
			"hrsh7th/cmp-buffer",
			"hrsh7th/cmp-path",
			"hrsh7th/cmp-nvim-lsp",
			"hrsh7th/cmp-nvim-lsp-signature-help",
		},
	},

	{
		"williamboman/mason.nvim",
		dependencies = {
			"williamboman/mason-lspconfig.nvim",
		}

	},

	{
		"neovim/nvim-lspconfig"
	},

	{
		'stevearc/oil.nvim',
		opts = {},
		-- Optional dependencies
		dependencies = { "nvim-tree/nvim-web-devicons" },
	},
	
	{
		"shortcuts/no-neck-pain.nvim",
		version = "*"
	},

	{
		'nvim-treesitter/nvim-treesitter',
		tag = "v0.9.3",
		build  = ':TSUpdate',
		config = function()
			require("nvim-treesitter.configs").setup({
				ensure_installed = {"odin", "rust", "lua", "c", "java"},
				highlight = {
					enable = true,
					additional_vim_regex_highlighting = true,
				},
				playground = {
					enable = true,
					updatetime = 25,
					persist_queries = false,
				}
			})
		end
	},

	{
		"tikhomirov/vim-glsl"
	},

	{
		"L3MON4D3/LuaSnip",
		version = "v2.3.0",
		dependencies = {
			'saadparwaiz1/cmp_luasnip'
		},
	},

}
function setup_vim_commentary()
	vim.cmd([[autocmd FileType c setlocal commentstring=//\ %s]])
end

local opts = {}

require('lazy').setup(plugins, opts)
setup_vim_commentary()
