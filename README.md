# Docker containers for Plex Media Server with Remote Transcoding Support (NFS slave)

This is an auxiliary slave image for [Docker containers for Plex Media Server with Remote Transcoding Support](https://github.com/deevus/docker-plex-remote-transcoder) that adds NFS support __inside__ the container.

## Why?

If you're using Docker on Windows, you can't mount network volumes into a container. This image includes an NFS client so that you can get around this problem.

## Usage

```
docker run \
--name plex-slave \
-p 22:22 \
-e TZ="<timezone>" \
-e MASTER_IP="<hostIPAddress>" \
-e NFS_SERVER="<nfsIPAddress>" \
-e NFS_MOUNTS="</path/to/src:/path/to/target>" \
--privileged \
deevus/plex-remote-transcoder-nfs:slave-latest
```

## Parameters

- `--privileged` this is required so that docker can mount the NFS volumes
- `NFS_SERVER` the ip address (or hostname) of the NFS server
- `NFS_MOUNTS` a space delimited string of mounts in the form `/path/to/src:/path/to/target`
- Other parameters are explained in the [main repository](https://github.com/deevus/docker-plex-remote-transcoder)
