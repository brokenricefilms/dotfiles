vim.g.user_emmet_leader_key = ','
vim.g.user_emmet_install_global = 0

vim.api.nvim_create_augroup('emmetInstall', { clear = true })
vim.api.nvim_create_autocmd('Filetype', {
  group = 'emmetInstall',
  pattern = { 'css', 'html', 'xhtml', 'javascript', 'typescript', 'php' },
  command = 'EmmetInstall'
})
