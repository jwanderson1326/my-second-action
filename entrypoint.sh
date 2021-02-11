#!/bin/bash

echo $GITHUB_EVENT_NAME

if [[ $GITHUB_EVENT_NAME == "push" ]]; then
  export SHA=$GITHUB_SHA
  export REF=$GITHUB_REF
elif [[ $GITHUB_EVENT_NAME == 'pull_request' ]]; then
  echo "It's a pull request!"
  export SHA=$(cat $GITHUB_EVENT_PATH | jq -r '.pull_request.head.sha')
  echo $SHA
  echo $GITHUB_REF
fi
