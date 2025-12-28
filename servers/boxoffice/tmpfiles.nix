{
  config,
  lib,
  pkgs,
  ...
}:

{
  systemd.tmpfiles.rules = [
    "d /var/lib/unpackerr 0750 unpackerr download -"
    "d /var/lib/qbittorrent 0750 qbittorrent download -"
    "d /var/lib/jellyseerr 0750 media media -"
    "d /var/lib/jellyseerr/config 0750 media media -"
    "d /var/lib/wizarr 0750 media media -"
    "d /var/lib/wizarr/storage 0750 media media -"
    "d /var/lib/wizarr/db 0750 media media -"
    "d /var/lib/jellyseerr 0750 media media -"
    "d /var/lib/jellyserr/config 0750 media media -"
    "d /data 0755 root root -"
    "d /data/torrents 0770 media download -"
    "d /data/torrents/books 0770 media download -"
    "d /data/torrents/movies 0770 media download -"
    "d /data/torrents/music 0770 media download -"
    "d /data/torrents/tv 0770 media download -"
    "d /data/media 0770 media download -"
    "d /data/media/books 0770 media download -"
    "d /data/media/movies 0770 media download -"
    "d /data/media/music 0770 media download -"
    "d /data/media/tv 0770 media download -"
  ];
}
