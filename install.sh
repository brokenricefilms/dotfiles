#! /usr/bin/env sh

sudo dnf remove gnome-connections gnome-abrt yelp totem gnome-photos gnome-characters gnome-contacts gnome-weather libreoffice-core gnome-maps gnome-tour rhythmbox gnome-calendar -y

sudo dnf install dnf-plugins-core -y
sudo dnf install -y https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
sudo dnf groupupdate core -y

sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
sudo dnf groupupdate sound-and-video -y

sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/home:lamlng/Fedora_33/home:lamlng.repo

sudo dnf copr enable sunwire/input-remapper -y
sudo dnf install python3-input-remapper -y

sudo dnf copr enable atim/starship -y
sudo dnf install starship -y

sudo rpm --import https://packages.microsoft.com/keys/microsoft.asc
sudo sh -c 'echo -e "[code]\nname=Visual Studio Code\nbaseurl=https://packages.microsoft.com/yumrepos/vscode\nenabled=1\ngpgcheck=1\ngpgkey=https://packages.microsoft.com/keys/microsoft.asc" > /etc/yum.repos.d/vscode.repo'
dnf check-update

sudo dnf config-manager \
  --add-repo \
  https://download.docker.com/linux/fedora/docker-ce.repo

sudo dnf install -y tmux curl wget git neofetch htop gnome-tweaks trash-cli python3-pip tldr net-tools speedtest-cli neovim python3-neovim fd-find aria2 tree cowsay fzf npm ffmpeg youtube-dl mpv ripgrep unrar moreutils foliate util-linux-user zsh cronie git-delta wl-clipboard java-devel git-clang-format rust cargo go gtk-v4l ruby ruby-devel gcc-c++ ibus-bamboo collectd-sensors obs-studio dconf-editor sqlite shfmt v4l-utils google-noto-emoji-color-fonts cmake kdenlive starship glib2-static libgda libgda-sqlite exa bat libsqlite3x-devel yt-dlp ddcutil code docker-ce docker-ce-cli containerd.io docker-compose-plugin kitty

sudo systemctl start docker

flatpak remote-add --authenticator-install --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
flatpak install --noninteractive flathub org.onlyoffice.desktopeditors

curl -fsSL https://deno.land/install.sh | sh

npm config set prefix ~/.npm/

npm install --global prettier
npm install --global tinypng-cli
npm install --global browser-sync
npm install --global yarn
npm install --global neovim
npm install --global typescript
npm install --global ijavascript
npm install --global pnpm

pip install --upgrade pylint
pip install --upgrade autopep8
pip install --upgrade pynvim
python3 -m pip install --user libtmux==0.16.1

gem install neovim jekyll bundler
cargo install stylua

go install github.com/jesseduffield/lazygit@latest
go install github.com/jesseduffield/lazydocker@latest

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.10.2
. $HOME/.asdf/asdf.sh
asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
asdf install nodejs latest

ln -sf ~/repos/thuanowa/ok/.tinypng ~/.tinypng
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/ssh/config ~/.ssh/config

rm -rf ~/.config/nvim
mkdir ~/.config/nvim
ln -sf ~/dotfiles/init.lua ~/.config/nvim/

ln -sf ~/dotfiles/.tool-versions ~/
ln -sf ~/dotfiles/git/gitconfig ~/.gitconfig
ln -sf ~/dotfiles/git/gh_config.yml ~/.config/gh/config.yml
rm -rf ~/.config/lazygit
mkdir ~/.config/lazygit
ln -sf ~/dotfiles/git/lazygit_config.yml ~/.config/lazygit/config.yml
ln -sf ~/dotfiles/.selected_editor ~/.selected_editor
ln -sf ~/dotfiles/.ripgreprc ~/
ln -sf ~/dotfiles/bashrc ~/.bashrc
rm -rf ~/.config/input-remapper/
ln -sf ~/dotfiles/input-remapper/ ~/.config/
ln -sf ~/repos/thuanowa/obs-studio/ ~/.config/
rm -rf ~/.config/kitty
ln -sf ~/dotfiles/kitty ~/.config/
rm -rf ~/.config/foot
ln -sf ~/dotfiles/foot ~/.config/

REPOS_PATH=~/repos/
mkdir $REPOS_PATH
cd $REPOS_PATH

github_username=(
  thuanowa
  ongdev
  isekaiSystem
  from-design-to-website
  when-will-i-die
)

for i in ${github_username[*]}; do
  mkdir "$i"
  cd "$i"

  gh repo list "$i" --limit 10000 | awk '{print $1}' | while read -r repo; do
    gh repo clone "$repo"
  done

  cd $REPOS_PATH
done

ln -sf ~/repos/thuanowa/ok/.fonts ~/.fonts
cd ~/.fonts
fc-cache -rf

sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
sudo systemctl enable docker.service
sudo systemctl enable containerd.service
