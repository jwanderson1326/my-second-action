#!/bin/bash

echo $GITHUB_EVENT_NAME

if [[ $GITHUB_EVENT_NAME == "push" ]]; then
  echo "It's a push!"
  export SHA=$GITHUB_SHA
  export REF=$GITHUB_REF
elif [[ $GITHUB_EVENT_NAME == 'pull_request' ]]; then
  echo "It's a pull request!"
  export SHA=$(cat $GITHUB_EVENT_PATH | jq -r '.pull_request.head.sha')
  export REF=$GITHUB_REF
elif [[ $GITHUB_EVENT_NAME == 'issue_comment' ]]; then
  echo "It's an issue_comment!"
  cat $GITHUB_EVENT_PATH
  echo $GITHUB_REF
  echo $GITHUB_SHA
  # export SHA=$(cat $GITHUB_EVENT_PATH | jq -r '.pull_request.head.sha')
  # export REF=$GITHUB_REF
fi
