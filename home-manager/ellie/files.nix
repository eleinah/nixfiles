{ config, pkgs, ... }:

{
  home.file = {

    ".config" = {
      source = ./config;
      recursive = true;
    };

    ".ssh/config" = {
      source = ./ssh/config;
    };

    "Pictures/wallpapers" = {
      source = ./wallpapers;
      recursive = true;
    };

  };
}
