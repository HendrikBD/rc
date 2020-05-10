
# DISPLAY=:1
# termbg_window=`xdotool search --classname termbg | head -n 1`
# echo $termbg_window > ~/.test/test


get_termbg_windows() {
  termbg_windows=`xdotool search --classname termbg`
  echo $termbg_windows
}

update_termbg_position() {
  termbg_windows=`get_termbg_windows`
  ((`echo $termbg_windows | wc -l` == 1)) && move_termbg `echo $termbg_windows | head -n 1`
}

move_termbg() {
  WIDTH=840
  HEIGHT=680
  X=20
  Y=350
  termbg_window=$1
  xdotool windowmove $termbg_window $X $Y
  xdotool windowsize $termbg_window $WIDTH $HEIGHT
}

urxvt -bg [40]#141c21 -name termbg &
sleep 0.1

update_termbg_position
