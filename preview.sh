#!/usr/bin/env bash
set -eu

if $(command -v bundle> /dev/null 2>&1) ; then
    if $(command -v bundle exec jekyll > /dev/null 2>&1) ; then
        bundle exec jekyll serve --config _config.yml --host='127.0.0.1'
    else
        bundle install --path vendor/bundle
        bundle exec jekyll serve --config _config.yml --host='127.0.0.1'
    fi
else
    JEKYLL_VERSION=3.8
    docker run --rm \
    --volume="$PWD:/srv/jekyll" \
    -p 4000:4000 \
    -it jekyll/jekyll:$JEKYLL_VERSION \
    jekyll serve --config _config.yml
fi
