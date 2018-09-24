# A simple script to perform setup commands to prepare a vim environment
# sudo apt-get update
sudo apt install tmux
sudo apt install build-essential cmake python3-dev python-dev

# Download or update Vundle package manager for vim
if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
  git clone https://github.com/VundleVim/Vundle.vim ~/.vim/bundle/Vundle.vim
  mkdir -p ~/.vim/tmp/backup
else
  git -C ~/.vim/bundle/Vundle.vim pull
fi

if [ ! -d ./dircolors ]; then
  git clone https://github.com/seebi/dircolors-solarized
else
  git -C ./dircolors-solarized pull
fi

if [ ! -d ~/.tmux/plugins/tpm ]; then
  git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
  git -C ~/.tmux/plugins/tpm pull
fi


if [ ! -d ~/utilities/nvm ]; then
  [ ! -d ~/utilities ] && mkdir ~/utilities
  git clone https://github.com/creationix/nvm ~/utilities/nvm
  bash ~/utilities/nvm/install.sh
else
  git -C ~/utilities/nvm pull
fi

export NVM_DIR="$HOME/utilities/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
nvm install --lts --latest-npm




vim +PluginInstall +qall

# Setting up plugins that require more than vundle
python ~/.vim/bundle/YouCompleteMe/install.py

# Linking all necessary files to home
ln -s vimrc ~/.vimrc
ln -s tmux.conf ~/.tmux.conf
ln -s bashrc ~/.bashrc
ln -s dir_colors ~/.dir_colors
