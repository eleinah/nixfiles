{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./firewall.nix
    ./sys.nix
  ];
}
