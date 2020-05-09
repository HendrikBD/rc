get_next_xephyr_session() {

  x_servers=`get_xephyr_servers`

  prev_x_server=`echo $x_servers |\
    awk -F " " '{print $NF}'`

  next_x_server=`expr $prev_x_server + 1`

  Xephyr :$next_x_server -ac -screen 460x340 &> /dev/null &
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

next_xephyr_session=`get_next_xephyr_session`

eval `Xephyr :${next_x_server} -ac -screen 460x340 &> /dev/null &`
