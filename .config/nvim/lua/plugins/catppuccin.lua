local options = {
  flavour = "latte", -- latte, frappe, macchiato, mocha
  background = { -- :h background
      light = "latte",
      dark = "macchiato",
  },
  transparent_background = true,
  compile = {
    enabled = true,
    path = vim.fn.stdpath "cache" .. "/catppuccin"
  },
  integrations = {
    dap = {
      enabled = true,
      enable_ui = true,
    },
    cmp = true,
    leap = true,
    telescope = {
      enabled = true,
      style = "nvchad",
    },
    treesitter = true,
  },
  float = {
    transparent = true,
  },
}

require("catppuccin").setup(options)

vim.cmd [[colorscheme catppuccin]]
