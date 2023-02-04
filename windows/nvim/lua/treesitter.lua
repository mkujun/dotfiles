-- treesitter config
require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true
  },
  indent = {
    enable = true,
  },
  ensure_installed = {
    "json",
    "css",
    "html",
    "lua",
    "typescript",
    "javascript"
  }
}

