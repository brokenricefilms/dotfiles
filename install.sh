scoop install fd
scoop install git
scoop install fzf
scoop install sudo

sudo New-Item -ItemType SymbolicLink -Path "C:\Users\master\.gitconfig" -Target "C:\Users\master\dotfiles\git\gitconfig" -Force
sudo New-Item -ItemType SymbolicLink -Path "C:\Users\master\.ssh\config" -Target "C:\Users\master\dotfiles\ssh\config" -Force
sudo New-Item -ItemType SymbolicLink -Path "C:\Users\master\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Target "C:\Users\master\dotfiles\windows_terminal_config.json" -Force
