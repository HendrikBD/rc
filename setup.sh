# A simple script to perform setup commands to prepare a vim environment

# Download or update Vundle package manager for vim
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
else
  git -C ~/.vim/bundle/Vundle.vim pull
fi

if [ ! -d ./dircolors-solarized ]; then
  git clone https://github.com/seebi/dircolors-solarized
else
  git -C ./dircolors-solarized pull
fi

# vim +PluginInstall +qall

# Setting up plugins that require more than vundle
python ~/.vim/bundle/YouCompleteMe/install.py
