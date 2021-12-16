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
        ["fix."] = "🐞fix(<esc>pa): ",
        ["doc."] = "📚documents(<esc>pa): ",
        ["sty."] = "💄style(<esc>pa): ",
        ["ref."] = "🎨refactor(<esc>pa): ",
        ["per."] = "⚡️performance(<esc>pa): ",
        ["test."] = "✅test(<esc>pa): ",
        ["chore."] = "🔩chore(<esc>pa): ",
        ["bui."] = "🔨build(<esc>pa): ",
        ["ci."] = "🤖ci(<esc>pa): ",
        ["cle."] = "💄style(<esc>pa): clean code",
        ["rev."] = "⏪revert(<esc>pa): ",
        },
        timeout = vim.o.timeoutlen,
    }
