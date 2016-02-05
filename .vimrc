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


"--------------------------------------------------------------------------
" usabilidad
"--------------------------------------------------------------------------
set incsearch                                    "busqueda visual chachi
set smartcase
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



"--------------------------------------------------------------------------
" aspecto
"--------------------------------------------------------------------------
set columns=220                           "columnas
syntax on                                 "colorear sintaxis
set lines=150                             "filas
"set textwidth=100 	                      "rompe autom. los 100 caracteres con un CRLF

if has("gui_running")                                       "El tipo de letra en una gui...
  if has("gui_macvim")                                      " |
    set guifont=Ubuntu\ Mono\ derivative\ Powerline:h12     " ---en Mac OS X
  elseif has("win32")                                       " |
    set guifont=Ubuntu_Mono_derivative_Powerlin:h9:cANSI  " ---en Windows
  else                                                      " |
    set guifont=Droid\ Sans\ Mono\ 8                        " ·--elsewhere
  endif
endif

set number

set showcmd                               "muestra el comando en la statusline

if has("win32")                           "si es windows, intentamos maximizar la ventana
  au GUIEnter * simalt ~x
endif
"--------------------------------------------------------------------------



" ------------------------------------------------------------------------
"  Plugin:Vundle
" ------------------------------------------------------------------------
filetype off
if has("win32")
  set rtp+=$HOME/vimfiles/bundle/Vundle.vim
else
  set rtp+=~/.vim/bundle/Vundle.vim
endif
call vundle#begin()
Plugin 'tpope/vim-sensible'
Plugin 'VundleVim/Vundle.vim'
Plugin 'bling/vim-airline'
Plugin 'bling/vim-bufferline'
Plugin 'Solarized'
Plugin 'EnhCommentify.vim'
Plugin 'PLI-Tools'
Plugin 'tpope/vim-fugitive'
Plugin 'Gundo'
Plugin 'The-NERD-tree'
Plugin 'simplenote.vim'
Plugin 'Syntastic'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'bronson/vim-visual-star-search'
Plugin 'arecarn/selection.vim'
Plugin 'arecarn/crunch.vim'
call vundle#end() 

" ------------------------------------------------------------------------
"  Colorscheme:solarized
" ------------------------------------------------------------------------
if has("gui_running")
  set background=dark
  colorscheme solarized
endif

" ------------------------------------------------------------------------
"  Plugin:simplenote
" ------------------------------------------------------------------------
source ~/.simplenoterc.vim
"let g:SimplenoteListHeight=500
let g:SimplenoteVertical=1
let g:SimplenoteFiletype="markdown"
let g:SimplenoteSingleWindow=1
"acceso directo a la nota de urls
command Urls Simplenote -o dd41309e719f11e1a9ddb338ad94a326

" ------------------------------------------------------------------------
"  Plugin:matchit
" ------------------------------------------------------------------------
"runtime macros/matchit.vim


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
"au FileType python set omnifunc=pythoncomplete#Complete
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabMappingForward = '<c-space>'		" el tabulador es demasiado agresivo
"let g:SuperTabMappingBackward = '<s-c-space>'
"set completeopt=menuone,longest,preview


" ------------------------------------------------------------------------
"  Plugin:Airline (ojo, necesitas una "patched font" para que mole)
" ------------------------------------------------------------------------
if has("gui_running")
    let g:airline_powerline_fonts=1  "(estos simbolitos no funcionan en la shell)
endif



" ------------------------------------------------------------------------
"  Plugin: Pandoc
" ------------------------------------------------------------------------
let g:pandoc#spell#enabled=0
let g:pandoc#folding#level=20
