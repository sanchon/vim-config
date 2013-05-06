vim-config
==========

Hugo's vim configuration, ready to deploy anywhere


installation
------------

To install (unix): 

    cd .vim
    git clone git://github.com/sanchon/vim-config.git .
    git submodule init
    git submodule update
    cp .vimrc ..



To install (windows), with Git Bash

    cd /c/Program Files/vim/vimfiles
    git init
    git remote add origin git://github.com/sanchon/vim-config.git 
    git pull origin master
    git submodule init
    git submodule update
    cd ..
    fsutil hardlink create _vimrc .\vimfiles\.vimrc   

adding more plugins
-------------------

    git submodule add https://github.com/nelstrom/vim-visual-star-search.git bundle/vim-visual-star-search
