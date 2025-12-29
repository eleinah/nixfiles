{ config, pkgs, ... }:

{
  home.file = {

    ".config" = {
      source = ./dots/.config;
      recursive = true;
    };

    ".ssh/config" = {
      source = ./dots/.ssh/config;
    };

    "Pictures/wallpapers" = {
      source = ./wallpapers;
      recursive = true;
    };

  };
}
