{ config, pkgs, ... }:

{
  home = {
    username = "ellie";
    homeDirectory = "/home/ellie";

    imports = [
      ./files
      ./packages
    ];
  };

  programs = {
    imports = [
      ./programs
    ];
  };
}
