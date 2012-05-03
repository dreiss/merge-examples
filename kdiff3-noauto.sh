#!/bin/sh

# To install, put this in your ~/.gitconfig
#[merge]
#  tool = kdiff3noauto
#[mergetool "kdiff3noauto"]
#  cmd = "kdiff3-noauto.sh $BASE $LOCAL $REMOTE $MERGED"
#  TrustExitCode = true

exec kdiff3 \
  --L1 "$4 (Base)" \
  --L2 "$4 (Local)" \
  --L3 "$4 (Remote)" \
  -o "$4" \
  "$1" "$2" "$3"
