-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("n", "<Right>", "<C-w><")
vim.keymap.set("n", "<Up>", "<C-w>+")
vim.keymap.set("n", "<Left>", "<C-w>>")
vim.keymap.set("n", "<Down>", "<C-w>-")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")

vim.keymap.set(
  "n",
  "gx",
  '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>'
)

vim.keymap.set("n", "<leader>j", "<C-w>s:e %:h<enter>", { silent = true })

vim.keymap.set("n", "<leader>l", "<C-w>v:e %:h<enter>", { silent = true })

vim.keymap.set("n", "s", "<C-w>")
