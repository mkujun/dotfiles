require("plugins")
require("settings")
require("mappings")
require("color")
--require("nvim-tree").setup() -- todo: could be a bit slow...
require("lualine").setup()
require('nvim-autopairs').setup({-- this is required for nvim-autopairs to work
  disable_filetype = { "TelescopePrompt" , "vim" },
})
require('nvim-ts-autotag').setup() -- html and typescript
require("treesitter") -- mainly for syntax highlighting
require("lsp") -- lsp configuration
require("completion") -- nvim-cmp config
