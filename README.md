docker sonarr

This is a Dockerfile setup for nzbdrone - http://sonarr.tv

To run:

```
docker run -d --name="nzbdrone" -v /path/to/config:/config -v /path/to/downloads:/downloads -v /path/to/tv/shows:/tv -v /etc/localtime:/etc/localtime:ro -p 8989:8989 needo/nzbdrone
```
