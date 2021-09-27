require'nvim-treesitter.configs'.setup {
  highlight = {
    enable = true,
    disable = {},
  },
  indent = {
    enable = false,
    disable = {},
  },
  ensure_installed = {
    "typescript",
    "vim",
    "bash",
    "json",
    "cpp",
    "yaml",
    "html",
    "css",
  },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.typescript.used_by = { "javascript", "typescript.tsx" }
