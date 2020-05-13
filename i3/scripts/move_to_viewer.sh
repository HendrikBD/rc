get_focus_window() {
  focus_window=`xdotool getwindowfocus`
  echo $focus_window
}

move() {
  focus_window=`get_focus_window`
  WIDTH=800
  HEIGHT=500
  X=1050
  Y=500
  xdotool windowmove $focus_window $X $Y
  xdotool windowsize $focus_window $WIDTH $HEIGHT
}

DISPLAY=:1
move
