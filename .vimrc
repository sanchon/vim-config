" ------------------------------------------------------------------------
"  Carga de plugins con pathogen
" ------------------------------------------------------------------------
filetype off
call pathogen#infect()
call pathogen#helptags()
syntax on
filetype on
filetype plugin indent on




"--------------------------------------------------------------------------
" usabilidad
"--------------------------------------------------------------------------
set incsearch                "busqueda visual chachi

map <F8> :bn<CR>             "buffers: siguiente
map <F7> :bp<CR>             "buffers: anterior



"--------------------------------------------------------------------------
" aspecto
"--------------------------------------------------------------------------
"set textwidth=100 	     "rompe autom. los 100 caracteres con un CRLF
set columns=120
set lines=50
set guifont=Droid\ Sans\ Mono\ 8"
set number
set ruler
"--------------------------------------------------------------------------




"--------------------------------------------------------------------------
" Programacion: Python
"--------------------------------------------------------------------------
set foldmethod=indent
set foldlevel=99



" ------------------------------------------------------------------------
"  Plugin:Simplenote
" ------------------------------------------------------------------------
let g:SimplenoteUsername = "sanchon@gmail.com"
let g:SimplenotePassword = "tata2809"
