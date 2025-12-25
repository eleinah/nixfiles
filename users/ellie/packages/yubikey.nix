{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    yubico-pam
    yubikey-manager
  ];
}
