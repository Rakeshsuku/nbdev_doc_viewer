#!/bin/bash

cd /repo/docs
bundle install
bundle exec jekyll serve --livereload --host 0.0.0.0