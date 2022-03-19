alias ins='sudo pacman -S --noconfirm'
alias inss='pacman -Ss'
alias ya='yay --noconfirm'
alias uins='sudo pacman -Rs --noconfirm'

function switchToJava8() {
  sudo archlinux-java set java-8-openjdk
  archlinux-java status
}

function switchToJava11() {
  sudo archlinux-java set java-8-openjdk
  archlinux-java status
}

function switchToJava17() {
  sudo archlinux-java set java-17-openjdk
  archlinux-java status
}
