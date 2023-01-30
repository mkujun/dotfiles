-- colorscheme
require("github-theme").setup({
  theme_style = "dark_default",
})

-- different bg color after column 80
vim.cmd[[
  set colorcolumn=80
  let &colorcolumn=join(range(81, 999),",")
  highlight colorcolumn ctermbg=235 guibg=#161b22
]]
