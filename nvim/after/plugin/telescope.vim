nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files{
            \   find_command = {
                \     'fd',
                \     '--type', 'f',
                \     '--ignore-case',
                \     '--exclude', 'gems',
                \     '--exclude', 'undodir',
                \   },
                \ }<CR>

nnoremap <Leader>b :lua require'telescope.builtin'.buffers()<cr>

nnoremap <leader>r <cmd>lua require('telescope.builtin').live_grep()<CR>

nnoremap <c-p> <cmd>lua require('telescope.builtin').commands()<CR>

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
defaults = {
    mappings = {
        i = {
            ["<esc>"] = actions.close
            },
        },
    },
pickers = {
    -- Your special builtin config goes in here
    buffers = {
        sort_lastused = true,
        theme = "dropdown",
        previewer = false,
        mappings = {
            i = {
                ["<c-d>"] = require("telescope.actions").delete_buffer,
                },
            n = {
                ["<c-d>"] = require("telescope.actions").delete_buffer,
                }
            }
        },
    find_files = {
        theme = "dropdown"
        }
    },
}
EOF
