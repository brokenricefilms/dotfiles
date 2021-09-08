nnoremap <leader>f <cmd>lua require('telescope.builtin').find_files()<cr>

nnoremap <Leader>b :lua require'telescope.builtin'.buffers()<cr>

nnoremap <leader>r <cmd>lua require('telescope.builtin').live_grep()<CR>

nnoremap <c-p> <cmd>lua require('telescope.builtin').commands()<CR>

lua << EOF
local actions = require('telescope.actions')
require('telescope').setup{
defaults = {
    file_ignore_patterns = {"gems", "undodir"},
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
