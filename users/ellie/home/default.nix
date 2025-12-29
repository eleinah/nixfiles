{ config, pkgs, ... }:

{
  home.file = {

    ".config" = {
      source = ./dots/.config;
      recursive = true;
    };

    "scripts" = {
      source = ./scripts;
      recursive = true;
      executable = true;
    };

    ".gnupg" = {
      source = ./dots/.gnupg;
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
