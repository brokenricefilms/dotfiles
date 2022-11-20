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
npm install --global ijavascript

pip install --upgrade pylint
pip install --upgrade autopep8
pip install --upgrade pynvim

gem install neovim jekyll bundler
cargo install stylua

go install github.com/jesseduffield/lazygit@latest
go install github.com/jesseduffield/lazydocker@latest

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
. $HOME/.asdf/asdf.sh
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf plugin add rust
asdf plugin add deno
asdf install nodejs latest
asdf install rust latest
asdf install deno latest
asdf install rust-analyzer latest

curl -sLo/tmp/win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
unzip -p /tmp/win32yank.zip win32yank.exe >/tmp/win32yank.exe
chmod +x /tmp/win32yank.exe
sudo mv /tmp/win32yank.exe /usr/local/bin/

ln -sf ~/repos/thuanOwa/ok/.tinypng ~/.tinypng
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/ssh/config ~/.ssh/config
rm -rf ~/.config/nvim
mkdir ~/.config/nvim
ln -sf ~/dotfiles/init.lua ~/.config/nvim/init.lua
ln -sf ~/dotfiles/.tool-versions ~/
ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git/gh_config.yml ~/.config/gh/config.yml
ln -sf ~/dotfiles/git/lazygit_config.yml ~/.config/lazygit/config.yml
ln -sf ~/dotfiles/.selected_editor ~/.selected_editor
ln -sf ~/dotfiles/starship.toml ~/.config/
ln -sf ~/dotfiles/.ripgreprc ~/
ln -sf ~/dotfiles/bashrc ~/.bashrc

sudo ln -sf /usr/bin/fdfind /usr/bin/fd
sudo ln -sf /usr/bin/batcat /usr/bin/bat

ln -sf /mnt/c/Users/master/Downloads ~/Downloads
ln -sf /mnt/c/Users/master/Documents ~/Documents
ln -sf /mnt/c/Users/master/Pictures ~/Pictures
ln -sf /mnt/c/Users/master/Videos ~/Videos
ln -sf /mnt/c/Users/master/Music ~/Musi

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
