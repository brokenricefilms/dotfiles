winget install go -s winget --accept-package-agreements --accept-source-agreements
winget install onlyoffice --accept-package-agreements --accept-source-agreements
winget install powershell -s msstore --accept-package-agreements --accept-source-agreements
winget install powertoys -s msstore --accept-package-agreements --accept-source-agreements
winget install vscode --accept-package-agreements --accept-source-agreements
winget install startallback -s winget --accept-package-agreements --accept-source-agreements
winget install --id=Google.Chrome -e --accept-package-agreements --accept-source-agreements

Invoke-WebRequest https://deno.land/x/install/install.ps1 -useb | Invoke-Expression

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser
Invoke-WebRequest get.scoop.sh | Invoke-Expression

scoop install aria2
scoop config aria2-warning-enabled false

scoop install git
scoop bucket add extras
scoop bucket add main
scoop bucket add nerd-fonts
scoop bucket add nonportable

scoop bucket add github-gh https://github.com/cli/scoop-gh.git
scoop install gh gsudo openssh neovim fd ripgrep fzf starship delta python clangd cowsay rust unrar flameshot

scoop install ruby msys2
ridk install

gsudo config CacheMode auto

gh config set editor nvim

Install-Module -Name PSReadLine -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
Install-Module -Name PSFzf -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
Install-Module -Name Recycle -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck
Install-Module -Name Terminal-Icons -AllowPrerelease -Scope CurrentUser -Force -SkipPublisherCheck

sudo New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\Documents\PowerShell\Microsoft.PowerShell_profile.ps1" -Target "$env:USERPROFILE\dotfiles\powershell\Microsoft.PowerShell_profile.ps1" -Force

sudo New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.gitconfig" -Target "$env:USERPROFILE\dotfiles\git\gitconfig" -Force
sudo New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\.ssh\config" -Target "$env:USERPROFILE\dotfiles\ssh\config" -Force

sudo mkdir $env:appdata\alacritty\
sudo New-Item -ItemType SymbolicLink -Path "$env:appdata\alacritty\alacritty.yml" -Target "$env:USERPROFILE\dotfiles\alacritty.yml" -Force

sudo New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json" -Target "$env:USERPROFILE\dotfiles\windows_terminal_config.json" -Force

sudo New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\AppData\Local\nvim\init.vim" -Target "$env:USERPROFILE\dotfiles\nvim\init.vim" -Force

sudo New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\AppData\Local\Microsoft\PowerToys\settings.json" -Target "$env:USERPROFILE\dotfiles\PowerToys\settings.json" -Force
sudo New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\AppData\Local\Microsoft\PowerToys\Keyboard Manager\settings.json" -Target "$env:USERPROFILE\dotfiles\PowerToys\Keyboard Manager\settings.json" -Force
sudo New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\AppData\Local\Microsoft\PowerToys\Keyboard Manager\default.json" -Target "$env:USERPROFILE\dotfiles\PowerToys\Keyboard Manager\default.json" -Force

sudo New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\AppData\Roaming\TouchCursor\settings.cfg" -Target "$env:USERPROFILE\dotfiles\TouchCursor\settings.cfg" -Force
sudo New-Item -ItemType SymbolicLink -Path "$env:USERPROFILE\AppData\Roaming\TouchCursor\pre-1.7.1-settings.cfg" -Target "$env:USERPROFILE\dotfiles\TouchCursor\pre-1.7.1-settings.cfg" -Force

sudo New-Item -ItemType SymbolicLink -Path "$env:LOCALAPPDATA\Packages\Microsoft.DesktopAppInstaller_8wekyb3d8bbwe\LocalState\settings.json" -Target "$env:USERPROFILE\dotfiles\winget\settings.json" -Force
