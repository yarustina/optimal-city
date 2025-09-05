#!/bin/bash
set -e

: "${SECRET_KEY_BASE:=$(ruby -e 'require "securerandom"; puts SecureRandom.hex(64)')}"

export PATH=/usr/local/bundle/bin:$PATH

bundle exec bin/rails db:migrate
exec bundle exec bin/rails s -b 0.0.0.0 -p "${PORT}"
