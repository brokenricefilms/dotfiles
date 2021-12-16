require("jeskape").setup {
    mappings = {
        f = {
            p = "<cmd>call fzf#vim#complete#path('fd')<enter>",
            w = "<cmd>call fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})<enter>",
        },
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
        ["feat."] = "🌟feature(<esc>pa): ",
    },
    timeout = vim.o.timeoutlen,
}
