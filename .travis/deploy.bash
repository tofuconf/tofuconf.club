#!/usr/bin/env bash

TARGET_DIR=$(cd "$(dirname "$0")"; cd ../; pwd)

rsync -apz -v --dry-run "${TARGET_DIR}/docs" "travis@tofuconf.club:/var/www/html"
