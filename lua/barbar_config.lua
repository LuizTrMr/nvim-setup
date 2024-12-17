require('barbar').setup({
	auto_hide = true,
})

vim.api.nvim_set_hl(0, 'BufferCurrent', {fg = '#B36FFF', bg = '#3E4452'})
vim.api.nvim_set_hl(0, 'BufferCurrentMod', {fg = '#F9CA2F', bg = '#3E4452'})

vim.api.nvim_set_keymap('n', '<TAB>', ':BufferNext<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<S-TAB>', ':BufferPrevious<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>w', ':BufferClose<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Leader>z', ':BufferRestore<CR>', { noremap = true })
