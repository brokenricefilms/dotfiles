#! /usr/bin/env sh

sudo apt update -y

sudo apt install curl -y

curl -sS https://starship.rs/install.sh | sh

sudo apt install apt-transport-https tmux curl wget git neofetch htop mpv trash-cli ipython3 python3-pip tldr net-tools speedtest-cli neovim fd-find aria2 tree cowsay fzf clangd golang ripgrep unrar moreutils exa universal-ctags lua5.4 node-typescript bat python3-venv shfmt unzip cargo gem ruby-full build-essential zlib1g-dev php adb npm libsqlite3-dev git-extras -y

curl -fsSL https://deno.land/install.sh | sh

npm config set prefix ~/.npm/

npm install --global prettier
npm install --global tinypng-cli
npm install --global browser-sync
npm install --global yarn
npm install --global neovim
npm install --global typescript

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

pip install --upgrade pylint
pip install --upgrade autopep8
pip install --upgrade pynvim

gem install neovim jekyll bundler
cargo install stylua

go install github.com/jesseduffield/lazygit@latest
go install github.com/jesseduffield/lazydocker@latest

# nvim setup
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

sudo apt remove xclip -y
curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe >/tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/

npm config set prefix ~/.npm/

cd ~/
git clone git@github.com:thuanOwa/dotfiles.git

mkdir ~/sync/
cd ~/sync/
git clone git@github.com:thuanOwa/ok.git
git clone git@github.com:thuanOwa/obs-studio.git

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -sf ~/sync/ok/.fonts ~/.fonts
cd ~/dotfiles/.fonts
fc-cache -v

ln -sf ~/repos/thuanOwa/ok/.tinypng ~/.tinypng
ln -sf ~/dotfiles/bash/bashrc ~/.bashrc
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/ssh/config ~/.ssh/config
ln -sf ~/dotfiles/nvim ~/.config/
ln -sf ~/dotfiles/bat/ ~/.config/
ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git/gh_config.yml ~/.config/gh/config.yml
ln -sf ~/dotfiles/git/lazygit_config.yml ~/.config/lazygit/config.yml
ln -sf ~/dotfiles/.selected_editor ~/.selected_editor
ln -sf ~/dotfiles/starship.toml ~/.config/
ln -sf ~/dotfiles/.ripgreprc ~/

# wsl sync folder home with windows, user in windows is {thuan}
ln -sf /mnt/c/Users/thuan/Downloads ~/Downloads
ln -sf /mnt/c/Users/thuan/OneDrive/Documents ~/Documents
ln -sf /mnt/c/Users/thuan/Music ~/Music
ln -sf /mnt/c/Users/thuan/Videos ~/Videos
ln -sf /mnt/c/Users/thuan/OneDrive/Pictures ~/Pictures

mkdir ~/repos/
cd ~/repos/

gh repo list thuanOwa --limit 1000 | while read -r repo _; do
  gh repo clone "$repo" "$repo"
done

cd ~/repos/

gh repo list ongdev --limit 1000 | while read -r repo _; do
  gh repo clone "$repo" "$repo"
done

cd ~/repos/

gh repo list isekaiSystem --limit 1000 | while read -r repo _; do
  gh repo clone "$repo" "$repo"
done
