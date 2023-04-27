return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use ({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  use 'justinmk/vim-dirvish'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use('jose-elias-alvarez/null-ls.nvim') -- mainly for prettier
  use { "EdenEast/nightfox.nvim", tag = "v1.0.0" }
  use { "sainnhe/gruvbox-material" }
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.0',
  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use {'nvim-lua/plenary.nvim'}

  use {"tpope/vim-fugitive"}
  use 'hrsh7th/cmp-nvim-lsp'
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'
  use 'hrsh7th/nvim-cmp'
  use 'L3MON4D3/LuaSnip'

  use {'neoclide/coc.nvim', branch = 'release'}

  --use {"tpope/vim-vinegar"}
  --use 'hrsh7th/cmp-nvim-lsp'
  --use 'hrsh7th/cmp-buffer'
  --use 'hrsh7th/cmp-path'
  --use 'hrsh7th/cmp-cmdline'
  --use 'hrsh7th/nvim-cmp'
  --use 'L3MON4D3/LuaSnip'

  use {"dstein64/vim-startuptime"}
  use 'lewis6991/impatient.nvim'

end
)
