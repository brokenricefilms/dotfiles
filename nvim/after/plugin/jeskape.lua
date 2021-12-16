require("jeskape").setup {
    mappings = {
        [";"] = {
            [";"] = "<esc>A;<enter>",
            [","] = "<esc>A,<enter>",
        },
        k = {
            k = "<esc>",
            j = "<esc>",
        },
        j = {
            j = "<esc>",
            k = "<esc>",
        },
        [","] = ",<c-g>u",
        ["."] = ".<c-g>u",
        ["!"] = "!<c-g>u",
        ["?"] = "?<c-g>u",
        ["["] = "[<c-g>u",
    },
    timeout = vim.o.timeoutlen,
}
