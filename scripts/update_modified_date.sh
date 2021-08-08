#!/usr/bin/env bash
set -eu

LASTMODIFY=$(date '+%Y-%m-%dT%H:%M:%S%z' | sed -E 's/0900$/09:00/g')

echo "$1 ($LASTMODIFY)"
sed -E 's/last_modified_at: [0-9]{4}-.*\+[0-9]{2}:[0-9]{2}/last_modified_at: '$LASTMODIFY'/g' $1 > /tmp/temp.md
cp /tmp/temp.md $1

# 使用例
# $ ./update_modified_date.sh ../_posts/2021-08-07-11th-tofuconf-general.md