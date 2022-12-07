" Set our <leader> binding to 89
let mapleader = "89"

" Enable language server
" lua require'lspconfig'.denols.setup{}
set t_Co=256
lua require('plugins')
set smartindent
"filetype plugin indent on
"filetype plugin on
"syntax on
set number

if strftime("%H") < 18
	colorscheme dayfox
else
	colorscheme nightfox
endif

" Lualine config
lua require('lualine-config')
" Telescope config
lua require('telescope-config')
" Treesitter config
lua require('treesitter')
" LSP Configs
" lua require('lspconfs')

let term_program=$TERM_PROGRAM
if term_program !=? 'Apple_Terminal'
    set termguicolors
else
    if $TERM !=? 'xterm-256color'
        set termguicolors
    endif
endif


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

" CoC Settings
" Some servers have issues w/ backup
set nobackup
set nowritebackup

set updatetime=300
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There is always a complete item selected by default, you may
" want to enable no selecy by `"suggest.noselect" : true` in config
inoremap <silent><expr> <TAB>
	\ coc#pum#visible() ? coc#pum#next(1):
	\ CheckBackspace() ? "\<Tab>" :
	\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

