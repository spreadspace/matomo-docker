FROM piwik:3.3.0-apache
MAINTAINER Christian Pointner <equinox@spreadspace.org>

RUN set -x \
    && sed '/chown/d' -i /entrypoint.sh \
    && sed 's/^\s*Listen\s\s*80\s*$/Listen 8080/' -i /etc/apache2/ports.conf \
    && sed 's/<\s*VirtualHost\s\s*\*:80\s*>/<VirtualHost *:8080>/' -i /etc/apache2/sites-enabled/*.conf

RUN adduser --home /srv --no-create-home --system --uid 998 --group app

USER app
