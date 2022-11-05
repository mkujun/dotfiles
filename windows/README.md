## create symbolic link from my dotfiles directory to appropriate destination

// powershell command 

New-Item -Path C:\Users\Korisnik\AppData\Local\nvim\init.lua -ItemType SymbolicLink -Value C:\Users\Korisnik\dotfiles\windows\neovim\init.lua

// console output looks like this

Mode                 LastWriteTime         Length Name
----                 -------------         ------ ----
la---          5.11.2022.    15:34              0 init.lua -> C:\Users\Korisnik\dotfiles\windows\neovim\init.lua
