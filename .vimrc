
filetype off
call pathogen#infect()
call pathogen#helptags()


syntax on
filetype on
filetype plugin indent on

let g:SimplenoteUsername = "sanchon@gmail.com"
let g:SimplenotePassword = "tata2809"

map <F8> :bn<CR>
map <F7> :bp<CR>

set incsearch

"--------------------------------------------------------------------------
" aspecto
"--------------------------------------------------------------------------
"set textwidth=100 	"rompe autom. los 100 caracteres con un CRLF
set columns=120
set lines=50
set guifont=Droid\ Sans\ Mono\ 8"
set number
set ruler
"--------------------------------------------------------------------------


"--------------------------------------------------------------------------
" Python
"--------------------------------------------------------------------------
set foldmethod=indent
set foldlevel=99
