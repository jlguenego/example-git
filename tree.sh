#!/usr/bin/env bash
set -eau

rm -rf test ||.

{
  git init test
  cd test
  echo "Hello World">a.txt
  echo "What's up?">b.txt
  mkdir hello
  echo "Coucou">hello/c.txt
  git add -A
  git commit -m c1
} >/dev/null


git ls-tree c01d
exit 0
