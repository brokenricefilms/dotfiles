function ser --description 'browser sync start server'
    set -l SERVER_IP (hostname -I)
    browser-sync start --server --files . --no-notify --host "$SERVER_IP" --port 9000
end
