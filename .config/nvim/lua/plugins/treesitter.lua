local options = {
  ensure_installed = {
    "lua",
    "vim",
    "c",
    "javascript",
    "typescript",
    "html",
    "css",
    "yaml"
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  indent = { enable = true },
}

require("nvim-treesitter.configs").setup(options)
