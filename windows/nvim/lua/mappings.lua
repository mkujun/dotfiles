vim.g.mapleader = ' ' -- space is leader key
vim.keymap.set('n', '<Leader>i', '^') -- leader i jumps to the first char in line
vim.keymap.set('n', 'Y', 'Y') -- this type of line yanking behavior used to work in older vim versions
vim.keymap.set('n', '<Leader>t', ':NvimTreeToggle<CR>') -- NvimTreeToggle mapping
vim.keymap.set('n', '<Leader>n', ':noh<CR>')

-- change between splits
vim.keymap.set('n', '<C-h>', '<C-W>h') 
vim.keymap.set('n', '<C-l>', '<C-W>l')
vim.keymap.set('n', '<C-j>', '<C-W>j')
vim.keymap.set('n', '<C-k>', '<C-W>k')

-- saving
vim.keymap.set('n', '<leader>s', ':w<CR>')

-- Telescope mappings -- todo: this could go into separate fuzzyFinder.lua or Telescope.lua file
vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<C-f>', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<cr>')

-- floating window error diagnostic
vim.keymap.set('n', '<Leader>e', 'vim.diagnostic.open_float()<CR>')

vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser",
  { noremap = true }
)

-- open file_browser with the path of the current buffer
vim.api.nvim_set_keymap(
  "n",
  "<space>fb",
  ":Telescope file_browser path=%:p:h select_buffer=true",
  { noremap = true }
)
