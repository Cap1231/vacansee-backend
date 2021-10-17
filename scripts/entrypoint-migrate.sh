#!/bin/sh

DISABLE_SPRING=1 bundle exec rails db:create RAILS_ENV=production
DISABLE_SPRING=1 bundle exec rails db:migrate RAILS_ENV=production
