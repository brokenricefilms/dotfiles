# My dotfiles

**↓↓Table of Contents↓↓**

- [My dotfiles](#my-dotfiles)
  - [About](#about)
  - [Feature](#feature)
    - [Zsh](#zsh)
    - [Tmux](#tmux)
    - [Vim](#vim)
      - [Thuan fly keys](#thuan-fly-keys)
      - [Writing](#writing)
        - [Note-taking](#note-taking)
        - [Spell check](#spell-check)
      - [Vim everywhere](#vim-everywhere)
      - [Fzf](#fzf)
      - [Git](#git)
      - [Emmet:](#emmet)
      - [vim stuff](#vim-stuff)
  - [Install](#install)
  - [Supported](#supported)
    - [My daily combo](#my-daily-combo)
    - [Distro Supported](#distro-supported)
  - [Requirements](#requirements)
  - [Demo](#demo)
  - [Contributing workflow](#contributing-workflow)

---

## About

- The project started before i went to uni and is still actively developing today.
- Design my Linux distro for everyday use and programming environments, optimized for productivity and simplicity.
- For me, dotfiles is very personal, but you can find some tips, tricks, functions i used in this repos (i copy a lot on the internet, if not have i created once cuz am a programmer)

## Feature

### Zsh

- Fzf, moving fast.
  - `f` find the file in current path edit file with nvim (`F` find in home)
  - `c` cd to dir in current path with fancy ls If in git dir print git status, (`C` find in home)
  - `o` open file int current path with default application with `xdg-open` (`O` find in home)
  - `ej`: find emoji and copy using fzf, wl-copy (require [emoij fzf](https://github.com/noahp/emoji-fzf), wl-copy or you can change the clipboard you using)
  - `killAllUnnameTmuxSession`/`qa`: kill all sessions does not have a name just a number session like 23,11,12,... Keep tmux session clean
- Auto switch dark\light theme
  - Using `dark` \ `light` in the command line
  - Change Nvim & Kitty & Alacritty & Bat cat theme
  - Supported [zenbones](https://github.com/mcchrish/zenbones.nvim) of light theme, [Gruvbox with Material Palette](https://github.com/sainnhe/gruvbox-material) for dark theme
- Open VPN
  - `vpnKorea`: connect to Korea
  - `vpnJapan`: connect to Japan
  - `vpnStop`: stop openvpn
- `cm`: create a `?.sh` file in `/tmp` open it in vim and press `space+r` to run. (required my [run.vim](https://github.com/thuanpham2311/dotfiles/blob/master/nvim/after/plugin/run.vim))
- `u`: unzip/rar/tar,...

### Tmux

- Autosave, continuum session
- Switch session quickly with fzf, if not have created once, [see plugin](https://github.com/thuanpham2311/tmux-fzf-session-switch)
- Select the file/link press `o` will open in the default app
- Tmux ❤️ Vim:
  - Support navigation with `Ctrl+h\j\k\l`
  - Select mode using vim keymap

### Vim

#### Thuan fly keys

> I [like Xah fly key](https://github.com/xahlee/xah-fly-keys) for Emacs so i use the similar name, less key press is the goal

- `space + w`: is `:w`, write the file
- `space + q`: is `:q`, just quit the window if file not save -> can't quit
- `Q`: is `:qa!` so much stuff on the screen you want quit (vim not write file you don't save)
- `space + o`: is `:wq`, this "okay" for me just save and close this
- `space + z`: is `Ctrl + w + o`, this 'z' = 'zoom' for me, keep current window other? -> close this (will save in buffer)
- `J`: buffer next
- `K`: buffer previous
- `H`: is `:cprevious` the previous error in the list
- `L`: is `:cNext` the next error in the list
- `M`: is `Ctrl + ^`, switch between the previous file.
- `Shift + enter` normal/insert mode: new line on bottom (require my kitty/Alacritty config, still stay in normal/insert mode)
- `Ctrl + enter` normal/insert mode: new line on top (require my kitty/Alacritty config, still stay in normal/insert mode)

#### Writing

- Table of contents
  - `TOC`: create the table of contents
  - `TOCUpdate`: update the TOC (requited have the TOC create by using `TOC` command before)
- Markdown auto format when you save the file
- Auto-create bullet point, number list
- `fw` in insert mode: fzf with directory, find the word you forget very useful for me when writing English
- Ibus: Auto switch Vietnamese → English when leaved insert mode (i disable this plugin now cuz some problem with gnome tweak key config, if you don't care about config key in gnome tweak you can uncomment this plugin in vim config file)

##### Note-taking

- Zettelkasten note-taking support using vim, [see function](https://github.com/thuanpham2311/dotfiles/blob/master/nvim/after/plugin/zet.vim)
  - My notes <https://github.com/thuanpham2311/garden>
  - [My note-taking setup](https://github.com/thuanpham2311/garden/blob/main/publish/20211017203814.md)
- Zen writing with my minimal theme by default, the better way you can use `gn` in zsh shell it will go to note dir and open vim with README.md (you can edit for your note path, what file you want to open by default)
- `[[` in insert mode: for linking the note with Ag search content in your note
- `ctrl+k` insert mode: create a link with your latest copy (required wl-copy, you also change clipboard you using)
- Select sth... in visual mode `Enter`: auto-link the new note with title = "# what you select"
  - E.g. select `Thuan Pham so cute` ⇾ [Thuan Pham so cute](yyyymmddhhmmss.md) ⇾ `# Thuan Pham so cute`

##### Spell check

- Support: Vietnamese, English
- More new slang, Lang
- Vocabulary in programming
- `space + s` in normal mode: enable (disable by default)

#### Vim everywhere

- I use [touchcursor](https://github.com/donniebreve/touchcursor-linux) for config my keyboard, older is used xmodmap but i have some issue with this then i switch to touchcursor, and this work well
  - <https://github.com/thuanpham2311/touchcursor-vim>
  - My touchcursor nightly config [here](https://github.com/thuanpham2311/dotfiles/blob/master/touchcursor/touchcursor.conf)
- Browser ❤️ vim with touchcursor, see my config file [here](https://github.com/thuanpham2311/dotfiles/blob/master/surfingkeys.js)

#### Fzf

- `;` in normal mode: open vim command with fzf completion (`space + ;` in normal mode for coc list command)
- `space + f`: find file in current path (`space + F` in home)
- `space + h`: open fzf history files
- `space + j`: open fzf with rig grep, search file content in the current path
- `space + k`: open fzf with buffer files
- `gc` in normal mode: open fzf with git commits + diff

#### Git

> I using [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) plugin

- `gs`: open git status
- `gl`: open git log in the quick-fix list
  - use can use `H`/`L` to prev/next the quick fix list
- `gp` in normal mode: git push
- `PushForce`: git push -f

#### Emmet:

- `,,` in insert mode: execute like h1`,,` to `<h1>|</h1>`
- Preview with coc.nvim

#### vim stuff

- `space+u`: open undo tree (use need to change undodir path)
- `:Dark`: switch to dark theme (changed nvim, kitty, Alacritty, bat)
- `:Light`: switch to light theme (changed nvim, kitty, Alacritty, bat)

## Install

- [Here is my script](https://github.com/thuanpham2311/linux_setup) to install the Linux distro, but it's not a good shell script (like copy 1 time pasted to terminal).

## Supported

### My daily combo

> For my daily use, i develop this dotfiles repos on this, for several months maybe i will change my daily combo (Linux distro hopping)

- Ubuntu 21.10
- Gnome 40.5 / Wayland
- Neovim nightly
- Kitty terminal 0.23.1

### Distro Supported

- Ubuntu (the latest version)
- Fedora (\*)
- Arch (\*)

> (\*): required edit uncomment stuff in zsh config file

## Requirements

- Neovim ≥ 0.5
- [vim plug](https://github.com/junegunn/vim-plug)
- [Tmux plugin manager](https://github.com/tmux-plugins/tpm)
- [Delta](https://github.com/dandavison/delta) fancy git diff

## Demo

**You can watch my Talk show on Oct 15, 2021: my setup for coding, daily use**

⇒ <https://youtu.be/2OhzSP1uGLc>

<img src="./img/dotfiles.gif" width="50%" height="50%"><img src="./img/light.gif" width="50%" height="50%">
