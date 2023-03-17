function reload_touchcursor_config
    cp ~/dotfiles/touchcursor.conf ~/.config/touchcursor/
    systemctl --user restart touchcursor.service
end
