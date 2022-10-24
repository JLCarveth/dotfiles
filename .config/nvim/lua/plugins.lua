-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'feline-nvim/feline.nvim'
  use 'ryanoasis/vim-devicons'
  use {
    'neoclide/coc.nvim', branch = 'release'
  }
--  use 'preservim/nerdtree'
  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}
  use "EdenEast/nightfox.nvim"
  use {
    'rmagatti/auto-session',
    config = function ()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "/", "~/", "~/Downloads", "~/Documents" },
      }
    end
  }
  use {
    'nvim-treesitter/nvim-treesitter',
    run = function() require("nvim-treesitter.install").update({ with_sync = true }) end,
  }
end)
