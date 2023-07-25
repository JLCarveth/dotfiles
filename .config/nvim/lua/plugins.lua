-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use { 'neoclide/coc.nvim', branch = 'release' }
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }
  use 'ryanoasis/vim-devicons'
  use {
    "catppuccin/nvim", as = "catppuccin",
    config = function()
      require("catppuccin").setup({ 
        transparent_background = true,
        background = { light = "latte", dark = "macchiato" }
      })
    end,
    run = ":CatppuccinCompile",
  }
  use {
    'rmagatti/auto-session',
    config = function ()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "/", "~/", "~/Downloads", "~/Documents" },
      }
    end
  }
  use 'lewis6991/gitsigns.nvim'
  use {
    'nvim-telescope/telescope.nvim', tag='0.1.0',
    requires = {{ 'nvim-lua/plenary.nvim' }}
  }
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  use {
    'numToStr/Comment.nvim',
    config = function()
        require('Comment').setup()
    end
  }
  use 'neoclide/vim-jsx-improve'
end)

