#!/usr/bin/env bash
set -eu

REPO_DIR=$(cd $(dirname ${BASH_SOURCE:-$0}); pwd)/../

cd $REPO_DIR
bundle install --path vendor/bundle
