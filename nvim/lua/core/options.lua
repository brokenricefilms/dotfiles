local g = vim.g
local opt = vim.opt

opt.mouse = 'a'
opt.clipboard = 'unnamedplus'
opt.swapfile = false
opt.completeopt = 'menuone,noinsert,noselect'

opt.number = true
opt.relativenumber = true
opt.showmatch = true
opt.ignorecase = true
opt.smartcase = true
opt.wrap = true
opt.linebreak = true
opt.scrolloff = 5
opt.termguicolors = true
opt.laststatus = 3
opt.cursorline = true
opt.cursorlineopt = 'number'

opt.undofile = true
opt.undodir = os.getenv('HOME') .. '/.cache/nvim'
opt.undolevels = 10000

opt.expandtab = true
opt.shiftwidth = 4
opt.tabstop = 4
opt.smartindent = true

opt.hidden = true
opt.history = 100
opt.lazyredraw = true
opt.updatetime = 100

opt.shortmess:append "sI"

local disabled_built_ins = {
   "2html_plugin",
   "getscript",
   "getscriptPlugin",
   "gzip",
   "logipat",
   "matchit",
   "tar",
   "tarPlugin",
   "rrhelper",
   "spellfile_plugin",
   "vimball",
   "vimballPlugin",
   "zip",
   "zipPlugin",
   "tutor",
   "rplugin",
   "synmenu",
   "optwin",
   "compiler",
   "bugreport",
   "ftplugin",
}

for _, plugin in pairs(disabled_built_ins) do
   g["loaded_" .. plugin] = 1
end
