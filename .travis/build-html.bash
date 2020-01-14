#!/usr/bin/env bash

set -eu

./scripts/apply_git_log_as_lastmodified_date.sh
JEKYLL_ENV=production bundle exec jekyll build
bundle exec htmlproofer --url-ignore "/#.*/,/tofuconf.club/.*/" ./_site
