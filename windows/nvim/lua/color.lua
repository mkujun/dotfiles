-- colorscheme

-- different bg color after column 80
vim.cmd[[
if has('termguicolors')
          set termguicolors
        endif

        " For dark version.
        set background=dark

        " Set contrast.
        " This configuration option should be placed before `colorscheme everforest`.
        " Available values: 'hard', 'medium'(default), 'soft'
        let g:everforest_background = 'hard'

        " For better performance
        let g:everforest_better_performance = 1

        colorscheme everforest


  set colorcolumn=80
  let &colorcolumn=join(range(81, 999),",")
  highlight colorcolumn ctermbg=235 guibg=#2e383c
]]
