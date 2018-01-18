#!/usr/bin/env bash

set -eu

JEKYLL_ENV=production bundle exec jekyll build
bundle exec htmlproofer ./docs
