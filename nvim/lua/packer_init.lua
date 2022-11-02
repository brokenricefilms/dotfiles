local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  })
  vim.o.runtimepath = vim.fn.stdpath('data') .. '/site/pack/*/start/*,' .. vim.o.runtimepath
end

vim.cmd [[
augroup packer_user_config
autocmd!
autocmd BufWritePost packer_init.lua source <afile> | PackerSync
augroup end
]]

local status_ok, packer = pcall(require, 'packer')
if not status_ok then
  return
end

return packer.startup(function(use)
  use 'wbthomason/packer.nvim'

  use 'lukas-reineke/indent-blankline.nvim'

  use {
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup{}
    end
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
  }

  use {
    'nvim-treesitter/nvim-treesitter-textobjects'
  }

  use {
    'p00f/nvim-ts-rainbow'
  }

  use 'projekt0n/github-nvim-theme'

  use {'neovim/nvim-lspconfig'}

  use {'lukas-reineke/lsp-format.nvim'}

  use {
    "hoob3rt/lualine.nvim",
  }

  use {
    'hrsh7th/nvim-cmp',
    requires = {
      'L3MON4D3/LuaSnip',
      'hrsh7th/cmp-nvim-lsp',
      'hrsh7th/cmp-vsnip',
      'hrsh7th/vim-vsnip',
      'andersevenrud/cmp-tmux',
    },
  }

  use {
    'tzachar/cmp-fuzzy-buffer',
    requires = {
      'hrsh7th/nvim-cmp',
      'tzachar/fuzzy.nvim'
    }
  }

  use {
    'tzachar/cmp-fuzzy-path',
    requires = {
      'hrsh7th/nvim-cmp',
      'tzachar/fuzzy.nvim'
    }
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup{}
    end
  }

  use {
    'christoomey/vim-tmux-navigator'
  }

  use {
    'tpope/vim-eunuch'
  }

  use {
    'tpope/vim-surround'
  }

  use {
    'norcalli/nvim-colorizer.lua'
  }

  use {
    'romainl/vim-cool'
  }

  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }

  use {
    'nvim-telescope/telescope.nvim',
    branch = '0.1.x',
    requires = { 'nvim-lua/plenary.nvim' }
  }

  use {
    'nvim-telescope/telescope-fzf-native.nvim',
    run = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build'
  }

  use {
    'nvim-telescope/telescope-frecency.nvim',
    requires = {'kkharji/sqlite.lua'}
  }

  use {
    'ThePrimeagen/harpoon',
    requires = {'nvim-lua/popup.nvim'},
  }

  use {
    'mattn/emmet-vim',
    setup = function ()
      vim.g.user_emmet_leader_key = ','
      vim.g.user_emmet_install_global = 0

      vim.api.nvim_create_augroup('emmetInstall', { clear = true })
      vim.api.nvim_create_autocmd('Filetype', {
        group = 'emmetInstall',
        pattern = { 'css', 'html', 'xhtml', 'javascript', 'typescript', 'php' },
        command = 'EmmetInstall'
      })
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)
