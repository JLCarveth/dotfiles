local builtin = require("telescope.builtin")

vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
vim.keymap.set('n', '<leader>fb', builtin.buffers, {})

require("telescope").setup{
  defaults = { 
    file_ignore_patterns = { "node%_modules/.*", "static/bootstrap/*", "%.git/", "repo_context*" }
  },
  pickers = {
    find_files = {
      hidden = true
    }
  }
}
