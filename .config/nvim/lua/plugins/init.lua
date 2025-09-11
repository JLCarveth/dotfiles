local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

return require("lazy").setup({
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-path",
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require "plugins.treesitter"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.lspconfig"
    end,
  },
  {
     "williamboman/mason.nvim",
     config = function()
      require "plugins.mason"
     end,
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require "plugins.mason_lspconfig"
    end,
  },
  {
    "rmagatti/auto-session",
    config = function()
      require("auto-session").setup({
	      log_level = "error",
	      auto_session_suppress_dirs = { "~/", "~/Developer", "~/Downloads", "/"},
      })
    end
  },
  {
    "nvim-telescope/telescope.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    config = function ()
	    require "plugins.telescope"
    end,
  },
  {
    "f-person/auto-dark-mode.nvim",
    config = function ()
      require "plugins.autodark"
    end,
  },
  {
    "catppuccin/nvim",
    priority = 1000,
    name = "catppuccin",
    build = ":CatppuccinCompile",
    config = function()
      require "plugins.catppuccin"
    end
  },
  {
    "nvim-lualine/lualine.nvim",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require "plugins.lualine"
    end
  },
  {
    'hrsh7th/nvim-cmp',
    config = function()
      require "plugins.cmp"
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    dependencies = "onsails/lspkind.nvim",
    run = "make install_jsregexp",
    config = function()
      require "plugins.luasnip"
    end,
  },
  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require "plugins.nvim-highlight-colors"
    end,
  },
})
