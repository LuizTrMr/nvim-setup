vim.api.nvim_set_keymap('i', 'uu', '<ESC>', { noremap = true }) --inoremap uu <ESC>

vim.api.nvim_set_keymap('n', '<TAB>', ':bnext<CR>', { noremap = true }) -- TAB in normal mode will move to next buffer
vim.api.nvim_set_keymap('n', '<S-TAB>', ':bprevious<CR>', { noremap = true }) -- SHIFT-TAB will go back

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

-- Lexplore
vim.api.nvim_set_keymap('n', '<Leader>e', ':Lexplore<CR>', { noremap = true, silent = true })

-- <TAB> Completion

-- The function is called `t` for `termcodes`.
local function t(str)
    -- Adjust boolean arguments as needed
    return vim.api.nvim_replace_termcodes(str, true, true, true)
end

function _G.smart_tab()
    return vim.fn.pumvisible() == 1 and t('<C-N>') or t('<Tab>')
end
vim.api.nvim_set_keymap('i', '<Tab>', 'v:lua.smart_tab()', {expr = true, noremap = true})
