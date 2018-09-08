# A simple script to perform setup commands to prepare a vim environment

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
        git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
fi
git -C ~/.vim/bundle/Vundle.vim pull

vim +PluginInstall +qall
