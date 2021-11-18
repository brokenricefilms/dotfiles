# My dot files

**↓↓Table of Contents↓↓**

- [My dot files](#my-dot-files)
  - [About](#about)
  - [Install](#install)
  - [Supported](#supported)
    - [My daily combo](#my-daily-combo)
    - [Distro Supported](#distro-supported)
  - [Requirements](#requirements)
  - [Demo](#demo)
  - [Feature](#feature)
  - [Contributing workflow](#contributing-workflow)

---

## About

- The project started before college and is still actively developing today.
- Design my Linux distro for everyday use and programming environments, optimized for productivity and simplicity.

## Install

- [Here is my script](https://github.com/thuanpham2311/linux_setup) to install Linux distro, but it's not good shell script (like copy 1 time pasted to terminal).

## Supported

### My daily combo

> For my daily use, i development this dotfiles repos on this, for several month maybe i will change my daily combo (Linux distro hopping)

- Ubuntu 21.10
- Gnome 40.5
- Neovim nightly
- Kitty terminal 0.23.1

### Distro Supported

- Ubuntu (latest version)
- Fedora (\*)
- Arch (\*)

> (\*): required edit un comment stuff in zsh config file

## Requirements

- Neovim ≥ 0.5
- [vim plug](https://github.com/junegunn/vim-plug)
- [Tmux plugin manager](https://github.com/tmux-plugins/tpm)

## Demo

**You can watch my Talk show Oct 15, 2021: my setup for coding, daily use**

⇒ <https://youtu.be/2OhzSP1uGLc>

<img src="./img/dotfiles.gif" width="50%" height="50%"><img src="./img/light.gif" width="50%" height="50%">

---

## Feature

- zsh
  - Fzf, moving fast.
    - In cli press `f` edit file with nvim
    - In cli press `c` cd to dir, clear screen and fancy ls
  - Auto switch (dark | light) theme
    - Using `dark | light` in command line
    - Change nvim & kitty & batcat theme
- Tmux:
  - Auto save, continuum session
  - Switch session quickly with fzf
- Vim:
  - Zet note support using vim, [see function](https://github.com/thuanpham2311/dotfiles/blob/master/nvim/after/plugin/zet.vim)
    - My notes <https://github.com/thuanpham2311/garden>
    - [My note-taking setup](https://github.com/thuanpham2311/garden/blob/main/publish/20211017203814.md)
  - Vim keymap everywhere
    - I use [touchcursor](https://github.com/donniebreve/touchcursor-linux) for config my keyboard, older is use xmodmap but i have some issue with this then i switch to touchcursor and this work well
    - My touchcursor config [here](https://github.com/thuanpham2311/dotfiles/blob/master/touchcursor/touchcursor.conf)
  - [Using vim keymap everywhere use hold space with touchcursor](https://github.com/thuanpham2311/touchcursor-vim)
    - My touchcursor nightly config [here](https://github.com/thuanpham2311/dotfiles/blob/master/touchcursor/touchcursor.conf)

## Contributing workflow

Here’s how we suggest you go about proposing a change to this project:

1. [Fork this project][fork] to your account.
2. [Create a branch][branch] for the change you intend to make.
3. Make your changes to your fork.
4. [Send a pull request][pr] from your fork’s branch to our `master` branch.

[fork]: https://help.github.com/articles/fork-a-repo/
[branch]: https://help.github.com/articles/creating-and-deleting-branches-within-your-repository
[pr]: https://help.github.com/articles/using-pull-requests/
