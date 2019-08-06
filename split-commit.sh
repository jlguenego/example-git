#!/usr/bin/env bash
set -eau

[ -d test ] && rm -rf test

git init test
cd test

touch a.txt
git add *
git commit -m "init"

echo a>a.txt
echo b>b.txt
echo c>c.txt
git add *
git commit -m "this should be split."

git log --oneline

