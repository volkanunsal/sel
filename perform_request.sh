#!/usr/bin/env sh

./start_server.sh
COUNTER=0
REMOTE_STATUS="${SELENIUM_REMOTE_URL}/status"
echo "Waiting for ${REMOTE_STATUS} to become available"
until wget --spider -q "${REMOTE_STATUS}" &>/dev/null; do
  printf "."
  sleep 1
  COUNTER=$((COUNTER + 1))
  if [ $COUNTER -eq 30 ] ; then
    echo "✘"
    exit 1
  fi
done
echo "✔"
ruby perform_request.rb