{
  config,
  lib,
  pkgs,
  ...
}:

{
  systemd.services.unpackerr = {
    description = "unpackerr daemon";
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
}
