return require('packer').startup(function()
  use 'wbthomason/packer.nvim'
  use ({ 'projekt0n/github-nvim-theme', tag = 'v0.0.7' })
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP
  --use 'justinmk/vim-dirvish'
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use { "EdenEast/nightfox.nvim", tag = "v1.0.0" }
  use { "sainnhe/gruvbox-material" }
  use { "sainnhe/everforest" }
  use {
  'nvim-telescope/telescope.nvim', tag = '0.1.4',
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

  use {
	"windwp/nvim-autopairs",
    config = function() require("nvim-autopairs").setup {} end
  }

  use {"dstein64/vim-startuptime"}
  use 'lewis6991/impatient.nvim'

  -- packer
  use {
      "nvim-telescope/telescope-file-browser.nvim",
      requires = { "nvim-telescope/telescope.nvim", "nvim-lua/plenary.nvim" }
  }

  use 'sbdchd/neoformat'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional
    },
  }

end
)
