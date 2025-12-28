{
  config,
  lib,
  pkgs,
  ...
}:

{
  systemd.services.qbittorrent = {
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
}
