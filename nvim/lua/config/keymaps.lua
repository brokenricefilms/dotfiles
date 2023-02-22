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

ls.add_snippets(
  "fish", {
  ls.snippet("f", {
    ls.text_node("function "),
    ls.insert_node(1),
    ls.text_node(' --description "'),
    ls.insert_node(2),
    ls.text_node('"'),
    ls.text_node({ "", "  " }),
    ls.insert_node(3),
    ls.text_node({ "", "end" })
  }),
})
