local augroup = vim.api.nvim_create_augroup   -- Create/get autocommand group
local autocmd = vim.api.nvim_create_autocmd   -- Create autocommand

augroup('YankHighlight', { clear = true })
autocmd('TextYankPost', {
  group = 'YankHighlight',
  callback = function()
    vim.highlight.on_yank({ higroup = 'IncSearch', timeout = '50' })
  end
})

augroup('jump_last_position', { clear = true })
autocmd("BufReadPost",{
  callback = function()
    local row, col = unpack(vim.api.nvim_buf_get_mark(0, "\""))
    if {row, col} ~= {0, 0} then
      vim.api.nvim_win_set_cursor(0, {row, 0})
    end
  end,
  group = 'jump_last_position'
})

autocmd('BufWritePre', {
  pattern = '',
  command = ":%s/\\s\\+$//e"
})

autocmd('BufEnter', {
  pattern = '',
  command = 'set fo-=c fo-=r fo-=o'
})

augroup('setLineLength', { clear = true })
autocmd('Filetype', {
  group = 'setLineLength',
  pattern = { 'text', 'markdown', 'html', 'xhtml', 'javascript', 'typescript' },
  command = 'setlocal cc=0'
})

augroup('setIndent', { clear = true })
autocmd('Filetype', {
  group = 'setIndent',
  pattern = { 'xml', 'html', 'xhtml', 'css', 'scss', 'javascript', 'typescript',
  'yaml', 'lua'
},
command = 'setlocal shiftwidth=2 tabstop=2'
})
