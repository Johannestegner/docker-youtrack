# Youtrack docker image.

Docker image for jetbrains youtrack using the zip version (which in turn enables external hub connection).
The image is based on **Alpine linux** using **OpenJDK**.

## Youtrack Version

Check the Dockerfile `YOUTRACK_VERSION` environment variable to check which version is running on the latest branch.  
The version is updated as soon as possible after a new version of youtrack is released.  

## Persist data

To persist `data` directory or `backup` directory add `/youtrack/data` and/or `/youtrack/backup` as volumes.

## Port

Port `8080` is used by youtrack and is exposed.
