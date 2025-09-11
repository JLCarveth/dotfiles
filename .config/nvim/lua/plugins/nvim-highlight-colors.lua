vim.opt.termguicolors = true

local options = {
	render = 'virtual',
	virtual_symbol_prefix = ' ',
	virtual_symbol_position = 'eow'
}
require("nvim-highlight-colors").setup(options)
