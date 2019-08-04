#!/usr/bin/env bash

# Seed the random.
RANDOM=$$
COMMITID=0

clearRepos() {
  rm -rf test || .
}

makeChange() {
  # sleep 0.5
  echo ${RANDOM}>a${RANDOM}.txt
  git add *
  let "COMMITID += 1"
  git commit -m c${COMMITID}
  git log
}

createRepos() {
  clearRepos
  git init test
  cd test
  git config core.pager cat
  makeChange
  git log
}

getBranchList() {
  git for-each-ref --format='%(refname:short)' refs/heads/dev/* refs/heads/*
}


split() {
  NEWBRANCH1=b${RANDOM}
  NEWBRANCH2=b${RANDOM}
  git branch $NEWBRANCH1
  git branch $NEWBRANCH2
  makeChange
  git checkout $NEWBRANCH1
  makeChange
}

