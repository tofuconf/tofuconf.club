#!/usr/bin/env bash
set -eu

SRC_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); cd ../; pwd)

# scripts for contents published before 2019/12/31
for FILE in $(git ls-files _posts/201*)
do
	FILECREATED=$(git log --date=iso --format=%ad $FILE | tail -n1 | sed -E "s/([0-9]{4}-[0-9]{2}-[0-9]{2}) ([0-9]{2}:[0-9]{2}:[0-9]{2}) (\+[0-9]{2})([0-9]{2})/\1T\2\3:\4/")
	LASTMODIFY=$(git log -1 --format=%ci $FILE | sed -E "s/([0-9]{4}-[0-9]{2}-[0-9]{2}) ([0-9]{2}:[0-9]{2}:[0-9]{2}) (\+[0-9]{2})([0-9]{2})/\1T\2\3:\4/")
	echo "$FILE ($FILECREATED -> $LASTMODIFY)"
	sed -E 's/last_modified_at: [0-9]{4}-.*\+[0-9]{2}:[0-9]{2}/last_modified_at: '$LASTMODIFY'/g' $FILE > /tmp/temp.md
	cp /tmp/temp.md $FILE
done

# scripts for contents published after 2020/1/1
for FILE in $(git ls-files _posts/202*)
do
	FILECREATED=$(git log --date=iso --format=%ad $FILE | tail -n1 | sed -E "s/([0-9]{4}-[0-9]{2}-[0-9]{2}) ([0-9]{2}:[0-9]{2}:[0-9]{2}) (\+[0-9]{2})([0-9]{2})/\1T\2\3:\4/")
	LASTMODIFY=$(git log -1 --format=%ci $FILE | sed -E "s/([0-9]{4}-[0-9]{2}-[0-9]{2}) ([0-9]{2}:[0-9]{2}:[0-9]{2}) (\+[0-9]{2})([0-9]{2})/\1T\2\3:\4/")
	echo "$FILE ($FILECREATED -> $LASTMODIFY)"
	sed -E 's/date: [0-9]{4}-.*\+[0-9]{2}:[0-9]{2}/date: '$FILECREATED'/g' $FILE > /tmp/temp.md
	cp /tmp/temp.md $FILE
	sed -E 's/last_modified_at: [0-9]{4}-.*\+[0-9]{2}:[0-9]{2}/last_modified_at: '$LASTMODIFY'/g' $FILE > /tmp/temp.md
	cp /tmp/temp.md $FILE
done

