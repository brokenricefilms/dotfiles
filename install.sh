#!/usr/bin/env sh

yay -S --noconfirm tmux neofetch htop trash-cli python-pip tldr net-tools speedtest-cli neovim python-neovim fd cowsay fzf npm ffmpeg mpv ripgrep unrar moreutils cronie git-delta wl-clipboard rust cargo go v4l-utils ruby gcc obs-studio dconf-editor sqlite shfmt cmake kdenlive starship bat yt-dlp ddcutil foot celluloid deno yarn libgda6 xdg-desktop-portal-gnome xdg-desktop-portal qt6-wayland mpv-mpris sdl2 networkmanager kiwix-desktop easyeffects calf lsp-plugins zam-plugins-lv2 mda.lv2 noto-fonts-emoji ibus-bamboo onlyoffice-bin gnome-browser-connector googledot-cursor-theme exa fnm-bin tmux-bash-completion-git google-chrome google-chrome-beta fnm-bin tmux-bash-completion-git git-extras syncthing

curl -fsSL https://deno.land/install.sh | sh

npm config set prefix ~/.npm/

npm install --global prettier
npm install --global tinypng-cli
npm install --global browser-sync
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
rm -rf ~/.config/alacritty
ln -sf ~/dotfiles/alacritty ~/.config/

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
$HOME/.tmux/plugins/tpm/bin/install_plugins

mkdir -p ~/repos/thuanowa/
cd ~/repos/thuanowa/

gh repo clone thuanowa/ok
ln -sf ~/repos/thuanowa/ok/.fonts ~/.fonts
cd ~/.fonts
fc-cache -rf

cd ~/repos/thuanowa/
gh repo clone thuanowa/obs-studio
ln -sf ~/repos/thuanowa/obs-studio/ ~/.config/

cd ~/repos/thuanowa/garden
gh repo clone thuanowa/obs-studio

systemctl --user enable syncthing.service
systemctl --user start syncthing.service
