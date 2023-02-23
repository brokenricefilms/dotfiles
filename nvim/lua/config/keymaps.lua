-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("", "<S-Right>", "<C-w><")
vim.keymap.set("", "<S-Down>", "<C-w>-")
vim.keymap.set("", "<S-Up>", "<C-w>+")
vim.keymap.set("", "<S-Left>", "<C-w>>")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")

vim.keymap.set("n", ";", ":")
