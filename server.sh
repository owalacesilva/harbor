#!/bin/bash

checkIfPidExist() {
  if [ -f "$1" ]; then
    rm -rf "$1"
  fi
}

checkIfPidExist "tmp/pids/server.pid"

bundle exec rails server -b 0.0.0.0
