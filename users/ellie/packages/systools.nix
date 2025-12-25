{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    sysstat
    lm_sensors
    ethtool
    pciutils
    usbutils
  ];
}
