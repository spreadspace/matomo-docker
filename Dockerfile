FROM piwik:3.3.0-fpm
MAINTAINER Christian Pointner <equinox@spreadspace.org>

RUN set -x \
    && sed '/chown/d' -i /entrypoint.sh

RUN adduser --home /srv --no-create-home --system --uid 998 --group app

USER app
