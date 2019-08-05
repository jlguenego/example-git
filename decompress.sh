#!/usr/bin/env bash
set -eau

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

. "${SOURCE_DIR}/gitlib/base.sh"

rm -rf test ||.

git init test
cd test
echo "Hello World">a.txt
git add *

{ RESULT="$(openssl zlib -d < ./.git/objects/55/7db03de997c86a4a028e1ebd3a1ceb225be238)"; } 2>/dev/null
EXPECTED="blob 12Hello World"
if [ "${RESULT}" != "${EXPECTED}" ]; then
  echo "Failed."
  exit 1
fi
echo "Success !!!"
exit 0
