{ config, pkgs, ... }:

{
  imports = [
    ../../../common/programs
    ./steam.nix
  ];
}
