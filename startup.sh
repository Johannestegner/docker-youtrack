#!/bin/ash

echo "Configuring startup, setting installation to skip wizard and to run on ${PUBLIC_URI}, internal port: ${PORT}."
/youtrack/bin/youtrack.sh configure --base-url=http://0.0.0.0 --base-url=${PUBLIC_URI} --listen-port=${PORT} -J-Ddisable.configuration.wizard.on.clean.install=true

echo "Starting Jetbrains YouTrack."
/youtrack/bin/youtrack.sh run --no-browser