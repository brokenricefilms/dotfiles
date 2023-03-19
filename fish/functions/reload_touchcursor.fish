function reload_touchcursor
    cp ~/dotfiles/touchcursor.conf ~/.config/touchcursor/
    systemctl --user restart touchcursor.service
end
