vim.opt.backup = false -- don't make backups
vim.opt.backupcopy = 'no'
vim.opt.tabstop = 2 -- number of spaces for tabs
vim.opt.shiftwidth = 2 -- number of spaces for indentation
vim.opt.cursorline = true
vim.opt.expandtab = true -- convert tabs to spaces
vim.wo.number = true -- set numbers
vim.wo.relativenumber = true -- set relative numbers
vim.opt.ignorecase = true -- searching is not case sensitive
vim.opt.smartcase = true -- if pattern contains uppercase then is case sensitive
vim.wo.wrap = false -- no word wrapping
vim.opt.hidden = true
vim.opt.tabstop = 2
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99 -- start unfolded
vim.o.clipboard = "unnamedplus" -- yanking works with system clipboard
vim.opt.termguicolors = true
vim.opt.signcolumn = 'yes' -- signcolumn for marking warnings from lsp, without this one lsp error marker will move the number column on the left
vim.opt.splitbelow = true -- open horizontal splits below current window
vim.opt.splitright = true -- open vertical splits to the right of the current window

vim.opt.foldtext = 'v:lua.custom_fold_text()'
vim.opt.fillchars = { eob = "-", fold = " " }
vim.opt.viewoptions:remove("options")

-- custom folding function
function _G.custom_fold_text()
  local line = vim.fn.getline(vim.v.foldstart)
  local line_count = vim.v.foldend - vim.v.foldstart + 1
    
  --return " ⚡ " .. line .. ": " .. line_count .. " lines" .. "-----"
  return "+--" .. line .. ": " .. line_count .. " lines" .. " --+"
end

vim.diagnostic.config({virtual_text = false}) -- disable inline virtual text error for lsp
