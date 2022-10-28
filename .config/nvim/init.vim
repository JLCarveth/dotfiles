" Set our <leader> binding to 89
let mapleader = "89"

set t_Co=256
lua require('plugins')
filetype plugin indent on
syntax on
set number
colorscheme nightfox

" Lualine config
lua require('lualine-config')
" Telescope config
lua require('telescope-config')

let term_program=$TERM_PROGRAM
if term_program !=? 'Apple_Terminal'
    set termguicolors
else
    if $TERM !=? 'xterm-256color'
        set termguicolors
    endif
endif

filetype plugin on

" Sane spliting defaults
set splitbelow
set splitright

" Sane split navigation keys: ex. Ctrl-J instead of Ctrl-W + J
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Italic Support
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

command! -nargs=0 Prettier :call CocAction('runCommand','prettier.formatFile')

" Add fuzzy search
set rtp+=/usr/local/opt/fzf
