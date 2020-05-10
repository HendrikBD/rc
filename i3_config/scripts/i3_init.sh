# Keyboard
xmodmap -e "clear lock" #disable caps lock switch
xmodmap -e "keysym Caps_Lock = Escape" #set caps_lock as escape

# Conky
conky -c $HOME/.conky/SimplecOne/conkyrc3 --display=:1 -x -1920 -y -10
conky -c $HOME/.conky/SimplecOne/conkyrc4 --display=:1
