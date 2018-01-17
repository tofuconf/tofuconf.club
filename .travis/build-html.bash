#!/usr/bin/env bash

set -eu

bundle exec jekyll build
bundle exec htmlproofer ./docs
