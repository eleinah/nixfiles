{ config, pkgs, inputs, ... }:

{
  home.packages = with pkgs; [
    inputs.niri.packages."${pkgs.system}".niri
  ];
}
