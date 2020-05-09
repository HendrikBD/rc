#!/bin/bash
get_xephyr_servers() {
  x_servers=`ps e -u username | sed -rn 's/.* DISPLAY=(:[0-9]*).*/\1/p'`
  echo $x_servers > ~/.test/test_`date +%s`
}

get_xephyr_windows() {
  echo test
}

touch /home/bhd/.time/timestamp_`date +%s`
echo 'hello?'

get_xephyr_servers
