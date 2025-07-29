vim.g.mapleader = ' ' -- space is leader key
vim.keymap.set('n', '<Leader>i', '^') -- leader i jumps to the first char in line
vim.keymap.set('n', 'Y', 'Y') -- this type of line yanking behavior used to work in older vim versions

-- saving
vim.keymap.set('n', '<leader>s', ':w<CR>')

-- Telescope mappings -- todo: this could go into separate fuzzyFinder.lua or Telescope.lua file
vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<C-f>', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<cr>')

-- esc mapping
vim.keymap.set({'i', 'v'}, '<A-k>', '<ESC>')

-- clear highlight search
vim.keymap.set('n', '<C-l>', ':noh<CR>')

-- floating window error diagnostic
vim.keymap.set('n', '<Leader>e', 'vim.diagnostic.open_float()<CR>')
