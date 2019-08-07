#!/usr/bin/env bash
set -eau

[ -d test ] && rm -rf test

git init test
cd test

touch a.txt
git add *
git commit -m "init"

git checkout -b topic

echo a>a.txt
echo b>b.txt
echo c>c.txt
git add *
git commit -m "this should be split."

echo d>a.txt
echo d>b.txt
echo d>c.txt
git commit -am "d is now everywhere."
git log --oneline

# take the commit to be split.
COMMIT_SHA1=$(git log HEAD^ | head -1 | cut -f 2 -d' ')

# We could use git rebase -i, 
# but when we script, interactive mode is not easy to manage.
# instead we create a branch
git branch temp

# we still are on topic.
git reset --hard ${COMMIT_SHA1}^

git log --oneline

git checkout ${COMMIT_SHA1} .
git status
git rm --cached -r '*'

git status
git add a.txt
git commit -m "a.txt contains d (split 1)"

git status 
git add b.txt
git commit -m "b.txt contains d (split 1)"

git status
git add c.txt
git commit -m "c.txt contains d (split 1)"

# take all commit between ${COMMIT_SHA1} and temp and add them after topic.
# temp is now at this construction.
# checkout on temp.
git rebase --onto topic ${COMMIT_SHA1} temp
git checkout topic
git merge temp
git branch -d temp
git log --oneline

# Deliver on master (fast forward)
git checkout master
git merge topic
git branch -d topic
git log --oneline
