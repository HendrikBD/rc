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
  Xephyr :$next_xephyr_session -ac -screen 800x500 &> /dev/null &
  echo $next_xephyr_session > ~/.test/test
  DISPLAY=:$next_xephyr_session
  chromium-browser

}


launch_large_browser_xserver() {

  next_xephyr_session=`get_next_xephyr_session`
  Xephyr :$next_xephyr_session -ac -screen 1820x900 &> /dev/null &

}

# launch_large_browser_xserver
launch_browser_server
