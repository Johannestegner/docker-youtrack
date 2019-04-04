FROM openjdk:8-jre-alpine
LABEL maintainer="Johannes Tegnér <johannes@jitesoft.com>"
ARG YOUTRACK_VERSION="2019.1.50916"
ENV PORT=8080

WORKDIR /
ADD startup.sh /startup.sh
ADD healthcheck.sh /healthcheck.sh
# Using the zip installation for the ability to use an external hub if wanted.
RUN apk add --no-cache --virtual .trash curl unzip && \
    curl -OLsS https://download.jetbrains.com/charisma/youtrack-$YOUTRACK_VERSION.zip && \
    unzip youtrack-$YOUTRACK_VERSION.zip && \
    rm youtrack-$YOUTRACK_VERSION.zip && \
    mv youtrack-* youtrack && \
    apk del .trash && \
    chmod +x /startup.sh && \
    chmod +x /healthcheck.sh

VOLUME ["/youtrack/logs", "/youtrack/backups", "/youtrack/logs", "/youtrack/data"]
HEALTHCHECK --interval=2m --timeout=5s CMD /healthcheck.sh
CMD ["/startup.sh"]