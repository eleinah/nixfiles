{ config, pkgs, ... }:

{
  imports = [
    ./files
    ./packages
    ./programs
  ];
  home = {
    username = "ellie";
    homeDirectory = "/home/ellie";
  };
}
