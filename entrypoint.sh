#!/bin/bash

echo $GITHUB_EVENT_NAME
cat $GITHUB_EVENT_PATH

if [[ $GITHUB_EVENT_NAME == "push" ]]; then
  export SHA=$(cat $GITHUB_EVENT_PATH | jq '.after')
  echo $SHA
  echo $GITHUB_SHA
  echo $GITHUB_REF
elif [[ $GITHUB_EVENT_NAME != 'push' ]]; then
  echo 'Hello'
fi
