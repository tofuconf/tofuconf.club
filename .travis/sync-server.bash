#!/usr/bin/env bash

set -eu

TARGET_DIR=$(cd "$(dirname "$0")"; cd ../_site; pwd)

rsync -apzv --dry-run --exclude="CNAME" --exclude="renovate.json" --exclude="minimal-mistakes-jekyll.gemspec" --exclude-from=<(git ls-files --others --exclude-standard) "${TARGET_DIR}/" "travis@tofuconf.club:/var/www/html"
