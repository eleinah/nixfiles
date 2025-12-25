{ config, pkgs, ... }:

{
  packages = with pkgs; [
    gamescope
    prismlauncher
  ];
}
