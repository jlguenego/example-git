#!/usr/bin/env bash
set -eau

rm -rf test ||.

{
  git init test
  cd test
  echo "Hello World">a.txt
  git add -A
  git commit -m c1
} >/dev/null
git log

git commit --amend -m c111
git log
