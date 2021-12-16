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
        ["fe."] = "🌟feature(<esc>pa): ",
        ["fi."] = "🐞fix(<esc>pa): ",
        ["do."] = "📚documents(<esc>pa): ",
        ["st."] = "💄style(<esc>pa): ",
        ["re."] = "🎨refactor(<esc>pa): ",
        ["pe."] = "⚡️performance(<esc>pa): ",
        ["te."] = "✅test(<esc>pa): ",
        ["ch."] = "🔩chore(<esc>pa): ",
        ["bu."] = "🔨build(<esc>pa): ",
        ["ci."] = "🤖ci(<esc>pa): ",
        ["cl."] = "💄style(<esc>pa): clean code",
        ["re."] = "⏪revert(<esc>pa): ",
        },
        timeout = vim.o.timeoutlen,
    }
