{ config, pkgs, ... }:

{
  file = {
    ".config" = {
        source = ../home/dots/.config;
        recursive = true;
      };
  };
}
