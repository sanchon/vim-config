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
map <F5> :e<CR>G

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


"if has("win32") || has("mac")                    "en Windows y Mac... el leader puede ser º (es como el \ pero sin altgr)
    " let mapleader="º"
    let mapleader=" "
"endif


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



"--------------------------------------------------------------------------
" FTP AL HOST
"
" para hacer FTP lo lógico es esto:
let g:netrw_ftpmode="ascii"
"
" usuario y password de ftp en fichero aparte, en windows. En otros sistemas
" mejor usar .netrc
let g:netrw_ftp_cmd= "ftp -s:" . $HOME . "\\MACHINE.ftp"
" al hacer logon con el fichero salen mensajes en la ventana de mensajes... me
" la cargo:
let g:netrw_use_errorwindow =0
" 
" FTPs al host: así me ahorro el mvsp1 y las comillas al inicio y al final:
command! -nargs=+ Host e ftp://mvsp1/\'<args>\'
command! -nargs=+ PLI e ftp://mvsp1/'sys1.cage.fuentes(<args>)' | setlocal filetype=pli
command! -nargs=+ INC e ftp://mvsp1/'cage.maclib(<args>)' | setlocal filetype=pli
command! -nargs=+ JCL e ftp://mvsp1/'sys1.cage.jcllib(<args>)' | setlocal filetype=jcl
command! -nargs=+ JCLD e ftp://mvsp1/'sys1.cage.jcllib(<args>)' | setlocal filetype=sh
command! -nargs=+ FILE e ftp://mvse1/'<args>'
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
"Plugin 'EnhCommentify.vim'
Plugin 'tomtom/tcomment_vim'
" --> Plugin 'PLI-Tools'
Plugin 'sanchon/PLI-Tools'
Plugin 'sanchon/jcl.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'Gundo'
Plugin 'The-NERD-tree'
Plugin 'mrtazz/simplenote.vim'
Plugin 'Syntastic'
Plugin 'vim-pandoc/vim-pandoc'
Plugin 'vim-pandoc/vim-pandoc-syntax'
Plugin 'bronson/vim-visual-star-search'
Plugin 'arecarn/selection.vim'
Plugin 'arecarn/crunch.vim'
Plugin 'klen/python-mode'
Plugin 'vim-scripts/visSum.vim'
Plugin 'yegappan/mru'
Plugin 'ingo-library'
Plugin 'clone'
Plugin 'junegunn/vader.vim'
Plugin 'trevordmiller/nova-vim'
Plugin 'easymotion/vim-easymotion'
Plugin 'thinca/vim-fontzoom'
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
let g:SimplenoteVertical=1
let g:SimplenoteFiletype="markdown"
let g:SimplenoteSingleWindow=1
let g:SimplenoteListSize=65
"acceso directo a la nota de urls
command! Urls SimplenoteOpen dd41309e719f11e1a9ddb338ad94a326
command! Todo SimplenoteOpen 1e3fc83d742311e69eb145bdf8915bee
command! Passwords SimplenoteOpen 31d54c45e2ef11e4a0a6bdec9b00c108 

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






