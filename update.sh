#!/bin/sh
set -e

git br -D base || true
git br -D local || true
git br -D remote || true

git checkout -b base
git rm -r template

for example in [0-9]* ; do
  cp $example/base tmpfile
  git rm -r $example
  mv tmpfile $example.txt
  git add $example.txt
done

git commit --amend -m "base commit"

for ctype in remote local ; do
  git checkout -b $ctype base

  for example in [0-9]* ; do
    git show source:${example%.txt}/$ctype > $example
    git add $example
  done

  git commit -m "$ctype commit"
done
