lua << EOF
vim.g.coq_settings = {
  keymap = {
    recommended = false,
    jump_to_mark = '<c-e>',
    manual_complete = ';;',
  },
}

require("coq_3p")({
	{ src = "copilot", short_name = "COP", accept_key = "<c-f>" },
})
EOF
