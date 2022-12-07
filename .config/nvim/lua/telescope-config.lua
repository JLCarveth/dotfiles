require('telescope').setup({
    defaults = {
        file_ignore_patterns = { "./node_modules/*", "node_modules", "build/*" },
    }
});
local builtin = require('telescope.builtin');
vim.keymap.set('n', '<leader>ff', builtin.find_files, {});
