#! /usr/bin/env sh

sudo apt update -y

sudo apt install curl -y

curl -sS https://starship.rs/install.sh | sh

sudo apt install apt-transport-https tmux curl wget git neofetch htop mpv mpv-mpris trash-cli ipython3 python3-pip tldr net-tools speedtest-cli neovim fd-find aria2 tree cowsay fzf clangd golang ripgrep unrar moreutils exa universal-ctags lua5.4 node-typescript bat python3-venv shfmt unzip cargo gem ruby-full build-essential zlib1g-dev php adb npm libsqlite3-dev git-extras gnome-tweaks wl-clipboard input-remapper -y

# ubuntu install git delta
cd ~/Downloads
wget https://github.com/dandavison/delta/releases/download/0.14.0/git-delta_0.14.0_amd64.deb
sudo dpkg -i git-delta_0.14.0_amd64.deb
cd -

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
asdf install nodejs latest
asdf install rust latest
asdf install rust-analyzer latest

cd
gh repo clone thuanowa/dotfiles

ln -sf ~/repos/thuanowa/ok/.tinypng ~/.tinypng
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
ln -sf ~/dotfiles/input-remapper/ ~/.config/
ln -sf ~/repos/thuanowa/obs-studio/ ~/.config/

sudo ln -sf /usr/bin/fdfind /usr/bin/fd
sudo ln -sf /usr/bin/batcat /usr/bin/bat

ln -sf ~/repos/thuanowa/ok/.fonts ~/.fonts
cd ~/.fonts
fc-cache -v
cd -

ln -sf /mnt/c/Users/master/Downloads ~/Downloads
ln -sf /mnt/c/Users/master/Documents ~/Documents
ln -sf /mnt/c/Users/master/Pictures ~/Pictures
ln -sf /mnt/c/Users/master/Videos ~/Videos
ln -sf /mnt/c/Users/master/Music ~/Musi

mkdir ~/repos/
cd ~/repos/

gh repo list thuanowa --limit 1000 | while read -r repo _; do
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
