augroup Format
    autocmd!
    autocmd BufWritePost * FormatWrite
augroup END

lua << EOF
require"format".setup {
    ["*"] = {{cmd = {"sed -i 's/[ \t]*$//'"}}},
    zsh = {{cmd = {"shfmt -w -ci"}}},
    sh = {{cmd = {"shfmt -w -ci"}}},
    bash = {{cmd = {"shfmt -w -ci"}}},
    vim = {
        {
            cmd = {
                function(file)
                    return
                        string.format('lua-format -i  --tab-width=2 %s', file)
                end
            },
            start_pattern = "^lua << EOF$",
            end_pattern = "^EOF$"
        }
    },
    lua = {
        {
            cmd = {
                function(file)
                    return string.format('lua-format -i --tab-width=2 %s', file)
                end
            }
        }
    },
    java = {
        {
            cmd = {
                function(file)
                    return string.format('clang-format --style=Google -i %s',
                                         file)
                end
            }
        }
    },
    cpp = {
        {
            cmd = {
                function(file)
                    return string.format('clang-format --style=Google -i %s',
                                         file)
                end
            }
        }
    },
    c = {
        {
            cmd = {
                function(file)
                    return string.format('clang-format --style=Google -i %s',
                                         file)
                end
            }
        }
    },
    cs = {
        {
            cmd = {
                function(file)
                    return string.format('clang-format --style=Google -i %s',
                                         file)
                end
            }
        }
    },
    go = {{cmd = {"gofmt -w", "goimports -w"}, tempfile_postfix = ".tmp"}},
    javascript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
    typescript = {{cmd = {"prettier -w", "./node_modules/.bin/eslint --fix"}}},
    markdown = {
        {cmd = {"prettier -w"}}, {
            cmd = {
                function(file)
                    return string.format('clang-format --style=Google -i %s',
                                         file)
                end
            },
            start_pattern = "^```cpp$",
            end_pattern = "^```$",
            target = "current"
        }, {
            cmd = {
                function(file)
                    return string.format('clang-format --style=Google -i %s',
                                         file)
                end
            },
            start_pattern = "^```cs$",
            end_pattern = "^```$",
            target = "current"
        }, {
            cmd = {cmd = {"prettier -w"}},
            start_pattern = "^```js$",
            end_pattern = "^```$",
            target = "current"
        }, {
            cmd = {cmd = {"prettier -w"}},
            start_pattern = "^```css$",
            end_pattern = "^```$",
            target = "current"
        }, {
            cmd = {cmd = {"prettier -w"}},
            start_pattern = "^```html$",
            end_pattern = "^```$",
            target = "current"
        }
    },
    yaml = {{cmd = {"prettier -w"}}},
    json = {{cmd = {"prettier -w"}}},
    html = {{cmd = {"prettier -w"}}},
    css = {{cmd = {"prettier -w"}}}
}
EOF
