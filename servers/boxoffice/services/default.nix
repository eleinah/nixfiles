{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./jelly.nix
    ./servarr.nix
    ./systemd
  ];
}
