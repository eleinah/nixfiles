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

    ".ssh/config" = {
      source = ./dots/.ssh/config;
    };

  };
}
