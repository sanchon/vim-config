"------------------------------------------------------------------------
" Carga de plugins con pathogen
"------------------------------------------------------------------------
let g:pathogen_disabled = []                     "por si queremos deshabilitar algun plugin

filetype off                                     "por algun motivo hay que quitar el filetype
"call pathogen#infect()
call pathogen#runtime_append_all_bundles()
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
set backspace=indent,eol,start                    "algunas veces no funciona 


"--------------------------------------------------------------------------
" usabilidad
"--------------------------------------------------------------------------
set incsearch                                    "busqueda visual chachi
set smartcase     	                         "es ignorecase si escribes en minusculas
set autochdir                                    "cambia el directorio actual al del fichero abierto

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
"  Plugin:Gundo
" ------------------------------------------------------------------------
map <leader>g :GundoToggle<CR>


" ------------------------------------------------------------------------
"  Plugin:Supertab
" ------------------------------------------------------------------------
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabMappingForward = '<c-space>'		" el tabulador es demasiado agresivo 
let g:SuperTabMappingBackward = '<s-c-space>'
set completeopt=menuone,longest,preview

