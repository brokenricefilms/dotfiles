↖️ (Feeling lost? Use the GitHub TOC!)

# Thuan's Linux dotfiles

> For Windows [change the branch to windows](https://github.com/thuanpham2311/dotfiles/tree/windows)

## About

- The project started before i went to uni and is still actively developing today.
- Design my Linux distro for everyday use and programming environments, optimized for productivity and simplicity.
- For me, dotfiles is very personal, but you can find some tips, tricks, functions i used in this repos (i copy a lot on the internet, if not have i created once cuz am a programmer)

## Feature

<!-- @todo write the table format | mode | map | note | ... -->
<!-- @body @thuanpham2311 -->

### Zsh

- Fzf, moving fast.
  - `f` find the file in current path edit file with nvim (`F` find in home, +h like 'fh' will find the hidden file )
  - `c` cd to dir in current path with fancy ls If in git dir print git status, (`C` find in home, +h like 'ch' will find the hidden dir )
  - `o` open file int current path with default application with `xdg-open` (`O` find in home, +h like 'oh' will find the hidden object)
  - `ej`: find emoji and copy using fzf, wl-copy (require [emoij fzf](https://github.com/noahp/emoji-fzf), wl-copy or you can change the clipboard you using)
  - `killAllUnnameTmuxSession`/`qa`: kill all sessions does not have a name just a number session like 23,11,12,... Keep tmux session clean
- Auto switch dark\light theme
  - Using `dark` \ `light` in the command line
  - Change Nvim & Kitty & Bat cat theme
  - Supported [github theme](https://github.com/projekt0n/github-nvim-theme) by default
- `u`: unzip/rar/tar,...
- `cppProject`: create cpp multi file template

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
- `space + z`: is toggle zoom, like zoom mode in tmux
- `J`: buffer next
- `K`: buffer previous
- `H`: is `:cprevious` the previous error in the list
- `L`: is `:cNext` the next error in the list
- `space + space`: is `Ctrl + ^`, switch between the previous file.
- `Shift + up` normal/insert mode: new line on bottom
- `Shift + down` normal/insert mode: new line on top
  > i use [touchcursor linux](https://github.com/donniebreve/touchcursor-linux) to map hold space to [vim mode](https://github.com/thuanpham2311/touchcursor-vim), in this case this easy to me
- 'gJ': splitjoin split mapping
- 'gK': splitjoin join mapping

#### Writing

- Table of contents
  - `TOC`: create the table of contents
  - `TOCUpdate`: update the TOC (requited have the TOC create by using `TOC` command before)
- Markdown auto format when you save the file
- Auto-create bullet point, number list
- `fw` in insert mode: fzf with directory, find the word you forget very useful for me when writing English
- `space + r`: to review the markdown file
- `z=`: Suggesting replacing the wrong word.

##### Spell check

- Support: Vietnamese, English
- More new slang, Lang
- Vocabulary in programming
- `space + s` in normal mode: enable (disable by default)

#### Vim everywhere

- Input remapper: hold space for vim mode editing in everywhere, check my config to known how to use
- Browser ❤️ vim with touchcursor, see my config file [here](https://github.com/thuanpham2311/dotfiles/blob/master/surfingkeys.js)

#### Fzf

- `;` in normal mode: open vim command with fzf completion
- `space + f`: find file in current path (`space + F` in home)
- `space + h`: open fzf history files
- `space + j`: open fzf with rig grep, search file content in the current path
- `space + k`: open fzf with buffer files
- `gc` in normal mode: open fzf with git commits + diff

#### Git

> I using [tpope/vim-fugitive](https://github.com/tpope/vim-fugitive) plugin

- `gs`: open git status
- `gl`: open lazygit in float term
- `gp` in normal mode: git push (run background using floaterm)
- `gP` in normal mode: git push -f (run background using floaterm)

#### Emmet:

- `,,` in insert mode: execute like h1`,,` to `<h1>|</h1>`
- Preview with nvim lsp (coq_nvim)

#### vim stuff

- `space+u`: open undo tree (use need to change undodir path)
- `space + r`: run the file (with `R` for second way)
- `:Dark`: switch to dark theme (changed nvim, kitty, Alacritty, bat)
- `:Light`: switch to light theme (changed nvim, kitty, Alacritty, bat)

#### nvim lsp

- Using [coq_nvim](https://github.com/ms-jpq/coq_nvim), [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer)
- Easy install lsp, with [nvim lsp installer](https://github.com/williamboman/nvim-lsp-installer)

### Gnome

#### Extension

- Clipboard Indicator (using folk support img, maybe in the feature can be merge)
- Gnome Fuzzy App Search
- GTK Title Bar (rip off some title bar support wayland)
- Just Perfection (UI, UX in gnome)
- [go to last workspace](https://extensions.gnome.org/extension/1089/go-to-last-workspace/) "custom shortcut to `Alt + ESC`

#### Applications

- I use `.desktop` for faster search and open in gnome search just press and enter.
- I use brave for default application, recommend is chromium base but you can change whatever you want
- In nowaday we have `.new` domain name, i use this a lot
- You can see all the application is custom [in `applications/`](https://github.com/thuanpham2311/dotfiles/tree/master/applications)

## Install

- [Here is install guide, just read the README.md](https://github.com/thuanpham2311/linux_setup)

## Supported

### My daily combo

> For my daily use, i develop this dotfiles repos on this, for several months maybe i will change my daily combo (Linux distro hopping)

- Fedora 36
- Gnome 42.1 (wayland)
- Neovim v0.7
- Foot terminal
- Jetbrains mono NL

### Distro Supported

- Fedora
- Debian base
- Arch base

## Requirements

- Neovim ≥ 0.5
- [vim plug](https://github.com/junegunn/vim-plug)
- [Tmux plugin manager](https://github.com/tmux-plugins/tpm)
- [Delta](https://github.com/dandavison/delta) fancy git diff

## Demo

**You can watch my livestream playlist here**

<https://www.youtube.com/playlist?list=PLiK7Zu7FR9jXXRToBRaOxpYsPAxy06xsi>
