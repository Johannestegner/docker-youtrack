# YouTrack docker image.

Docker image for jetbrains YouTrack using the zip version (which in turn enables external hub connection).
The image is based on **Alpine linux** using **OpenJDK**.

Images can be found at [GitLab](https://gitlab.com/jitesoft/dockerfiles/youtrack) and [GitHub](https://github.com/Johannestegner/docker-youtrack)

## Directories worth persisting

The following directories are worth persisting if you wish to store the data even when restarting the 
container:

`/youtrack/data` - The data directory that is used by YouTrack.  
`/youtrack/backups` - Backup directory which backups are stored in.  
`/youtrack/logs` - Logfiles.  
`/youtrack/conf` - Config directory.  

The directories are set as `VOLUMES` in the docker file.

## Ports

Port 8080 is the default port used by YouTrack, if you wish to use
another port for some reason, change the env variable `PORT` to desired value and expose it.


## Initial startup

When starting YouTrack for the first time, the installation will run automatically, you can go to `http://127.0.0.1:8080/starting`
to see the progress. When all is ready, the default administration account have the credentials `admin`/`admin`, I recommend
that you change this as soon as possible!

## External or Internal hub?

After initial startup your YouTrack will use an internal Jetbrains Hub, to migrate to an external hub installation
you have to acquire the AWC token from `/youtrack/data/internal/services/adminService/awcToken.properties`, easiest way
is to cat it from the container:

```bash
docker exec <your-container> cat /youtrack/data/internal/services/adminService/awcToken.properties
```

Then enter the Bundle admin at `http://127.0.0.1:8080/bundle/admin/` and enter the token in the field and follow instructions.

## Tags

Tags are defined by the following standard:

`latest` latest build.  
`year` latest of the `year` builds (i.e., 2019).  
`year.x` latest of the `year-major` builds (i.e., 2019.5).  
`yearh.x.x` latest of the `year.major.minor` builds (i.e., 2019.5.1)
