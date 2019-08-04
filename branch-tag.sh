#!/usr/bin/env bash
set -eau

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

. "${SOURCE_DIR}/gitlib/base.sh"

clearRepos

git init test
cd test

echo a>a.txt
git add *
git commit -m c1

echo b>a.txt
git add *
git commit -m c2

git tag v1

echo c>a.txt
git add *
git commit -m c3

echo d>a.txt
git add *
git commit -m c4

git tag v2

git --no-pager log --pretty=oneline

# create orphan branch topic
git checkout --orphan topic
git checkout v1 .
git commit -m v1
git checkout v2 .
git commit -m v2

# check with log
git --no-pager log --pretty=oneline



