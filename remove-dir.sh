#!/usr/bin/env bash
set -eau

# Purpose of this demo is to
# create a repos with a commit chain.
# from commit c2 we create by mistake 
# a directory conf with a password.txt file.

# then we continue to do 3 commits c3 c4 c5.
# At commit c5, we want to rewrite history
# to remove the conf directory.

[ -d test ] && rm -rf test

git init test
cd test

touch a.txt
git add *
git commit -m c1

mkdir conf
echo my-secret > conf/password.txt
git add *
git commit -m c2
echo a>a.txt
git add *
git commit -m c3
echo b>a.txt
git add *
git commit -m c4
echo c>a.txt
git add *
git commit -m c5

git --no-pager log -p
HASH=$(git ls-files -s conf/password.txt | cut -f 2 -d' ')
echo HASH=$HASH
git filter-branch --tree-filter 'rm -rf conf' HEAD
git --no-pager log -p

git cat-file -p ${HASH}

# remove the reference kept by filter-branch backup
git for-each-ref --format="%(refname)" refs/original/ | xargs -n 1 git update-ref -d

# remove the reflog
git reflog expire --expire-unreachable=now --expire=now --all

# and garbage !!!
git gc --prune=now

# should not work.
git cat-file -p ${HASH}
