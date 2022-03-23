function updateDns() {
  sudo curl https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts --output /etc/hosts
  echo "sometimes if you not lazy try to clear host cache: chrome://net-internals/#dns"
  sudo systemctl restart NetworkManager.service
}

function updateDnsNoMessage() {
  sudo curl https://raw.githubusercontent.com/StevenBlack/hosts/master/alternates/fakenews-gambling/hosts --output /etc/hosts
  echo "sometimes if you not lazy try to clear host cache: chrome://net-internals/#dns"
  sudo systemctl restart NetworkManager.service
}

