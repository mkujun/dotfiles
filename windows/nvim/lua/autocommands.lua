local cmd = vim.cmd

cmd[[
autocmd BufWritePre *.ts Neoformat
]]
