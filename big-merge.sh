#!/usr/bin/env bash
set -eau

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

. "${SOURCE_DIR}/gitlib/base.sh"


createRepos




