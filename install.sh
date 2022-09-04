#! /usr/bin/env sh

sudo apt install apt-transport-https curl gnupg -y

wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg
echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list

sudo apt update

sudo apt install zsh tmux curl wget git neofetch htop trash-cli openssh-client openssh-server ipython3 python3-pip tldr net-tools speedtest-cli neovim fd-find aria2 tree cowsay fzf clangd golang ripgrep zsh ibus-bamboo unrar moreutils exa universal-ctags lua5.4 node-typescript bashtop tig bat python3-venv shfmt unzip cargo gem ruby-full build-essential zlib1g-dev lua-rocks php adb dart -y

curl https://bun.sh/install | bash

[ -s "/home/master/.bun/_bun" ] && source "/home/master/.bun/_bun"
export BUN_INSTALL="/home/master/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

bun install --global prettier
bun install --global tinypng-cli
bun install --global browser-sync
bun install --global yarn
bun install --global neovim
bun install --global typescript
bun install --global mathjs
bun install --global bash-language-server

curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.38.0/install.sh | bash

pip install --upgrade pylint
pip install --upgrade autopep8
pip install --upgrade pynvim

gem install neovim jekyll bundler
cargo install stylua

# nvim setup
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

npm config set prefix ~/.npm/

curl -fsSL https://starship.rs/install.sh | bash

ssh-keygen

cat ~/.ssh/id_rsa.pub | clip.exe

sleep 1000

cd ~/
git clone git@github.com:thuanpham2311/dotfiles.git

mkdir ~/sync/
cd ~/sync/
git clone git@github.com:thuanpham2311/ok.git
cd

ln -sf ~/dotfiles/bin/ ~/
ln -sf ~/sync/ok/.tinypng ~/.tinypng
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/ssh/config ~/.ssh/config/
ln -sf ~/dotfiles/nvim ~/.config/
ln -sf ~/dotfiles/bat/ ~/.config/
ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git/gh_config.yml ~/.config/gh/config.yml
ln -sf ~/dotfiles/git/lazygit_config.yml ~/.config/lazygit/config.yml
ln -sf ~/dotfiles/.selected_editor ~/.selected_editor
ln -sf ~/dotfiles/starship.toml ~/.config/
ln -sf ~/dotfiles/.ripgreprc ~/
ln -sf ~/dotfiles/htop/htoprc ~/.config/htop/
