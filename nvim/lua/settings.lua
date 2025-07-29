vim.opt.backup = false -- don't make backups
vim.opt.backupcopy = 'no'
vim.opt.swapfile = false
vim.opt.tabstop = 2 -- number of spaces for tabs
vim.g.markdown_recommended_style = 0 -- neovim decided to indent markdown files with 4 stops
vim.opt.shiftwidth = 2 -- number of spaces for indentation
vim.opt.cursorline = true
vim.opt.expandtab = true -- convert tabs to spaces
vim.wo.number = true -- set numbers
vim.wo.relativenumber = true -- set relative numbers
vim.opt.ignorecase = true -- searching is not case sensitive
vim.opt.smartcase = true -- if pattern contains uppercase then is case sensitive
vim.wo.wrap = false -- no word wrapping
vim.opt.hidden = true
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
vim.opt.colorcolumn = "80"

-- custom folding function
function _G.custom_fold_text()
  local line = vim.fn.getline(vim.v.foldstart)
  local line_count = vim.v.foldend - vim.v.foldstart + 1
    
  --return " ⚡ " .. line .. ": " .. line_count .. " lines" .. "-----"
  return "+--" .. line .. ": " .. line_count .. " lines" .. " --+"
end

-- highlight yanked text using the "Visual" highlight group
vim.cmd[[
autocmd TextYankPost * silent! lua vim.highlight.on_yank {higroup=(vim.fn['hlexists']('HighlightedyankRegion') > 0 and 'HighlightedyankRegion' or 'IncSearch'), timeout=300}
]]

-- Disable unused providers
vim.g.loaded_python_provider = 0
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_node_provider = 0


-- Faster scrolling
vim.opt.lazyredraw = true
vim.opt.ttyfast = true

-- Disable syntax if opening huge files
vim.api.nvim_create_autocmd("BufReadPre", {
  pattern = "*",
  callback = function()
    if vim.fn.getfsize(vim.fn.expand("%")) > 500 * 1024 then -- 500 KB
      vim.cmd("syntax off")
    end
  end,
})