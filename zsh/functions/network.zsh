if hash emoji-fzf 2>/dev/null; then
  sudo dnf install ufw -y
  alias firewallStatus='sudo ufw status'
else
  alias firewallStatus='sudo ufw status'
fi
