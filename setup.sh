# A simple script to perform setup commands to prepare a vim environment

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
        git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
else
        git -C ~/.vim/bundle/Vundle.vim pull
fi

vim +PluginInstall +qall

npm i --prefix ~/.vim/bundle/tern_for_vim
