{ config, pkgs, ... }:

{
  imports = [
    ../../../common/network
    ./sys.nix
  ];
}
