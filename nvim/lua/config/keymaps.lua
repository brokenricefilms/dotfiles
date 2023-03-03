-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set('', '<Right>', '<C-w><')
vim.keymap.set('', '<Down>', '<C-w>-')
vim.keymap.set('', '<Up>', '<C-w>+')
vim.keymap.set('', '<Left>', '<C-w>>')

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")

vim.keymap.set('', 'gx', '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>')

local ls = require("luasnip")

ls.add_snippets(
  "all", {
  ls.snippet("todo", {
    ls.insert_node(0),
    -- TODO: comment syntax
    ls.text_node("TODO: "),
    ls.insert_node(1),
  }),
})
