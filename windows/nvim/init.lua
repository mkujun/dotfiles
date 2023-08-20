
require("settings")
require('impatient')
require("plugins")
require("mappings")
require("color")
require("lualine").setup()
require('nvim-autopairs').setup({-- this is required for nvim-autopairs to work
  disable_filetype = { "TelescopePrompt" , "vim" },
})
require("lsp") -- lsp configuration
require("completion") -- nvim-cmp config
--require("formatting") -- prettier config with null ls
require("file_browser") -- file browser setup
