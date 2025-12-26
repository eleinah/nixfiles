{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    kew
    qpwgraph
    supercollider
  ];
}
