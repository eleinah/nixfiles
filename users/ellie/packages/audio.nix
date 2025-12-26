{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    kew
    qpwgraph
    supercollider
    deezer-enhanced
  ];
}
