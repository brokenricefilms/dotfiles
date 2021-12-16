require("better_escape").setup {
    mapping = {"jk", "jj", "kk", "kj"},
    timeout = vim.o.timeoutlen,
    clear_empty_lines = false,
    keys = "<Esc>",
}
