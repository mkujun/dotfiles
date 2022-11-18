require("plugins")
require("nvim-tree").setup()
require('nvim-web-devicons').get_icons() -- devicons requires nerd font (windows install)
require("lualine").setup()

-- TODO: put this in settings.lua
vim.opt.tabstop = 2 -- number of spaces for tabs
vim.opt.shiftwidth = 2 -- number of spaces for indentation
vim.opt.cursorline = true
vim.opt.expandtab = true -- convert tabs to spaces
vim.wo.number = true -- set numbers
vim.wo.relativenumber = true -- set relative numbers
vim.opt.ignorecase = true -- searching is not case sensitive
vim.opt.smartcase = true -- if pattern contains uppercase then is case sensitive
vim.wo.wrap = false -- no word wrapping
vim.opt.hidden = true
vim.opt.tabstop = 2
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99 -- start unfolded
vim.o.clipboard = "unnamedplus" -- yanking works with system clipboard

-- TODO: put this in mappings.lua
vim.g.mapleader = ' ' -- space is leader key
vim.keymap.set('n', '<Leader>i', '^') -- leader i jumps to the first char in line
vim.keymap.set('n', 'Y', 'Y') -- this type of line yanking behavior used to work in older vim versions
vim.keymap.set('n', '<Leader>t', ':NvimTreeToggle<CR>') -- NvimTreeToggle mapping
vim.keymap.set('n', '<Leader>n', ':noh<CR>')

-- change between splits
vim.keymap.set('n', '<S-h>', '<C-W>h') 
vim.keymap.set('n', '<S-l>', '<C-W>l')
vim.keymap.set('n', '<S-j>', '<C-W>j')
vim.keymap.set('n', '<S-k>', '<C-W>k')



---- nvim config lspconfig -------------------------------------------------------
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

local lsp_flags = {
  -- This is the default in Nvim 0.7+
  debounce_text_changes = 150,
}

-- nvim lspconfig for ts
require('lspconfig')['tsserver'].setup{
  on_attach = on_attach,
  flags = lsp_flags,
  capabilities = capabilities -- in order for nvim_lsp to work with nvim-cmp
}

-- nvim lspconfig for angular, setting path manually
local project_library_path = "C:\\Users\\Korisnik\\AppData\\Roaming\\npm\\node_modules\\@angular\\language-server\\bin"
local cmd = {"ngserver.cmd", "--stdio", "--tsProbeLocations", project_library_path , "--ngProbeLocations", project_library_path}

-- nvim lspconfig for angular
--require'lspconfig'.angularls.setup{
require('lspconfig')['angularls'].setup{
  on_attach = on_attach,
  capabilities = capabilities, -- in order for nvim_lsp to work with nvim-cmp

  flags = lsp_flags,
  cmd = cmd,
  on_new_config = function(new_config,new_root_dir)
    new_config.cmd = cmd
  end,
}
-------------------------nvim lspconfig ends ----------------------------------------------------------------------

--nvim-cmp configuration (completion engine plugin) ------------------------------------------------------------------------------------------
vim.opt.completeopt={"menu","menuone","noselect"}
  -- Setup nvim-cmp.
  local luasnip = require("luasnip")
  local cmp = require 'cmp'
  cmp.setup({
    snippet = {
      expand = function(args) -- snippet engine
         require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ['<C-b>'] = cmp.mapping.scroll_docs(-4),
      ['<C-f>'] = cmp.mapping.scroll_docs(4),
      ['<C-Space>'] = cmp.mapping.complete(),
      ['<C-e>'] = cmp.mapping.abort(),
      ['<CR>'] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.

    -- configure Tab and Shift Tab to work in "expected" way
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
    }),
    sources = cmp.config.sources({
      { name = 'nvim_lsp' },
       { name = 'luasnip' },
    }, {
      { name = 'buffer' },
    })
  })

  -- Set configuration for specific filetype.
  cmp.setup.filetype('gitcommit', {
    sources = cmp.config.sources({
      { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
    }, {
      { name = 'buffer' },
    })
  })

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities()) -- Setup lspconfig to work with nvim-cmp
------- end of nvim-cmp --------------------------------------------------------------------------------------

-- Telescope mappings
vim.keymap.set('n', '<C-p>', '<cmd>Telescope find_files<cr>')
vim.keymap.set('n', '<leader>f', '<cmd>Telescope live_grep<cr>')
vim.keymap.set('n', '<leader>b', '<cmd>Telescope buffers<cr>')

-- different bg color after line 80
vim.cmd[[
  set colorcolumn=80
  let &colorcolumn=join(range(81, 999),",")
]]

vim.opt.foldtext = 'v:lua.custom_fold_text()'
vim.opt.fillchars = { eob = "-", fold = " " }
vim.opt.viewoptions:remove("options")

function _G.custom_fold_text()
  local line = vim.fn.getline(vim.v.foldstart)
  local line_count = vim.v.foldend - vim.v.foldstart + 1
    
  --return " ⚡ " .. line .. ": " .. line_count .. " lines" .. "-----"
  return "+--" .. line .. ": " .. line_count .. " lines" .. " --+"
end

-- treesitter config
-- gcc compiler is required
-- https://www.freecodecamp.org/news/how-to-install-c-and-cpp-compiler-on-windows/

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

-- this is required for nvim-autopairs to work
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})

-- html and typescript
require('nvim-ts-autotag').setup()

vim.opt.signcolumn = 'yes' -- signcolumn for marking warnings from lsp, without this one lsp error marker will move the number column on the left

-- colorscheme
vim.g.gruvbox_material_background = 'hard'

vim.cmd[[
  colorscheme gruvbox-material
  syntax on
]]
