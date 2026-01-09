{
  config,
  lib,
  pkgs,
  ...
}:

let
  jellyseerrImage = "ghcr.io/fallenbagel/jellyseerr:latest";
  wizarrImage = "ghcr.io/wizarrrr/wizarr:latest";
in
{
  systemd.services = {
    jellyseerr-docker = {
      description = "jellyseerr docker image";
      after = [
        "docker.service"
        "network-online.target"
      ];
      wants = [
        "docker.service"
        "network-online.target"
      ];
      wantedBy = [
        "multi-user.target"
      ];

      serviceConfig = {
        ExecStart = "${pkgs.docker}/bin/docker run --name jellyseerr --rm --init -p 5055:5055 -e LOG_LEVEL=info -e TZ=America/Chicago -e PORT=5055 -v /var/lib/jellyseerr/config:/app/config ${jellyseerrImage}";
        ExecStop = "${pkgs.docker}/bin/docker stop jellyseerr";
        Restart = "on-failure";
        RestartSec = 5;
      };
    };

    unpackerr = {
      description = "unpackerr daemon";
      wants = [ "network-online.target" ];
      after = [ "network-online.target" ];
      wantedBy = [ "multi-user.target" ];
      environment = {
        UN_WEBSERVER_HTTP_ADDR = "0.0.0.0:5656";
      };

      serviceConfig = {
        Type = "simple";
        User = "unpackerr";
        Group = "download";
        ExecStart = "${pkgs.unpackerr}/bin/unpackerr --config /var/lib/unpackerr/unpackerr.conf";
        Restart = "on-failure";
        RestartSec = 5;
      };
    };

    wizarr = {
      description = "Wizarr docker image";
      after = [
        "docker.service"
        "network-online.target"
      ];
      wants = [
        "docker.service"
        "network-online.target"
      ];
      wantedBy = [
        "multi-user.target"
      ];

      serviceConfig = {
        ExecStart = "${pkgs.docker}/bin/docker run --name wizarr --rm -p 5690:5690 -e TZ='America/Chicago' -e STORAGE_DIR=/data/storage -e DB_DIR=/data/db -v /var/lib/wizarr/storage:/data/storage -v /var/lib/wizarr/db:/data/db ${wizarrImage}";
        ExecStop = "${pkgs.docker}/bin/docker stop wizarr";
        Restart = "on-failure";
        RestartSec = 5;
      };
    };

    qbittorrent = {
      description = "qbittorrent-nox";
      after = [ "network.target" ];
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        Type = "simple";
        User = "qbittorrent";
        Group = "download";
        ExecStart = "${pkgs.qbittorrent-nox}/bin/qbittorrent-nox --webui-port=8080 --profile=/var/lib/qbittorrent";
        Restart = "on-failure";
        RestartSec = 5;
      };
    };
  };
}
