#! /usr/bin/env sh
sudo dnf install dnf-plugins-core -y

sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf groupupdate core -y

sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y

sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/home:lamlng/Fedora_33/home:lamlng.repo

sudo dnf copr enable sunwire/input-remapper -y
sudo dnf install python3-input-remapper -y

sudo dnf copr enable atim/starship -y
sudo dnf install starship -y

sudo dnf install -y tmux curl wget git neofetch htop gnome-tweaks trash-cli python3-pip tldr net-tools speedtest-cli neovim python3-neovim fd-find aria2 tree cowsay fzf npm ffmpeg youtube-dl mpv ripgrep unrar moreutils foliate bat util-linux-user zsh cronie git-delta wl-clipboard java-devel git-clang-format rust cargo go gtk-v4l ruby ruby-devel google-chrome-stable gcc-c++ ibus-bamboo gnome-extensions-app collectd-sensors obs-studio dconf-editor sqlite shfmt v4l-utils google-noto-emoji-color-fonts cmake kdenlive starship libsqlite3-devel glib2-static libgda libgda-sqlite

flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install flathub org.onlyoffice.desktopeditors

curl -fsSL https://deno.land/install.sh | sh

npm config set prefix ~/.npm/

npm install --global prettier
npm install --global tinypng-cli
npm install --global browser-sync
npm install --global yarn
npm install --global neovim
npm install --global typescript
npm install --global mathjs
npm install --global bash-language-server

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

npm config set prefix ~/.npm/

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

ln -sf ~/sync/ok/.fonts ~/.fonts
cd ~/dotfiles/.fonts
fc-cache -v

ln -sf ~/sync/ok/.tinypng ~/.tinypng
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
ln -sf ~/dotfiles/input-remapper/ ~/.config/
ln -sf ~/sync/obs-studio/ ~/.config/

cd /usr/share/applications/
sudo find -type l -delete
cd -
sudo ln -sf ~/dotfiles/applications/* /usr/share/applications/

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
