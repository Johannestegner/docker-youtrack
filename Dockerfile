FROM openjdk:7-jdk-alpine
MAINTAINER Johannes Tegnér <johannes@jitesoft.com>

ENV YOUTRACK_VERSION=7.0.28450

# Using the zip installation for the ability to use an external hub if wanted.
RUN apk add --update wget unzip bash && \
    rm -rf /var/cahce/apk/* && \
    wget https://download.jetbrains.com/charisma/youtrack-$YOUTRACK_VERSION.zip -O youtrack.zip && \
    unzip youtrack.zip && \
    rm youtrack.zip && \
    mv youtrack-* youtrack

EXPOSE 8080
CMD ["/bin/bash", "-c", "youtrack/bin/youtrack.sh run"]
