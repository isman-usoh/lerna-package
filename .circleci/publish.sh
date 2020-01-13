#!/bin/bash

git config user.name circle-bot
git config user.email isman.usoh@gmail.com

# lerna publish --yes --canary --preid dev
# lerna publish --yes --canary --preid uat

case $GIT_COMMIT_MSG in
\[FEATURE\]*)
  case $CIRCLE_BRANCH in
  master)
    Message="Publish Feature to PROD";;
  uat)
    Message="Publish Feature to UAT";;
  *)
    Message="Publish Feature to DEV";;
  esac;;
\[FIXED\]*)
  case $CIRCLE_BRANCH in
  master)
    Message="Publish Fixed to PROD";;
  uat)
    Message="Publish Fixed to UAT";;
  *)
    Message="Publish Fixed to DEV";;
  esac;;
*)
  case $CIRCLE_BRANCH in
  master)
    Message="Publish Default to PROD";;
  uat)
    Message="Publish Default to UAT";;
  *)
    Message="Publish Default to DEV";;
  esac;;
esac
echo $Message
