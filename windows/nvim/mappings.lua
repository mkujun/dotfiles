vim.g.mapleader = ' ' -- space is leader key
vim.keymap.set('n', '<Leader>i', '^') -- leader i jumps to the first char in line
vim.keymap.set('n', 'Y', 'Y') -- this type of line yanking behavior used to work in older vim versions
vim.keymap.set('n', '<Leader>t', ':NvimTreeToggle<CR>') -- NvimTreeToggle mapping
vim.keymap.set('n', '<Leader>n', ':noh<CR>')

-- change between splits
vim.keymap.set('n', '<S-h>', '<C-W>h') 
vim.keymap.set('n', '<S-l>', '<C-W>l')
vim.keymap.set('n', '<S-j>', '<C-W>j')
vim.keymap.set('n', '<S-k>', '<C-W>k')
