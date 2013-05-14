"------------------------------------------------------------------------
" Carga de plugins con pathogen
"------------------------------------------------------------------------
filetype off                                     "por algun motivo hay que quitar el filetype
call pathogen#infect()
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
set clipboard=unnamed



"--------------------------------------------------------------------------
" usabilidad
"--------------------------------------------------------------------------
set incsearch                                    "busqueda visual chachi
set smartcase     	                         "es ignorecase si escribes en minusculas

map <F8> :bn<CR>                                 "buffers: siguiente
map <F7> :bp<CR>                                 "buffers: anterior


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
" aspecto
"--------------------------------------------------------------------------
set columns=120                           "columnas
set lines=50                              "filas
"set textwidth=100 	                  "rompe autom. los 100 caracteres con un CRLF

if has("gui_running")                     "El tipo de letra en una gui...
  if has("gui_macvim")                    " |
    set guifont=Menlo:h12:                " ·--en MacOS
  elseif has("win32")                     " |
    set guifont=Consolas:h8               " ·--en Windows
  else                                    " |
    set guifont=Droid\ Sans\ Mono\ 8      " ·--elsewhere
  endif
endif

if &t_Co > 2 || has("gui_running")        "Si hay una gui o un terminal con colores...
  colorscheme murphy                      "esquema. Otros: darkblue, delek, desert, elflord, evening,
endif                                     "macvim, morning, murphy, pablo, peachpuff, 
                                          "ron, shine, slate, torte, zellner

set number
set ruler

set showcmd                               "muestra el comando en la statusline
set wildmenu                              "autocompletado mejorado

"--------------------------------------------------------------------------




"--------------------------------------------------------------------------
" Programacion: Python
"--------------------------------------------------------------------------
if has("autocmd")
    filetype on
    autocmd Filetype python set foldmethod=indent
    autocmd Filetype python set foldlevel=99
endif




" ------------------------------------------------------------------------
"  Plugin:NerdTree
" ------------------------------------------------------------------------
map <leader>n :NERDTreeToggle<CR>



" ------------------------------------------------------------------------
"  Plugin:Supertab
" ------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = "context"
set completeopt=menuone,longest,preview


