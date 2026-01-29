vim.api.nvim_set_keymap('i', 'ii', '<ESC>', { noremap = true }) --inoremap uu <ESC>

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
--vim.api.nvim_set_keymap('n', '<Space>p', '"0p', { noremap = true }) --nnoremap <Space>p "0p

-- Paste in visual mode without losing copied string
vim.api.nvim_set_keymap('v', '<Space>p', "\"_dP", { noremap = true })

-- Jump to previous cursor position
vim.api.nvim_set_keymap('n', '<Space>u', '<C-O>', { noremap = true }) --nnoremap <Space>u <C-O>
vim.api.nvim_set_keymap('v', '<Space>u', '<C-O>', { noremap = true }) --vnoremap <Space>u <C-O>

-- Better tabbing
vim.api.nvim_set_keymap('v', '<', '<gv', { noremap = true }) --vnoremap < <gv
vim.api.nvim_set_keymap('v', '>', '>gv', { noremap = true }) --vnoremap > >gv

-- Switch between opened on screen buffers
vim.api.nvim_set_keymap('n', '<Space>j', '<C-w>w', { noremap = true })
vim.api.nvim_set_keymap("n", "<Space><S-j>",  '<C-w><S-w>', { noremap = true })

-- Paste from insert mode
vim.api.nvim_set_keymap('i', '<Leader>p', '<Esc>pa', { noremap = true })


-- Move lines up and down
vim.api.nvim_set_keymap('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true })
vim.api.nvim_set_keymap('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true })

-- Go half page up and down and centralize
vim.api.nvim_set_keymap('n', '<C-u>', "<C-u>zz", { noremap = true })
vim.api.nvim_set_keymap('n', '<C-d>', "<C-d>zz", { noremap = true })

-- Copy to clipboard
vim.api.nvim_set_keymap('n', 'c<Space>', "\"+y", { noremap = true, silent = true })
vim.api.nvim_set_keymap('v', 'c<Space>', "\"+y", { noremap = true, silent = true })

vim.keymap.set('v', '<Space>e', function()
	vim.cmd('normal! y')
	local text = vim.fn.getreg('"')
	local chunk, err = load("return " .. text)
	if chunk then
		local ok, result = pcall(chunk)
		if ok then
			vim.notify(tostring(result), vim.log.levels.INFO)
		end
	else
		vim.notify("Error", vim.log.levels.INFO)
	end
end, { noremap = true })
