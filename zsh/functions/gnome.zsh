function gnomeKeyBindingBackup {
    dconf dump '/org/gnome/desktop/wm/keybindings/' > ~/dotfiles/gnome/keybindings.dconf
    dconf dump '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/' > ~/dotfiles/gnome/custom-keybindings.dconf
}

function gnomeKeyBindingRestore {
    dconf load '/org/gnome/desktop/wm/keybindings/' < ~/dotfiles/gnome/keybindings.dconf
    dconf load '/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/' < ~/dotfiles/gnome/custom-keybindings.dconf
}

function gnomeTerminalBackup {
    dconf dump '/org/gnome/terminal/' > ~/dotfiles/gnome/gnomeTerminal.dconf
}

function gnomeTerminalRestore {
    dconf load '/org/gnome/terminal/' < ~/dotfiles/gnome/gnomeTerminal.dconf
}

function gnomeSettingBackup {
    dconf dump / > ~/dotfiles/gnome/gnomeSetting.dconf
}

function gnomeSettingRestore {
    dconf load / < ~/dotfiles/gnome/gnomeSetting.dconf
}
