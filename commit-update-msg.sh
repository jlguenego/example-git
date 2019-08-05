#!/usr/bin/env bash
set -eau

[ -d test ] && rm -rf test

{
  git init test
  cd test
  echo "Hello World">a.txt
  git add -A
  git commit -m c1
} >/dev/null
git log

# Changing the message
git commit --amend -m c111
git log

# Changing the content
echo "Bonjour">b.txt
git add b.txt
git commit --amend -m c111
git log -p
