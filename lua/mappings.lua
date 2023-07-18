vim.api.nvim_set_keymap('i', 'uu', '<ESC>', { noremap = true }) --inoremap uu <ESC>

-- Remap leader
vim.api.nvim_set_keymap('n', '\\', '<NOP>', { noremap = true, silent = true })
vim.g.mapleader = '\\'

vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', { noremap = true }) -- TAB in normal mode will move to next buffer
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap = true }) -- SHIFT-TAB will go back

vim.api.nvim_set_keymap('i', '<Leader><TAB>', '<Esc>:bnext<CR>', { noremap = true }) -- TAB in normal mode will move to next buffer
vim.api.nvim_set_keymap('i', '<Leader><S-TAB>', '<Esc>:bprevious<CR>', { noremap = true }) -- SHIFT-TAB will go back

-- Go to the beginning of line (first non-blank characeter)
vim.api.nvim_set_keymap('n', 'H', '^', { noremap = true }) --nnoremap H ^
vim.api.nvim_set_keymap('v', 'H', '^', { noremap = true }) --vnoremap H ^

-- Go to the end of line
vim.api.nvim_set_keymap('n', 'L', '$', { noremap = true }) --vnoremap L $
vim.api.nvim_set_keymap('v', 'L', '$', { noremap = true }) --vnoremap L $

-- Paste from non volatile yank register
vim.api.nvim_set_keymap('n', '<Space>p', '"0p', { noremap = true }) --nnoremap <Space>p "0p

-- Jump to previous cursor position
vim.api.nvim_set_keymap('n', '<Space>u', '<C-O>', { noremap = true }) --nnoremap <Space>u <C-O>
vim.api.nvim_set_keymap('v', '<Space>u', '<C-O>', { noremap = true }) --vnoremap <Space>u <C-O>

-- Better tabbing
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true }) --vnoremap < <gv
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true }) --vnoremap > >gv

-- Coc Explorer Section
vim.api.nvim_set_keymap('n', '<Space>e', ':CocCommand explorer<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>f', ':CocCommand explorer --preset floating<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<Space>j', '<C-w>w', { noremap = true }) -- Switch between opened explorer and file
vim.api.nvim_set_keymap("n", "<Space><S-j>",  '<C-w><S-w>', { noremap = true })

-- Lexplore
vim.api.nvim_set_keymap('n', '<Leader>e', ':Lexplore<CR>', { noremap = true, silent = true })

-- Paste from insert mode
vim.api.nvim_set_keymap('i', '<Leader>p', '<Esc>pa', { noremap = true })

-- Paste in visual mode without losing copied string
vim.api.nvim_set_keymap('v', '<Leader>p', "\"_dP", { noremap = true })

-- Delete in visual and normal mode withou yanking the string
vim.api.nvim_set_keymap('n', '<Leader>d', "\"_d", { noremap = true })
vim.api.nvim_set_keymap('v', '<Leader>d', "\"_d", { noremap = true })

-- <TAB> Completion
local opts = {silent = true, noremap = true, expr = true, replace_keycodes = false}
vim.keymap.set("i", "<TAB>", 'coc#pum#visible() ? coc#pum#next(1) : "<TAB>"', opts)
vim.keymap.set("i", "<CR>", 'coc#pum#visible() ? coc#pum#confirm() : "<C-g>u<CR><c-r>=coc#on_enter()<CR>"', opts)
vim.keymap.set("i", "<S-TAB>", [[coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"]], opts)

-- Move lines up and down
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true })

-- 
vim.api.nvim_set_keymap('n', '<C-u>', "<C-u>zz", { noremap = true })
vim.api.nvim_set_keymap('n', '<C-d>', "<C-d>zz", { noremap = true })
