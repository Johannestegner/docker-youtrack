FROM openjdk:8-jre-alpine
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>"
ARG VERSION="2019.1.50916"
ENV PORT=8080 \
    PUBLIC_URI="http://127.0.0.1:8080"

WORKDIR /
ADD startup.sh /startup.sh
ADD healthcheck.sh /healthcheck.sh
# Using the zip installation for the ability to use an external hub if wanted.
RUN apk add --no-cache --virtual .trash curl unzip && \
    curl -OLsS https://download.jetbrains.com/charisma/youtrack-${VERSION}.zip && \
    curl -OLsS https://download.jetbrains.com/charisma/youtrack-${VERSION}.zip.sha256 && \
    grep "youtrack-${VERSION}.zip\$" youtrack-${VERSION}.zip.sha256 | sha256sum -c - && \
    unzip youtrack-${VERSION}.zip && \
    rm youtrack-${VERSION}.zip && \
    rm youtrack-${VERSION}.zip.sha256 && \
    mv youtrack-* youtrack && \
    apk del .trash && \
    chmod +x /startup.sh && \
    chmod +x /healthcheck.sh

VOLUME ["/youtrack/logs", "/youtrack/backups", "/youtrack/logs", "/youtrack/data"]
HEALTHCHECK --interval=2m --timeout=5s CMD /healthcheck.sh
CMD ["/startup.sh"]