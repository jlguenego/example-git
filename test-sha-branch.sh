#!/usr/bin/env bash
set -eau

rm -rf test ||.


git init test
cd test
echo a>a.txt
git add -A
git commit -m c1

echo b>a.txt
git commit -am c2

COMMIT_ID=$(git log -1 --pretty=oneline | cut -f 1 -d' ')

echo COMMIT_ID=$COMMIT_ID

git checkout -b $COMMIT_ID
git checkout master
git checkout $COMMIT_ID
# see the warning about ambiguity ? ;)
