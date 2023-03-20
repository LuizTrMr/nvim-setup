local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

return require('packer').startup(function(use)
	use {'EdenEast/nightfox.nvim'} -- Color Theme

	use {'morhetz/gruvbox'} -- Color Theme

	use {'tmhedberg/SimpylFold'} -- Auto fold for python

	use {'tpope/vim-commentary'} -- Comment multiple lines with gcc in visual mode

	use {'fatih/vim-go', run = ':GoUpdateBinaries'}

	-- Shows bottom status bar
	use {'vim-airline/vim-airline'}
	use {'vim-airline/vim-airline-themes'}

	use {'neoclide/coc.nvim', branch = 'release', run = 'yarn install --frozen-lockfile'} -- Conquer of Completion

	use { 'calviken/vim-gdscript3' } -- Gdscript syntax highlighter

	use { 'evanleck/vim-svelte', branch = 'main' } -- Svelte syntax highlighter

	-- use { 'github/copilot.vim' }

	use { 'jpalardy/vim-slime' }

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use { 'Tetralux/odin.vim' } -- Odin syntax highlighter

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
