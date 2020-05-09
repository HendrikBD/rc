get_next_xephyr_session() {
  echo 'test'
}

Xephyr :2 -ac -screen 460x340 &> /dev/null &
