{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];

  networking.wireguard.interfaces = {
    wg0 = {
      ips = [ "10.99.99.99/32" ];

      # TODO: get secrets manager working
      privateKeyFile = "";

      peers = [
        {
          publicKey = "/yHUcOEdNd9L/CDlKu9zw/xU4O4ENLK2iguE/MH/20M=";
          endpoint = "vpn.eleina.sh:51820";
          allowedIPs = [ "0.0.0.0/0" "::/0" ];
          persistentKeepalive = 25;
        };
      ];
    };
  };
}
