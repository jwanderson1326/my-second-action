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
  echo $SHA
  echo $REF
elif [[ $GITHUB_EVENT_NAME == 'issue_comment' ]]; then
  echo "It's an issue_comment!"
  PR_URL=$(cat $GITHUB_EVENT_PATH | jq -r '.issue.pull_request.url')
  ISSUE_NUMBER=$(cat $GITHUB_EVENT_PATH | jq -r '.issue.number')
  export SHA=$(curl -u jwanderson1326:$INPUT_TOKEN $PR_URL | jq -r '.head.sha')
  export REF="/refs/pull/$ISSUE_NUMBER/merge"
  echo $SHA
  echo $REF
fi
