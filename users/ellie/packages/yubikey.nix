{ config, pkgs, ... }:

{
  packages = with pkgs; [
    yubico-pam
    yubikey-manager
  ];
}
