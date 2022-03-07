Invoke-Expression (New-Object System.Net.WebClient).DownloadString('https://get.scoop.sh')

scoop bucket add extras

scoop install fd
scoop install git
scoop install fzf
scoop install starship
scoop install neovim
scoop install sudo

sudo New-Item -ItemType SymbolicLink -Path "C:\Users\master\.gitconfig" -Target "C:\Users\master\dotfiles\git\gitconfig" -Force
sudo New-Item -ItemType SymbolicLink -Path "C:\Users\master\.ssh\config" -Target "C:\Users\master\dotfiles\ssh\config" -Force
sudo New-Item -ItemType SymbolicLink -Path "C:\Users\master\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Target "C:\Users\master\dotfiles\windows_terminal_config.json" -Force

sudo New-Item -ItemType SymbolicLink -Path "C:\Users\master\AppData\Local\Microsoft\PowerToys\settings.json" -Target "C:\Users\master\dotfiles\PowerToys\settings.json" -Force
sudo New-Item -ItemType SymbolicLink -Path "C:\Users\master\AppData\Local\Microsoft\PowerToys\Keyboard Manager\settings.json" -Target "C:\Users\master\dotfiles\PowerToys\Keyboard Manager\settings.json" -Force
sudo New-Item -ItemType SymbolicLink -Path "C:\Users\master\AppData\Local\Microsoft\PowerToys\Keyboard Manager\default.json" -Target "C:\Users\master\dotfiles\PowerToys\Keyboard Manager\default.json" -Force

sudo New-Item -ItemType SymbolicLink -Path "C:\Users\master\AppData\Roaming\TouchCursor\settings.cfg" -Target "C:\Users\master\dotfiles\TouchCursor\settings.cfg" -Force
sudo New-Item -ItemType SymbolicLink -Path "C:\Users\master\AppData\Roaming\TouchCursor\pre-1.7.1-settings.cfg" -Target "C:\Users\master\dotfiles\TouchCursor\pre-1.7.1-settings.cfg" -Force


sudo New-Item -ItemType SymbolicLink -Path  "C:\Program Files (x86)\Common Files\Oracle\Java\javapath_target_1828171\bin\" -Target "C:\Program Files\Java\jdk1.8.0_321\bin\" -Force
