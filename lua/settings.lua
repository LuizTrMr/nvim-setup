vim.opt.hidden = true -- Required to keep multiple buffers
vim.opt.mouse = 'a' -- Enable mouse
-- vim.opt.t_Co = 256 -- Support 256 colors
vim.opt.number = true -- Show line numbers
vim.opt.relativenumber = true -- Show line numbers relative to current line
vim.opt.cursorline = true -- Enable highlighting on current line
-- "set background=dark 		" Tell vim what the background color looks like
-- vim.opt.nobackup = true -- Recommended by coc
-- vim.opt.nowritebackup = true -- Recommended by coc
vim.opt.updatetime = 300 -- Faster completion
vim.opt.ruler = true -- Show the cursor position all time
vim.opt.scrolloff = 5 -- Scroll offset
vim.opt.encoding= 'utf-8' -- UTF-8 encoding
vim.opt.path:append('**') -- Search files into subfolders / tab-completion for file-related tasks
vim.opt.wildmenu = true -- Display all matching files when tab-completion
vim.opt.textwidth = 0 -- Files other than the ones specified in ftplugins should not have wrapping

-- Default identation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4

-- Colorscheme
require('tokyonight').setup({
	style = 'storm',
	styles = {
		comments = { italic = false },
		keywords = { italic = false },
	},
})
vim.cmd('colorscheme tokyonight')
