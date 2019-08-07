#!/usr/bin/env bash
set -eau

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

. "${SOURCE_DIR}/gitlib/base.sh"

[ -d test ] && rm -rf test

git init test
cd test
echo a>a.txt
git add *
git commit -m c1
echo b>a.txt
git add *
git commit -m c2
echo c>a.txt
git add *
git commit -m c3

git --no-pager log --pretty=oneline

#squash
git reset --soft HEAD~2
git commit -m c23 

# check with log
git --no-pager log --pretty=oneline



