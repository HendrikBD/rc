#! /bin/bash

while true;
do
  DISPLAY=:1
  ps -e -o pid | pscircle --root-pid=1 --collapse-threads=true --max-children=60 --cpulist-center=300:0 --memlist-center=800:0 --output-height=1080 --output-width=3840 --tree-font-size=10 --tree-radius-increment=60 --background-color=000000 --tree-center=-1580:180 --output=/tmp/pscircle_1 && \
  nitrogen --set-zoom-fill /tmp/pscircle_1
  sleep 3
done
