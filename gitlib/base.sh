#!/usr/bin/env bash

clearRepos() {
  rm -rf test || .
}

createRepos() {
  clearRepos
  git init test
  cd test
  echo coucou>a.txt
  git add *
  git commit -m c1
  git log
}
