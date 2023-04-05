vim.keymap.set("i", ";t", "# TODO: ", { silent = true, buffer = 0 })
vim.keymap.set("i", ";a", 'alias =""<esc>F=i', { silent = true, buffer = 0 })
vim.keymap.set("i", ";f", "function () {<enter>}<esc>kf(i", { silent = true, buffer = 0 })
