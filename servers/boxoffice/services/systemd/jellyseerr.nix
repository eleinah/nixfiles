{
  config,
  lib,
  pkgs,
  ...
}:

let
  jellyseerrImage = "ghcr.io/fallenbagel/jellyseerr:latest";
in
{
  systemd.services.jellyseerr-docker = {
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
}
