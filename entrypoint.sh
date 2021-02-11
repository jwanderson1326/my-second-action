#!/bin/bash

echo $GITHUB_EVENT_NAME
cat $GITHUB_EVENT_PATH

if [[ $GITHUB_EVENT_NAME == "push" ]]; then
  export SHA=$GITHUB_SHA
  export REF=$GITHUB_REF
elif [[ $GITHUB_EVENT_NAME == 'pull_request' ]]; then
  cat $GITHUB_EVENT_PATH | jq '.head.sha'
  echo $GITHUB_SHA
fi
