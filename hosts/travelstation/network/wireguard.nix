{ config, pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    wireguard-tools
  ];

  networking.wireguard = {
    enable = true;
  };

  networking.firewall.checkReversePath = "loose";
}
