#!/usr/bin/env bash

TARGET_DIR=$(cd "$(dirname "$0")"; cd ../; pwd)

rsync -apzv --exclude="CNAME" "${TARGET_DIR}/docs/" "travis@tofuconf.club:/var/www/html"