local lazy = require("lazy")

lazy.setup({
  { "folke/lazy.nvim" },

  -- Fuzzy Finder (file picker, grep)
  {
    "nvim-telescope/telescope.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      local telescope = require("telescope")
      telescope.setup({
        defaults = {
          layout_strategy = "vertical",
          layout_config = { height = 0.95 },
          file_ignore_patterns = { "node_modules", ".git" },
        },
      })

      -- Keymaps for Telescope
      vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find Files" })
      vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live Grep" })
      vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Buffers" })
      vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Help" })
    end,
  },

  -- FZF.vim for instant grep using ripgrep
  {
    "junegunn/fzf.vim", -- uses system-installed fzf.exe
    config = function()
      vim.keymap.set("n", "<leader>ps", ":Rg<space>", { desc = "Project Search (rg+fzf)" })
    end,
  },

  -- Colorscheme
  { import = "color" },
})
