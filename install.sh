#!/usr/bin/env sh

sudo dnf remove -y gnome-connections gnome-abrt yelp totem gnome-photos gnome-characters gnome-contacts gnome-weather libreoffice-core gnome-maps gnome-tour rhythmbox gnome-calendar
sudo dnf remove -y PackageKit-command-not-found

sudo dnf install dnf-plugins-core -y
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf groupupdate core -y

sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y

# ibus bamboo
sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/home:lamlng/Fedora_38/home:lamlng.repo

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update

sudo dnf update -y

sudo dnf install -y tmux curl wget git neofetch htop gnome-tweaks trash-cli python3-pip net-tools speedtest-cli neovim python3-neovim fd-find aria2 tree cowsay fzf npm youtube-dl mpv ripgrep unrar moreutils foliate util-linux-user zsh cronie git-delta wl-clipboard java-devel git-clang-format rust cargo go gtk-v4l ruby ruby-devel gcc-c++ ibus-bamboo collectd-sensors obs-studio dconf-editor sqlite shfmt v4l-utils google-noto-emoji-color-fonts cmake glib2-static libgda libgda-sqlite bat libsqlite3x-devel yt-dlp ddcutil code celluloid fish exa composer mpv-mpris ps_mem easyeffects google-chrome-stable fastfetch parallel tealdeer foot gnome-extensions-app flameshot ImageMagick

flatpak remote-add --authenticator-install --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --noninteractive flathub org.onlyoffice.desktopeditors
flatpak install --noninteractive flathub com.belmoussaoui.Authenticator
flatpak install --noninteractive flathub com.belmoussaoui.Decoder
flatpak install --noninteractive flathub org.kiwix.desktop
flatpak install --noninteractive flathub org.kde.kdenlive

curl -fsSL https://deno.land/x/install/install.sh | sh

npm config set prefix ~/.npm/

npm install --global prettier
npm install --global tinypng-cli
npm install --global neovim
npm install --global typescript
npm install --global ijavascript
npm install --global pnpm
npm install --global five-server

pip install --upgrade pylint
pip install --upgrade autopep8
pip install --upgrade pynvim
python3 -m pip install --user libtmux==0.16.1

gem install neovim jekyll bundler
cargo install stylua

go install github.com/jesseduffield/lazygit@latest
go install github.com/jesseduffield/lazydocker@latest

ln -sf ~/repos/thuanowa/ok/.tinypng ~/.tinypng
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/ssh/config ~/.ssh/config

rm -rf ~/.config/nvim
ln -sf ~/dotfiles/nvim ~/.config/

ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git/gitignore ~/.gitignore
ln -sf ~/dotfiles/git/gh_config.yml ~/.config/gh/config.yml
rm -rf ~/.config/lazygit
mkdir ~/.config/lazygit
ln -sf ~/dotfiles/git/lazygit_config.yml ~/.config/lazygit/config.yml
ln -sf ~/dotfiles/.selected_editor ~/.selected_editor
ln -sf ~/dotfiles/.ripgreprc ~/
rm -rf ~/.config/foot
ln -sf ~/dotfiles/foot ~/.config/
ln -sf ~/dotfiles/bash/bashrc ~/.bashrc
ln -sf ~/dotfiles/fish ~/.config/
ln -sf ~/dotfiles/mouseless/ ~/.config/
ln -sf ~/dotfiles/.npmrc ~/

mkdir -p ~/repos/thuanowa/
cd ~/repos/thuanowa/

gh repo clone thuanowa/ok
ln -sf ~/repos/thuanowa/ok/.fonts ~/.fonts
cd ~/.fonts
fc-cache -rf

cd ~/repos/thuanowa/
gh repo clone thuanowa/obs-studio
ln -sf ~/repos/thuanowa/obs-studio/ ~/.config/
