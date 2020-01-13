#!/bin/bash

git config user.name circle-bot
git config user.email isman.usoh@gmail.com

# lerna publish --yes --canary --preid dev
# lerna publish --yes --canary --preid uat

case $CIRCLE_BRANCH in
master)
  case $GIT_COMMIT_MSG in
  \[FEATURE\]*)
    Message="Master Feature";;
  \[FIXED\]*)
    lerna 
    Message="Master Fixed";;
  *)
    Message="Master Fixed";;
  esac
  ;;
*)
  Message="Default";;
esac

echo $Message

# case $GIT_COMMIT_MSG in
# \[FEATURE\]*)
#   Message="Publish Feature to PROD";;
# \[FIXED\]*)
#   Message="Publish Feature to PROD";;
# *)
# esac