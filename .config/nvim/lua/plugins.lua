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
  use 'preservim/nerdtree'
  -- You can alias plugin names
  use {'dracula/vim', as = 'dracula'}
  use "EdenEast/nightfox.nvim"
end)
