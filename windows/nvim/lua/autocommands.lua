local cmd = vim.cmd

cmd[[
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
]]
