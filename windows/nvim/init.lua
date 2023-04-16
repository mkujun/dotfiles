require('impatient')
require("plugins")
require("settings")
require("mappings")
require("color")
require("lualine").setup()
require('nvim-autopairs').setup({-- this is required for nvim-autopairs to work
  disable_filetype = { "TelescopePrompt" , "vim" },
})
require("lsp") -- lsp configuration
require("completion") -- nvim-cmp config
require("formatting")
