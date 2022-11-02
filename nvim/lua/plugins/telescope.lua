local actions = require("telescope.actions")

require('telescope').setup {
  defaults = {
    mappings = {
      i = {
        ["<esc>"] = actions.close,
      },
    },
    prompt_prefix = "❯ ",
    selection_caret = "❯ ",
    sorting_strategy = "ascending",
    layout_config = {
      prompt_position = "top",
    },
  },
  extensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      override_file_sorter = true,
      case_mode = "smart_case",
    }
  }
}

require('telescope').load_extension('fzf')
require"telescope".load_extension("frecency")

local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>f", builtin.find_files, {})
vim.keymap.set("n", "<leader>j", builtin.live_grep, {})
vim.keymap.set("n", "<leader>k", builtin.buffers, {})
vim.keymap.set("n", ";", builtin.commands, {})
vim.keymap.set("n", "<leader>;", builtin.command_history, {})
vim.api.nvim_set_keymap(
"n",
"<leader>h",
"<Cmd>lua require('telescope').extensions.frecency.frecency()<CR>",
{ noremap = true, silent = true }
)
