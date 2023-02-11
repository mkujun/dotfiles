require("plugins")
require("settings")
require("mappings")
require("color")
require("lualine").setup()
require('nvim-autopairs').setup({-- this is required for nvim-autopairs to work
  disable_filetype = { "TelescopePrompt" , "vim" },
})
require('nvim-ts-autotag').setup() -- html and typescript
require("lsp") -- lsp configuration
require("completion") -- nvim-cmp config
