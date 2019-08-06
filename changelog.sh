#!/usr/bin/env bash
set -eau

HEADER="
# Change Log

"

changelog() {
  version="$1"
  previous_version="${2:-}"
  [[ $previous_version = "" ]] && double_dot="" || double_dot=".."
  REST="$(cat CHANGELOG.md | tail -n +2)"
  git tag "${version}"
  cat >CHANGELOG.md <<EOF
# Change Log

## ${version}
$(git log --pretty=format:'- %s' --reverse ${previous_version}${double_dot}${version})

${REST}
EOF
  
}

[ -d test ] && rm -rf test

git init test
cd test

touch CHANGELOG.md
git add *
git commit -m "init"

changelog "v0.0.1"

echo a>a.txt
git add *
git commit -m "issue #1234: adding a to a.txt"

echo b>a.txt
git add *
git commit -m "issue #1235: adding b to a.txt

With a text that should not appear in the changelog
"

echo c>a.txt
git add *
git commit -m "issue #1236: adding c to a.txt"

changelog "v0.0.2" "v0.0.1"

set -x
cat CHANGELOG.md



