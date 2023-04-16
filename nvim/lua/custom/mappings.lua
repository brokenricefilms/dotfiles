---@type MappingsTable
local M = {}

vim.keymap.set("n", "<Right>", "<C-w><")
vim.keymap.set("n", "<Up>", "<C-w>+")
vim.keymap.set("n", "<Left>", "<C-w>>")
vim.keymap.set("n", "<Down>", "<C-w>-")

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "*", "*zz")
vim.keymap.set("n", "#", "#zz")

vim.keymap.set("n", "gx", '<Cmd>call jobstart(["xdg-open", expand("<cfile>")], {"detach": v:true})<CR>')

vim.keymap.set("n", "s", "<C-w>")

-- more keybinds!

return M
