{ config, pkgs, inputs, ... }:

{
  environment.systemPackages = with pkgs; [
    inputs.niri.packages."${pkgs.system}".niri
  ];
}
