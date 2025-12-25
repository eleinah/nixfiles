{ config, pkgs, ... }:

{
  imports = [
    ./sys.nix
    ./wireguard.nix
  ];
}
