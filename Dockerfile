FROM nginx:alpine

RUN apk add --no-cache gettext

COPY index.html.template global.css style.css /usr/share/nginx/html/
COPY assets /usr/share/nginx/html/assets
COPY *.png /usr/share/nginx/html/
COPY docker-entrypoint.sh /docker-entrypoint.sh

RUN chmod +x /docker-entrypoint.sh \
  && rm -f /usr/share/nginx/html/index.html

ENTRYPOINT ["/docker-entrypoint.sh"]
