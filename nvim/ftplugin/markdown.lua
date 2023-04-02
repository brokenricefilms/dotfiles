vim.keymap.set("i", ";t", "<!--TODO: --><esc>2hi", { silent = true, buffer = 0 })
vim.keymap.set("i", ";l", "[]()<esc>hpF]i", { silent = true, buffer = 0 })
vim.keymap.set("i", ";i", "![]()<esc>F]i", { silent = true, buffer = 0 })
vim.keymap.set("i", ";*", "****<esc>hi", { silent = true, buffer = 0 })
