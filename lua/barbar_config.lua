require('barbar').setup({
	auto_hide = true,
})

vim.api.nvim_set_hl(0, 'BufferCurrent', {fg = '#B36FFF', bg = '#3E4452'})
vim.api.nvim_set_hl(0, 'BufferCurrentMod', {fg = '#F9CA2F', bg = '#3E4452'})
