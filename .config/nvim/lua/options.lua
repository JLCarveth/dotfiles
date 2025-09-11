vim.opt.expandtab = true
vim.opt.shiftwidth = 2
vim.opt.smartindent = true
vim.opt.number = true
vim.opt.undofile = true

vim.opt.backupcopy = 'yes'

-- Let header files be parsed by the C parser instead of Cpp
vim.g.c_syntax_for_h = 1

-- To appropriately highlight condefences returned from denols, need to augment vim.g.markdown_fenced
vim.g.markdown_fenced_languages = {
  "ts=typescript"
}

-- vim.cmd("set foldlevel=99")

vim.lsp.inlay_hint.enable()
