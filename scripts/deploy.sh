#!/usr/bin/env bash

set -eu

TARGET_DIR=$(cd "$(dirname "$0")"; cd ../_site; pwd)

rsync -apzv --exclude="CNAME" --exclude="renovate.json" --exclude="*.gemspec" --exclude-from=<(git ls-files --others --exclude-standard) "${TARGET_DIR}/" "travis@tofuconf.club:/var/www/html"
