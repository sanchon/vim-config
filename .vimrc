"------------------------------------------------------------------------
" Carga de plugins con pathogen
"------------------------------------------------------------------------
let g:pathogen_disabled = ["ropevim"]             "por si queremos deshabilitar algun plugin
filetype off                                      "por algun motivo hay que quitar el filetype
call pathogen#runtime_append_all_bundles(
call pathogen#helptags()
syntax on                                         "colorear sintaxis
filetype on                                       "volvemos a activar el filetype
filetype plugin indent on                         "plugins adicionales para la indentacion



" -----------------------------------------------------------
" General
" -----------------------------------------------------------
set nocompatible                                  "funciones avanzadas
set encoding=utf-8                                "otra opcion es latin1
if has("gui_running")
    set guioptions=abegmrLtT
endif
set nowrap
set clipboard=unnamed                             "para que se use siempre el registro * en lugar del unnamed
set backspace=indent,eol,start                    "algunas veces no funciona


"--------------------------------------------------------------------------
" usabilidad
"--------------------------------------------------------------------------
set incsearch                                    "busqueda visual chachi
set smartcase     	                             "es ignorecase si escribes en minusculas
if has("gui_running")
    set autochdir                                "cambia el directorio actual al del fichero abierto
endif

"para cambiar de buffer rápidamente
"----------------------------------
set hidden                                       "no me importa que haya buffers ocultos
map <F8> :bn<CR>
imap <F8> <Esc>:bn<CR>
map <F7> :bp<CR>
imap <F7> <Esc>:bp<CR>

"para cambiar de tab rápidamente
"-------------------------------
map <C-Tab> :tabnext<CR>
imap <C-Tab> <Esc>:tabnext<CR>
map <C-S-Tab> :tabprevious<CR>
imap <C-S-Tab> <Esc>:tabprevious<CR>


if has("win32")                                  "en Windows... copy-paste con ctrl-c y ctrl-v
    if has("gui_running")
        " ---- Windows Like Copy-Paste keys ----
        " CTRL-v is paste
        inoremap <C-v> <esc>"*p<return>i
        " CTRL-x is cut (in visual mode only)
        vnoremap <C-x> "*d
        " CTRL-c is copy (in visual mode only)
        vnoremap <C-c> "*y
    endif
endif


if has("win32") || has("mac")                    "en Windows y Mac... el leader puede ser º (es como el \ pero sin altgr)
    let mapleader="º"
endif


"--------------------------------------------------------------------------
" indenting done right
"--------------------------------------------------------------------------
set tabstop=4
set expandtab
set shiftwidth=4
set smarttab autoindent



"--------------------------------------------------------------------------
" aspecto
"--------------------------------------------------------------------------
set columns=120                           "columnas
set lines=50                              "filas
"set textwidth=100 	                      "rompe autom. los 100 caracteres con un CRLF

if has("gui_running")                                       "El tipo de letra en una gui...
  if has("gui_macvim")                                      " |
    set guifont=Ubuntu\ Mono\ derivative\ Powerline:h12     " ---en Mac OS X
  elseif has("win32")                                       " |
    set guifont=Ubuntu_Mono_derivative_Powerlin:h10:cANSI  " ---en Windows
  else                                                      " |
    set guifont=Droid\ Sans\ Mono\ 8                        " ·--elsewhere
  endif
endif

if has("gui_running")
  set background=dark
  colorscheme solarized
endif


set number
set ruler

set laststatus=2                          "siempre se muestra la 'statusline'

set showcmd                               "muestra el comando en la statusline
set wildmenu                              "autocompletado mejorado

"--------------------------------------------------------------------------





" ------------------------------------------------------------------------
"  Plugin:simplenote
" ------------------------------------------------------------------------
source ~/.simplenoterc.vim

" ------------------------------------------------------------------------
"  Plugin:matchit
" ------------------------------------------------------------------------
runtime macros/matchit.vim


" ------------------------------------------------------------------------
"  Plugin:NerdTree
" ------------------------------------------------------------------------
map <leader>n :NERDTreeToggle<CR>


" ------------------------------------------------------------------------
"  Plugin:Gundo
" ------------------------------------------------------------------------
map <leader>g :GundoToggle<CR>


" ------------------------------------------------------------------------
"  Plugin:Supertab
" ------------------------------------------------------------------------
au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabMappingForward = '<c-space>'		" el tabulador es demasiado agresivo
let g:SuperTabMappingBackward = '<s-c-space>'
set completeopt=menuone,longest,preview


" ------------------------------------------------------------------------
"  Plugin:Airline (ojo, necesitas una "patched font" para que mole)
" ------------------------------------------------------------------------
if has("gui_running")
    let g:airline_powerline_fonts=1  "(estos simbolitos no funcionan en la shell)
endif



