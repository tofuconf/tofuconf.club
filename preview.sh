#!/usr/bin/env bash
set -eu

if $(bundle > /dev/null 2>&1) ; then
    if $(bundle exec jekyll > /dev/null 2>&1) ; then
        bundle exec jekyll serve --config _config.yml --host='127.0.0.1'  --trace
    else
        bundle install --path vendor/bundle
        bundle exec jekyll serve --config _config.yml --host='127.0.0.1'  --trace
    fi
else
    JEKYLL_VERSION=4.3.2
    docker run --rm \
    --volume="$PWD:/srv/jekyll" \
    -p 4000:4000 \
    -it tiryoh/jekyll:$JEKYLL_VERSION \
    jekyll serve --config _config.yml
fi
