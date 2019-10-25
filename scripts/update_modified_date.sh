#!/usr/bin/env bash
set -eu

LASTMODIFY=$(date '+%Y-%m-%dT%H:%M:%S%z' | sed -E 's/0900$/09:00/g')

echo $LASTMODIFY
echo $1
sed -E 's/last_modified_at: [0-9]{4}-.*\+[0-9]{2}:[0-9]{2}/last_modified_at: '$LASTMODIFY'/g' $1 > /tmp/temp.md
cp /tmp/temp.md $1
