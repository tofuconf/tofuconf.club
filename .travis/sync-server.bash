#!/usr/bin/env bash

set -eu

TARGET_DIR=$(cd "$(dirname "$0")"; cd ../_site; pwd)

rsync -apzv --exclude="CNAME" "${TARGET_DIR}" "travis@tofuconf.club:/var/www/html"
