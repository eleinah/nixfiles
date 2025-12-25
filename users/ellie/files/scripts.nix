{ config, pkgs, ... }:

{
  home.file = {
    "scripts" = {
        source = ../home/scripts;
        recursive = true;
        executable = true;
      };
  };
}
