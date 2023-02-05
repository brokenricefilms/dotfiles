-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

vim.keymap.set("", "<Right>", "<C-w><")
vim.keymap.set("", "<Down>", "<C-w>-")
vim.keymap.set("", "<Up>", "<C-w>+")
vim.keymap.set("", "<Left>", "<C-w>>")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")

local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

ls.add_snippets("all", {
  s("todo", {
    i(0),
    -- TODO: comment syntax
    t("TODO: "),
    i(1),
  }),
})
