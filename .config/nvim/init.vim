set t_Co=256
lua require('plugins')
filetype plugin indent on
syntax on
set number
colorscheme nightfox

" Treesitter config
lua require('treesitter')
lua require('lualine-config')

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

" File Tree
"let g:netrw_banner=0
"let g:netrw_liststyle=3
"let g:netrw_browse_split=4
"let g:netrw_altv=1
"let g:netrw_winsize=20
"let g:netrw_keepdir=0
"let g:netrw_localcopydircmd='cp -r'
"let NERDTreeShowHidden=1

command! -nargs=0 Prettier :call CocAction('runCommand','prettier.formatFile')

" Add fuzzy search
set rtp+=/usr/local/opt/fzf

"autocmd VimEnter * NERDTree | wincmd p

" Use <Tab> for trigger completion
"function! CheckBackspace() abort
"    let col = col('.')
"    return !col || getline('.')[col - 1] =~# '\s'
"endfunction

" Automatically close nvim if NERDTree is only thing open
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif 
