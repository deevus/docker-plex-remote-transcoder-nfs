FROM deevus/plex-remote-transcoder:slave-public

ENV NFS_SERVER=$MASTER_IP \
    NFS_MOUNTS=""

RUN apt-get update -qq && apt-get install -y nfs-common inotify-tools -qq

COPY root /