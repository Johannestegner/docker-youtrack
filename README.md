# Youtrack docker image.

Docker image for jetbrains youtrack using the zip version (which in turn enables external hub connection).
The image is based on **Alpine linux** using **OpenJDK**.

## Youtrack Version

The installation of youtrack is by default set to use the `2017.2.32853` version, but this can be altered by changing the `YOUTRACK_VERSION` environment variable to another version on build.

## Persist data

To persist `data` directory or `backup` directory add `/youtrack/data` and/or `/youtrack/backup` as volumes.

## Port

Port `8080` is used by youtrack and is exposed.
