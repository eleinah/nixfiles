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

    ".gnupg/gpg-agent.conf" = {
      source = ./dots/.gnupg/gpg-agent.conf;
    };

    ".gnupg/gpg.conf" = {
      source = ./dots/.gnupg/gpg.conf;
    };

    ".gnupg/scdaemon.conf" = {
      source = ./dots/.gnupg/scdaemon.conf;
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
