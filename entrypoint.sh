#!/bin/bash

if [[ $GITHUB_EVENT_NAME = 'push' ]] && [[ $GITHUB_REF == '/refs/heads/main']]
then
  export GITCOMMIT=$(cat $GITHUB_EVENT_PATH | jq '.head_commit.id')
  export GITBRANCH=master
  echo 'A PUSH TO MASTER!'
elif [[ $GITHUB_EVENT_NAME = 'push' ]] && [[ $GITHUB_REF != '/refs/heads/main']]
  echo 'Hello'
fi
