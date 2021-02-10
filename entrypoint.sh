#!/bin/bash

echo $GITHUB_EVENT_NAME
cat $GITHUB_EVENT_PATH

if [[ $GITHUB_EVENT_NAME == "push" ]]; then
  echo 'A PUSH TO MASTER!'
elif [[ $GITHUB_EVENT_NAME != 'push' ]]; then
  echo 'Hello'
fi
