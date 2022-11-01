vim.keymap.set('n', 'mi', ':lua require("harpoon.mark").add_file()<enter>')
vim.keymap.set('n', 'mo', ':lua require("harpoon.ui").toggle_quick_menu()<enter>')

-- " moving less, thinking like hjkl, now with number qwert|asdfg
-- " 6|7|8|9|10
-- " q|w|e|r|t
-- " ----------
-- " 1|2|3|4|5
-- " a|s|d|f|g
vim.keymap.set('n', 'ma', ':lua require("harpoon.ui").nav_file(1)<enter>')
vim.keymap.set('n', 'ms', ':lua require("harpoon.ui").nav_file(2)<enter>')
vim.keymap.set('n', 'md', ':lua require("harpoon.ui").nav_file(3)<enter>')
vim.keymap.set('n', 'mf', ':lua require("harpoon.ui").nav_file(4)<enter>')
vim.keymap.set('n', 'mg', ':lua require("harpoon.ui").nav_file(5)<enter>')
vim.keymap.set('n', 'mq', ':lua require("harpoon.ui").nav_file(6)<enter>')
vim.keymap.set('n', 'mw', ':lua require("harpoon.ui").nav_file(7)<enter>')
vim.keymap.set('n', 'me', ':lua require("harpoon.ui").nav_file(8)<enter>')
vim.keymap.set('n', 'mr', ':lua require("harpoon.ui").nav_file(9)<enter>')
vim.keymap.set('n', 'mt', ':lua require("harpoon.ui").nav_file(10)<enter>')
