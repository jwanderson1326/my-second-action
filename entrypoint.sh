#!/bin/bash

echo $GITHUB_EVENT_NAME

if [[ $GITHUB_EVENT_NAME == "push" ]]; then
  export SHA=$GITHUB_SHA
  export REF=$GITHUB_REF
elif [[ $GITHUB_EVENT_NAME == 'pull_request' ]]; then
  cat $GITHUB_EVENT_PATH
  echo $GITHUB_SHA
fi
