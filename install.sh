#! /usr/bin/env sh

# for debian base
if hash apt 2>/dev/null; then
  sudo apt install apt-transport-https curl gnupg -y

  sudo add-apt-repository ppa:bamboo-engine/ibus-bamboo
  sudo add-apt-repository ppa:apandada1/foliate

  wget -qO- https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo gpg --dearmor -o /usr/share/keyrings/dart.gpg
  echo 'deb [signed-by=/usr/share/keyrings/dart.gpg arch=amd64] https://storage.googleapis.com/download.dartlang.org/linux/debian stable main' | sudo tee /etc/apt/sources.list.d/dart_stable.list

  sudo apt update

  sudo apt install copyq zsh tmux curl wget git neofetch htop mpv gnome-tweaks trash-cli openssh-client openssh-server flameshot ipython3 python3-pip tldr net-tools xclip speedtest-cli neovim fd-find aria2 tree cowsay fzf clangd golang fonts-noto-mono ripgrep foliate zsh ibus-bamboo unrar moreutils exa universal-ctags lua5.4 node-typescript bashtop tig bat kitty python3-venv shfmt unzip cargo gem ruby-full build-essential zlib1g-dev lua-rocks php adb dart delta -y
fi

# for fedora
if hash dnf 2>/dev/null; then
  sudo dnf install dnf-plugins-core -y

  sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm
  sudo dnf groupupdate core -y

  sudo dnf groupupdate multimedia --setop="install_weak_deps=False" --exclude=PackageKit-gstreamer-plugin -y
  sudo dnf groupupdate sound-and-video -y

  sudo dnf config-manager --add-repo https://download.opensuse.org/repositories/home:lamlng/Fedora_33/home:lamlng.repo

  sudo dnf copr enable sunwire/input-remapper -y
  sudo dnf install python3-input-remapper -y

  sudo dnf install tmux curl wget git neofetch htop gnome-tweaks trash-cli flameshot python3-pip tldr net-tools xclip speedtest-cli neovim python3-neovim fd-find aria2 tree cowsay fzf npm ffmpeg youtube-dl mpv tig kitty ripgrep unrar exa moreutils foliate bat util-linux-user zsh cronie git-delta wl-clipboard java-devel git-clang-format rust cargo go gtk-v4l ruby ruby-devel google-chrome-stable gcc-c++ ibus-bamboo gnome-extensions-app collectd-sensors olive obs-studio dconf-editor sqlite shfmt v4l-utils google-noto-emoji-color-fonts -y
fi

# for arch base
if hash pacman 2>/dev/null; then
  sudo pacman-mirrors --geoip && sudo pacman -Syyu

  sudo pacman -S firefox-developer-edition tmux neofetch htop mpv trash-cli flameshot tldr net-tools xclip speedtest-cli neovim fd tree gimp cowsay ruby ripgrep kitty exa noto-fonts-emoji lua aria2 foliate tig clang nodejs youtube-dl bat python-pip git base-devel wget curl fzf dunst python-i3ipc xdg-desktop-portal xdg-desktop-portal-gnome wmctrl thefuck wl-clipboard --noconfirm

  git clone https://aur.archlinux.org/yay.git
  cd yay
  makepkg -si

  yay -S universal-ctags -noconfirm

fi

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

ssh-keygen

if [[ "$XDG_SESSION_TYPE" == "wayland" ]]; then
  alias copy='wl-copy'
else
  alias copy='xclip -sel clip'
fi

cat ~/.ssh/id_rsa.pub | copy

read -p "Press enter to continue"

cd ~/
git clone git@github.com:thuanpham2311/dotfiles.git

mkdir ~/sync/
cd ~/sync/
git clone git@github.com:thuanpham2311/ok.git
git clone git@github.com:thuanpham2311/obs-studio.git
cd

cd /tmp
wget https://github.com/ful1e5/Google_Cursor/releases/download/v1.1.3/GoogleDot-Blue.tar.gz
tar -xvf GoogleDot-Blue.tar.gz
sudo mv GoogleDot-Blue/ /usr/share/icons/
cd -

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm

cd ~/dotfiles/zsh/functions/
git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting
git clone --depth=1 https://github.com/Aloxaf/fzf-tab
git clone --depth=1 https://github.com/chitoku-k/fzf-zsh-completions
git clone --depth=1 https://github.com/sunlei/zsh-ssh
cd

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
ln -sf ~/dotfiles/onlyoffice/ ~/.config/
ln -sf ~/dotfiles/.ripgreprc ~/
ln -sf ~/dotfiles/input-remapper/ ~/.config/
ln -sf ~/dotfiles/mimeapps.list ~/.config/mimeapps.list
ln -sf ~/dotfiles/htop/htoprc ~/.config/htop/
ln -sf ~/sync/obs-studio/ ~/.config/
ln -sf ~/dotfiles/foot ~/.config/
ln -sf ~/sync/ok/ibus-bamboo.macro.text ~/.config/ibus-bamboo/

mkdir ~/repos/
cd ~/repos/
git clone git@github.com:thuanpham2311/viet_eng_words_vim_dict
cd -

sudo ln -sf ~/repos/thuanpham2311/viet_eng_words_vim_dict/words /usr/share/dict/words
