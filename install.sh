#! /usr/bin/env sh

sudo dnf install dnf-plugins-core -y

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf groupupdate core -y

sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y

sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/home:lamlng/Fedora_33/home:lamlng.repo

sudo dnf copr enable sunwire/input-remapper -y
sudo dnf install python3-input-remapper -y

sudo dnf install -y tmux curl wget git neofetch htop gnome-tweaks trash-cli flameshot python3-pip tldr net-tools xclip speedtest-cli neovim python3-neovim fd-find aria2 tree cowsay fzf npm ffmpeg youtube-dl mpv tig kitty ripgrep unrar exa moreutils foliate bat util-linux-user zsh cronie git-delta wl-clipboard java-devel git-clang-format rust cargo go gtk-v4l ruby ruby-devel google-chrome-stable gcc-c++ ibus-bamboo gnome-extensions-app collectd-sensors olive obs-studio dconf-editor sqlite shfmt v4l-utils google-noto-emoji-color-fonts cmake imwheel

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

# nvim setup
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

npm config set prefix ~/.npm/

cd /tmp
wget https://github.com/xo/usql/releases/download/v0.12.13/usql-0.12.13-linux-amd64.tar.bz2
mv usql ~/.local/bin/

usql -c '\set SYNTAX_HL_STYLE github'

cd ~/
git clone git@github.com:thuanpham2311/dotfiles.git

mkdir ~/sync/
cd ~/sync/
git clone git@github.com:thuanpham2311/ok.git
git clone git@github.com:thuanpham2311/obs-studio.git

cd /tmp
wget https://github.com/ful1e5/Google_Cursor/releases/download/v1.1.3/GoogleDot-Blue.tar.gz
tar -xvf GoogleDot-Blue.tar.gz
sudo mv GoogleDot-Blue/ /usr/share/icons/

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd ~/dotfiles/zsh/functions/
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting
git clone --depth=1 https://github.com/Aloxaf/fzf-tab
git clone --depth=1 https://github.com/chitoku-k/fzf-zsh-completions

ln -sf ~/sync/ok/.fonts ~/.fonts
cd ~/dotfiles/.fonts
fc-cache -v

ln -sf ~/sync/ok/.tinypng ~/.tinypng
ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/ssh/config ~/.ssh/config
ln -sf ~/dotfiles/nvim ~/.config/
ln -sf ~/dotfiles/kitty/ ~/.config/
ln -sf ~/dotfiles/bat/ ~/.config/
ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git/gh_config.yml ~/.config/gh/config.yml
ln -sf ~/dotfiles/git/lazygit_config.yml ~/.config/lazygit/config.yml
ln -sf ~/dotfiles/.selected_editor ~/.selected_editor
ln -sf ~/dotfiles/touchcursor ~/.config/
ln -sf ~/dotfiles/starship.toml ~/.config/
ln -sf ~/dotfiles/.ripgreprc ~/
ln -sf ~/dotfiles/input-remapper/ ~/.config/
ln -sf ~/sync/obs-studio/ ~/.config/
ln -sf ~/dotfiles/.ideavimrc ~/

cd /usr/share/applications/
sudo find -type l -delete
cd -
sudo ln -sf ~/dotfiles/applications/* /usr/share/applications/

mkdir ~/repos
cd ~/repos

mkdir thuanpham2311
cd thuanpham2311

gh repo list thuanpham2311 --limit 1000 | while read -r repo _; do
  gh repo clone "$repo" "$repo"
done

cd ..
mkdir OngDev
cd OngDev

gh repo list ongdev --limit 1000 | while read -r repo _; do
  gh repo clone "$repo" "$repo"
done

cd ..
mkdir isekaiSystem
cd isekaiSystem

gh repo list isekaiSystem --limit 1000 | while read -r repo _; do
  gh repo clone "$repo" "$repo"
done
