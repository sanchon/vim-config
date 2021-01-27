" -----------------------------------------------------------
" General
" -----------------------------------------------------------
set nocompatible                                  "funciones avanzadas
set encoding=utf-8                                "otra opcion es latin1
if has("gui_running")
    set guioptions=ae
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
        inoremap <C-v> <esc>"*pa
        " CTRL-x is cut (in visual mode only)
        vnoremap <C-x> "*d
        " CTRL-c is copy (in visual mode only)
        vnoremap <C-c> "*y
    endif
endif

"if has("win32") || has("mac")                    "en Windows y Mac... el leader puede ser º (es como el \ pero sin altgr)
    " let mapleader="º"
    let mapleader=" "
    let maplocalleader=" "
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
set number
syntax on                                 "colorear sintaxis
if has("gui_running")
    set columns=220                           "columnas
    set lines=150                             "filas
endif
set textwidth=0 	                      "rompe autom. a los X caracteres con un CRLF

if has("gui_running")                                       "El tipo de letra en una gui...
  if has("gui_macvim")                                      " |
    set guifont=Ubuntu\ Mono\ derivative\ Powerline:h12     " ---en Mac OS X
  elseif has("win32")                                       " |
    " set guifont=Ubuntu_Mono_derivative_Powerlin:h9:cANSI  " ---en Windows
    set guifont=Fira\ Code\ Medium:h10:cANSI  " ---en Windows
  else                                                      " |
    set guifont=Droid\ Sans\ Mono\ 8                        " ·--elsewhere
  endif
endif

set relativenumber

set showcmd                               "muestra el comando en la statusline

if has("win32")                           "si es windows, intentamos maximizar la ventana
  au GUIEnter * simalt ~x
endif

set listchars=tab:→\ ,trail:·,precedes:«,extends:»,eol:¶,space:·

set foldmethod=syntax
set nofoldenable

set renderoptions=type:directx
set encoding=utf-8
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




"--------------------------------------------------------------------------
" Limpiar un JSON fácilmente
command! LimpiarJSON %!python -m json.tool
"--------------------------------------------------------------------------


"--------------------------------------------------------------------------
" En VISUAL si pulsas ":" se lleva el texto seleccionado a la linea de
" comandos
vnoremap : y:<C-r>"<C-b>
"--------------------------------------------------------------------------



" ------------------------------------------------------------------------
"  Plugin: vim-plug
" ------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'junegunn/fzf'
Plug 'sanchon/misChuletas'
Plug 'tpope/vim-sensible'
Plug 'vim-airline/vim-airline'
Plug 'tomtom/tcomment_vim'
Plug 'sanchon/PLI-Tools'
Plug 'sanchon/jcl.vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb'
Plug 'tpope/vim-capslock'
Plug 'mbbill/undotree'
Plug 'preservim/nerdtree'
Plug 'vim-syntastic/syntastic'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'bronson/vim-visual-star-search'
Plug 'klen/python-mode'
Plug 'yegappan/mru'
Plug 'easymotion/vim-easymotion'
Plug 'thinca/vim-fontzoom'
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'
Plug 'sk1418/HowMuch'
Plug 'dbeniamine/todo.txt-vim'
Plug 'vifm/vifm.vim'
Plug 'skanehira/preview-markdown.vim'
Plug 'vimwiki/vimwiki'
Plug 'dhruvasagar/vim-open-url'
call plug#end()

" ------------------------------------------------------------------------
"  Colorscheme
" ------------------------------------------------------------------------
if has("gui_running")
  colorscheme tchaba
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
"  Plugin:NerdTree
" ------------------------------------------------------------------------
map <leader>n :NERDTreeToggle<CR>
map <leader>N :NERDTreeFind<CR>
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" ------------------------------------------------------------------------
"  Plugin:Gundo
" ------------------------------------------------------------------------
map <leader>g :GundoToggle<CR>



" ------------------------------------------------------------------------
"  Plugin:Airline (ojo, necesitas una "patched font" para que mole)
" ------------------------------------------------------------------------
if has("gui_running")
    let g:airline_powerline_fonts=1  "(estos simbolitos no funcionan en la shell)
endif
" let g:airline#extensions#branch#enabled = 1
" let g:bufferline_echo = 0
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" let g:airline_section_b =airline#section#create_left(['%{CapsLockStatusline()}'])



" ------------------------------------------------------------------------
"  Plugin: Pandoc
" ------------------------------------------------------------------------
let g:pandoc#spell#enabled=0
let g:pandoc#keyboard#enabled=1
let g:pandoc#folding#level=20
let g:pandoc#filetypes#handled = ["pandoc","markdown"]
let g:pandoc#command#templates_file = split(&runtimepath, ",")[0]."/vim-pandoc-templates"
command! PandocAutoEjecutarMyRevealJsWeb let g:pandoc#command#autoexec_command = "Pandoc #myRevealJsWeb" | let g:pandoc#command#autoexec_on_writes = 1



" ------------------------------------------------------------------------
"  Plugin: Fontzoom
" ------------------------------------------------------------------------
let g:fontzoom_no_default_key_mappings = 1 "por defecto son + y -
map <leader>+ <plug>(fontzoom-larger)
map <leader>- <plug>(fontzoom-smaller)



" ------------------------------------------------------------------------
"  Plugin: AutoCalc
" ------------------------------------------------------------------------
vmap <leader>= <Plug>AutoCalcAppendWithEq 
vmap <leader>== <Plug>AutoCalcAppendWithEqAndSum :%s/Sum\ \ /Total <CR>


" ------------------------------------------------------------------------
"  Plugin: Todo.txt-vim
" ------------------------------------------------------------------------
" activar el autocompletado de proyectos y contextos
au filetype todo setlocal omnifunc=todo#Complete
" Auto completar proyectos
au filetype todo imap <buffer> + +<C-X><C-O>
" Auto completar contextos
au filetype todo imap <buffer> @ @<C-X><C-O>




" ------------------------------------------------------------------------
"  Plugin: Preview-Markdown
" ------------------------------------------------------------------------
let g:preview_markdown_vertical = 1
let g:preview_markdown_auto_update = 1


" ------------------------------------------------------------------------
"  Plugin: vimwiki
" ------------------------------------------------------------------------
let g:vimwiki_list = [{
   \ 'path':'~\notas', 
   \ 'syntax':'markdown', 
   \ 'ext': '.md',
\}]
let g:vimwiki_global_ext = 0
let g:vimwiki_markdown_link_ext = 1
let g:vimwiki_url_maxsave=0


" ------------------------------------------------------------------------
"  Plugin: vim-open-url
" ------------------------------------------------------------------------
nmap gb <Plug>(open-url-browser)
xmap gb <Plug>(open-url-browser)

