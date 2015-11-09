vim-config
==========

Hugo's vim configuration, ready to deploy anywhere


installation
------------

To install (unix): 

    cd .vim
    git clone https://github.com/sanchon/vim-config.git .
    git submodule init
    git submodule update
    ln -s .vim/.vimrc .vimrc



To install (windows), with cmd

    cd %HOMEDRIVE%%HOMEPATH%
    mkdir vimfiles
    chdir vimfiles
    git init
    git remote add origin https://github.com/sanchon/vim-config.git 
    git pull origin master
    git submodule update --init --recursive
    copy _vimrc ..
    copy .simplenoterc.vim ..



This is no longer necessary, since we are using Vundle, to update local repository to most recent version of every plugin

    git submodule foreach git checkout master
    git submodule foreach git pull    
    git add...
    git commit...
    
This is no longer necessary, either, to update from remote repository

    git pull
    git submodule update --init --recursive



adding another submodule
------------------------

    git submodule add https://github.com/nelstrom/vim-visual-star-search.git bundle/vim-visual-star-search
