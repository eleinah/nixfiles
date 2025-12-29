{
  config,
  lib,
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    yubikey-manager
    yubikey-personalization
  ];
}
