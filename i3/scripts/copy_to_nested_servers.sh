#!/bin/bash

get_xservers() {

  x_servers=`ps aux |\
    grep "Xephyr :.*ac" |\
    sed -rn 's/.*Xephyr\ ://p' |\
    sed -rn 's/\ -ac.*//p' |\
    tr " " "\n" |\
    sort -nu`

  echo $x_servers
}

copy_to_nested_xservers() {
  xservers=`get_xservers`
  for i in ${xservers// / }
  do
    xclip -selection clip -o -display :1 | xclip -selection clip -i -display :$i
  done
}

copy_to_nested_xservers
