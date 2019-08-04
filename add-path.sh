#!/usr/bin/env bash
ARGU="$_"
set -eau

# NOTE : Run this script by sourcing it.
if [[ $ARGU == $0 ]]; then
  echo "Run this script by sourcing it: . $(basename "$0")"
  exit 0
fi


SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

if [[ $PATH == *"${SOURCE_DIR}"* ]]; then
  echo "Already added."
  return 0
fi

PATH="${PATH}:${SOURCE_DIR}"

echo "Path ${SOURCE_DIR} added."
return 0
