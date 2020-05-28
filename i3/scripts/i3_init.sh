# Keyboard Remapping
xmodmap -e "clear lock" #disable caps lock switch
xmodmap -e "keysym Caps_Lock = Escape" #set caps_lock as escape

# Conky
conky -c $HOME/.config/conky/SimplecOne/conkyrc3 --display=:1 -x -1920 -y 0
conky -c $HOME/.config/conky/SimplecOne/conkyrc4 --display=:1 -x -1520 -y 20
