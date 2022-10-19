set t_Co=256
lua require('plugins')
filetype plugin indent on
syntax on
set number
colorscheme carbonfox

let term_program=$TERM_PROGRAM
if term_program !=? 'Apple_Terminal'
    set termguicolors
else
    if $TERM !=? 'xterm-256color'
        set termguicolors
    endif
endif

filetype plugin on

lua require('feline').setup()

" Italic Support
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" File Tree
let g:netrw_banner=0
let g:netrw_liststyle=3
let g:netrw_browse_split=4
let g:netrw_altv=1
let g:netrw_winsize=20
let g:netrw_keepdir=0
let g:netrw_localcopydircmd='cp -r'
let NERDTreeShowHidden=1

command! -nargs=0 Prettier :call CocAction('runCommand','prettier.formatFile')

" Add fuzzy search
set rtp+=/usr/local/opt/fzf

autocmd VimEnter * NERDTree | wincmd p

" Use <Tab> for trigger completion
function! CheckBackspace() abort
    let col = col('.')
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

