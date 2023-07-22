## About

- For me, Dotfiles are personal, but you can find some tips, tricks, and functions I used in this repo.
  i Watch my live-stream playlist [here](https://www.youtube.com/playlist?list=PLcazFfFZIFPld0UvU7OxYl6ayyBJ6MvY7) for a demo.

## Current setup

- Fedora 38
- [Kitty terminal](./kitty/)
- [Tmux](./tmux/tmux.conf): i 🫰 sessions. [tmux fzf session switch](https://github.com/thuanowa/tmux-fzf-session-switch)
- [bash](./bash/): fzf tab my friend.
- [Neovim](./nvim/): when VSCode f##ked up i use Neovim.
- [VSCode](./profile.code-profile): when Neovim f##ked up i use VSCode.

## Dev

- Run `pnpm install` to use pre-commit (format stuff)

## todo

- bash, shell related: make natural language command todo something

e.g:

```bash
function copyFilePath() {
  readlink -f $1 | wl-copy
}
```

