dotfiles
========

Dotfiles and terminal configuration.


To install:
1. clone repo somewhere
2. initialize submodules
     git submodule init
     git submodule update
3. xxxxTODO



Add a vim plugin:
cd this-repo
git submodule init
git submodule add https://github.com/WHATEVER/REPO.git .vim/bundle/REPO
git commit -m "Whatever"
git push

Need to reatart vim, reloading vimrc doesnt appear to reinit pathogen.
