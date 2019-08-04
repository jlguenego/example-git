#!/usr/bin/env bash
set -eau

SOURCE_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"

. "${SOURCE_DIR}/gitlib/base.sh"


createRepos

for i in {1..5}
do
   split
done

git co master

BRANCH_LIST=$(getBranchList | grep -v master)
echo "${BRANCH_LIST}"
git merge ${BRANCH_LIST} -m "my_merge"


