#!/bin/sh
set -e

: "${GAME_URL:?GAME_URL is required}"
: "${TELEGRAM_URL:?TELEGRAM_URL is required}"

envsubst '${GAME_URL} ${TELEGRAM_URL}' \
  < /usr/share/nginx/html/index.html.template \
  > /usr/share/nginx/html/index.html

exec nginx -g 'daemon off;'
