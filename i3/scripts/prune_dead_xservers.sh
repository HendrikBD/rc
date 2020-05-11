#!/bin/bash

get_xephyr_windows() {
  xephyr_windows=`i3-msg -t get_tree | grep "Xephyr" | sed 's/.*Xephyr on ://g' | sed 's/\..*//g'`
  echo $xephyr_windows
}

get_xephyr_servers() {

  x_servers=`ps aux |\
    grep "Xephyr :.*ac" |\
    sed -rn 's/.*Xephyr\ ://p' |\
    sed -rn 's/\ -ac.*//p' |\
    tr " " "\n" |\
    sort -nu`

  echo $x_servers
}

get_headless_xservers() {
  xephyr_servers=`get_xephyr_servers`
  xephyr_windows=`get_xephyr_windows`
  headless_xservers=`echo $xephyr_windows $xephyr_servers | tr " " "\n" | sort | uniq -u`
  echo $headless_xservers
}

kill_headless_xephyr_servers() {

  headless_xservers=`get_headless_xservers`
  echo $headless_xservers

  for i in ${headless_xservers// / }
  do
    pid=`get_xephyr_pid $i`
    echo $pid
    kill $pid
  done
}

get_xephyr_pid() {

  x_server_details=`ps aux |\
    grep "Xephyr.*$1.*ac" |\
    grep -v "grep"`

  x_server_pid=`echo $x_server_details | awk -F " " '{print $2}'`

  echo $x_server_pid
}

kill_headless_xephyr_servers
