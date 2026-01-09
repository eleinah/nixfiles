{
  config,
  lib,
  pkgs,
  ...
}:

let
  jellyseerrImage = "ghcr.io/fallenbagel/jellyseerr:latest";
  jfaImage = "hrfee/jfa-go";
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

    jfa-go = {
      description = "jfa-go docker image for invite management";
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
        ExecStart = "${pkgs.docker}/bin/docker run --name jfa-go --rm -p 8056:8056 -e TZ='America/Chicago' -v /var/lib/jfa-go:/data -v /etc/localtime:/etc/localtime:ro ${jfaImage}";
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
