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

plugins = {
	-- Color Themes
	'EdenEast/nightfox.nvim',
	'morhetz/gruvbox',
	-- { 'rose-pine/neovim', name = 'rose-pine' },
	'folke/tokyonight.nvim',

	'tpope/vim-commentary', -- Comment multiple lines with gcc in visual mode

	{'fatih/vim-go', build = ':GoUpdateBinaries'},

	-- Shows bottom status bar
	{ 'nvim-lualine/lualine.nvim', dependencies = { 'nvim-tree/nvim-web-devicons' } },

	{'neoclide/coc.nvim', branch = 'release', build = 'yarn install --frozen-lockfile'}, -- Conquer of Completion

	-- Syntax Highlighters
	'Tetralux/odin.vim', -- Odin syntax highlighter

	-- use { 'github/copilot.vim' }

	'jpalardy/vim-slime',

	{
		'nvim-telescope/telescope.nvim', tag = '0.1.4',
		-- or                            , branch = '0.1.x',
		dependencies = { {'nvim-lua/plenary.nvim'} }
	},

	'mbbill/undotree',

	'ziglang/zig.vim', -- Zig syntax highlighter

	'neovim/nvim-lspconfig',
	"williamboman/mason.nvim",
	"williamboman/mason-lspconfig.nvim",
	"neovim/nvim-lspconfig",
	"hrsh7th/nvim-cmp",

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
	}
}

local opts = {}

require('lazy').setup(plugins, opts)
