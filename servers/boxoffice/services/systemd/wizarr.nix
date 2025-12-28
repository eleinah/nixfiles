{
  config,
  lib,
  pkgs,
  ...
}:

let
  wizarrImage = "ghcr.io/wizarrrr/wizarr:latest";
in
{
  systemd.services.wizarr = {
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
    };
  };
}
