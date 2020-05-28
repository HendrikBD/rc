#!/bin/bash

get_next_xephyr_session() {

  x_servers=`get_xservers`

  prev_x_server=`echo $x_servers | awk -F " " '{print $NF}'`

  if [ -z $prev_x_server ]
  then
    next_x_server=3
  else
    next_x_server=`expr $prev_x_server + 1`
  fi

  echo $next_x_server
}

get_xservers() {

  x_servers=`ps aux |\
    grep "Xephyr :.*ac" |\
    sed -rn 's/.*Xephyr\ ://p' |\
    sed -rn 's/\ -ac.*//p' |\
    tr " " "\n" |\
    sort -nu`

  echo $x_servers
}

launch_browser_server() {

  next_xephyr_session=`get_next_xephyr_session`
  Xephyr :$next_xephyr_session -ac -screen 800x500 -fullscreen &> /dev/null &
  DISPLAY=:$next_xephyr_session
  chromium-browser -new-instance &
  sleep 0.1
  update_xephyr_position

}

update_xephyr_position() {
  DISPLAY=:1
  xephyr_window=`get_xephyr_windows`
  ((`echo $xephyr_window | wc -l` == 1)) && move `echo $xephyr_window | head -n 1`
}

get_xephyr_windows() {
  DISPLAY=:1
  xephyr_windows=`xdotool search --classname xephyr`
  echo $xephyr_windows
}

move() {
  xephyr_window=$1
  WIDTH=800
  HEIGHT=500
  X=1050
  Y=500
  xdotool windowmove $xephyr_window $X $Y
  xdotool windowsize $xephyr_window $WIDTH $HEIGHT
}


launch_large_browser_xserver() {

  next_xephyr_session=`get_next_xephyr_session`
  Xephyr :$next_xephyr_session -ac -screen 1820x900 &> /dev/null &

}

# launch_large_browser_xserver
launch_browser_server
