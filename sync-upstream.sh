#!/bin/sh
set -e
PATHS="mk native/go toolchain/syno-x64-6.2.4 toolchain/syno-x64-7.1 toolchain/syno-aarch64-6.2.4 toolchain/syno-aarch64-7.1"

git fetch upstream master
BASE=$(cat .upstream-base)
NEW=$(git rev-parse upstream/master)
[ "$BASE" = "$NEW" ] && { echo "up to date"; exit 0; }

git diff --binary "$BASE" "$NEW" -- $PATHS | git apply -3 --index
echo "$NEW" > .upstream-base
git add .upstream-base
echo "Review with 'git diff --cached', then: git commit -m 'Sync upstream to $NEW'"
