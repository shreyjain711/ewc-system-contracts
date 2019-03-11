
#!/usr/bin/env bash

ganache_cleanup() {
  if [ -n "$ganache_pid" ] && ps -p $ganache_pid > /dev/null; then
    kill -9 $ganache_pid
  fi
}

ganache_running() {
  nc -z localhost "$1"
}

ganache_start() {
  local accounts=(
    --account="0xabc0000000000000000000000000000000000000000000000000000000001000,1000000000000000000000000"
    --account="0xabc0000000000000000000000000000000000000000000000000000000001001,1000000000000000000000000"
    --account="0xabc0000000000000000000000000000000000000000000000000000000001002,1000000000000000000000000"
    --account="0xabc0000000000000000000000000000000000000000000000000000000001003,1000000000000000000000000"
    --account="0xabc0000000000000000000000000000000000000000000000000000000001004,1000000000000000000000000"
    --account="0xabc0000000000000000000000000000000000000000000000000000000001005,1000000000000000000000000"
    --account="0xabc0000000000000000000000000000000000000000000000000000000001006,1000000000000000000000000"
    --account="0xabc0000000000000000000000000000000000000000000000000000000001007,1000000000000000000000000"
    --account="0xabc0000000000000000000000000000000000000000000000000000000001008,1000000000000000000000000"
    --account="0xabc0000000000000000000000000000000000000000000000000000000001009,1000000000000000000000000"
  )

  # gasLimit is set to 80mil
  npx ganache-cli --gasLimit 0x4C4B400 --port "$1" "${accounts[@]}" > /dev/null &
  ganache_pid=$!
}